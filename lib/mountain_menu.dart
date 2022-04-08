library mountain_menu;

import 'package:flutter/material.dart';
import 'package:mountain_menu/arc.dart';
import 'package:mountain_menu/arc_border.dart';
import 'package:mountain_menu/positions.dart';

class MountainMenu extends StatefulWidget {
  final Color color;
  final double? mainButtonElevation;
  final Color? buttonBackgroundColor;
  final Color? iconColor;
  final IconData menuIcon;
  final List<Widget> menus;
  final ValueChanged<int> onChange;
  final Curve? curve;
  final double? borderWidth;
  final Duration? duration;
  final Color? borderColor;
  final bool mini;

  const MountainMenu(
      {Key? key,
      required this.color,
      required this.menuIcon,
      required this.menus,
      required this.onChange,
      required this.mini,
      this.mainButtonElevation,
      this.borderWidth,
      this.duration,
      this.borderColor,
      this.curve,
      this.buttonBackgroundColor,
      this.iconColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MountainMenuState();
  }
}

class _MountainMenuState extends State<MountainMenu>
    with SingleTickerProviderStateMixin {
  bool _showMenu = false;
  late AnimationController _controller;
  final Positions _positions = Positions(); //Positions for menus

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration ?? const Duration(milliseconds: 700),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.menus.isEmpty || widget.menus.length > 5) {
      throw UnimplementedError("Menus length is not sufficient!");
    } else {
      return AnimatedContainer(
        duration: widget.duration ?? const Duration(milliseconds: 400),
        child: CustomPaint(
          painter: ArcBorder(
              color: widget.borderColor ?? Colors.yellow,
              borderWidth: widget.borderWidth),
          child: CustomPaint(
            painter: ArcContainer(color: widget.color),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .15,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  if (_showMenu && widget.menus.length > 1)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SlideTransition(
                        position:
                            _positions.topButton().animate(CurvedAnimation(
                                  parent: _controller,
                                  curve: widget.curve != null
                                      ? widget.curve as Curve
                                      : Curves.easeInOut,
                                )),
                        child: FloatingActionButton(
                          heroTag: "menuTop",
                          backgroundColor: widget.buttonBackgroundColor,
                          mini: widget.mini,
                          onPressed: () async {
                            widget.onChange(1);
                            _animate();
                          },
                          child: widget.menus[1],
                        ),
                      ),
                    ),
                  Positioned(
                    bottom: 8,
                    left: 0,
                    right: 0,
                    child: FloatingActionButton(
                      heroTag: "mainButton",
                      elevation: widget.mainButtonElevation,
                      backgroundColor: Colors.transparent,
                      mini: widget.mini,
                      onPressed: () async {
                        _animate();
                      },
                      child: Icon(
                        _showMenu ? Icons.close : widget.menuIcon,
                        color: widget.iconColor,
                      ),
                    ),
                  ),
                  if (_showMenu && widget.menus.isNotEmpty)
                    Positioned(
                      top: MediaQuery.of(context).size.height * .06,
                      left: MediaQuery.of(context).size.width * .2,
                      child: SlideTransition(
                        position: _positions.halfLeft().animate(CurvedAnimation(
                              parent: _controller,
                              curve: widget.curve != null
                                  ? widget.curve as Curve
                                  : Curves.easeInOut,
                            )),
                        child: FloatingActionButton(
                          mini: widget.mini,
                          heroTag: "menuLeft",
                          backgroundColor: widget.buttonBackgroundColor,
                          onPressed: () async {
                            widget.onChange(0);
                            _animate();
                          },
                          child: widget.menus[0],
                        ),
                      ),
                    ),
                  if (_showMenu && widget.menus.length > 2)
                    Positioned(
                      top: MediaQuery.of(context).size.height * .06,
                      right: MediaQuery.of(context).size.width * .2,
                      child: SlideTransition(
                        position:
                            _positions.halfRight().animate(CurvedAnimation(
                                  parent: _controller,
                                  curve: widget.curve != null
                                      ? widget.curve as Curve
                                      : Curves.easeOut,
                                )),
                        child: FloatingActionButton(
                          heroTag: "menuRight",
                          mini: widget.mini,
                          backgroundColor: widget.buttonBackgroundColor,
                          onPressed: () async {
                            widget.onChange(2);
                            _animate();
                          },
                          child: widget.menus[2],
                        ),
                      ),
                    ),
                  if (_showMenu && widget.menus.length > 3)
                    Positioned(
                      left: 16,
                      bottom: 5,
                      child: SlideTransition(
                        position: _positions.left().animate(CurvedAnimation(
                              parent: _controller,
                              curve: widget.curve != null
                                  ? widget.curve as Curve
                                  : Curves.easeOut,
                            )),
                        child: FloatingActionButton(
                          heroTag: "left",
                          mini: widget.mini,
                          backgroundColor: widget.buttonBackgroundColor,
                          onPressed: () async {
                            widget.onChange(3);
                            _animate();
                          },
                          child: widget.menus[3],
                        ),
                      ),
                    ),
                  if (_showMenu && widget.menus.length > 4)
                    Positioned(
                      right: 16,
                      bottom: 5,
                      child: SlideTransition(
                        position: _positions.right().animate(CurvedAnimation(
                              parent: _controller,
                              curve: widget.curve != null
                                  ? widget.curve as Curve
                                  : Curves.easeOut,
                            )),
                        child: FloatingActionButton(
                          heroTag: "right",
                          mini: widget.mini,
                          backgroundColor: widget.buttonBackgroundColor,
                          onPressed: () async {
                            widget.onChange(4);
                            _animate();
                          },
                          child: widget.menus[4],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  void _animate() async {
    if (_showMenu) {
      await _controller.reverse();
      setState(() => _showMenu = !_showMenu);
    } else {
      setState(() => _showMenu = !_showMenu);
      await _controller.forward(from: 0);
    }
  }
}
