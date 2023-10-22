import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // Gambar latar belakang
            Image.asset(
              'lib/images/background.jpg', // Sesuaikan dengan path gambar Anda
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'Welcome to A*Linium!',
                    style: TextStyle(
                      color: Color.fromARGB(244, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                // AnimatedRotation untuk ikon bintang
                const AnimatedRotation(
                  duration: Duration(milliseconds: 50),
                  child: Icon(
                    Icons.star_half_sharp,
                    color: Color.fromARGB(255, 255, 255, 255),
                    size: 100,
                  ),
                ),
                const Center(
                  child: Text(
                    'Are you ready to explore the galaxy?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: const Text(
                    'Change Account',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan tindakan yang sesuai untuk tombol "Let's Explore" di sini
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Let's Explore",
                        style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.rocket_launch_outlined,
                        color: Color.fromARGB(255, 217, 109, 51)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedRotation extends StatefulWidget {
  final Duration duration;
  final Widget child;

  const AnimatedRotation({super.key, 
    required this.duration,
    required this.child,
  });

  @override
  _AnimatedRotationState createState() => _AnimatedRotationState();
}

class _AnimatedRotationState extends State<AnimatedRotation> {
  double _rotation = 0;

  @override
  void initState() {
    super.initState();
    _rotate();
  }

  void _rotate() {
    Future.delayed(widget.duration, () {
      setState(() {
        _rotation += 0.1; // Kecepatan putaran ikon
        if (_rotation >= 360) {
          _rotation = 0;
        }
        _rotate();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _rotation,
      child: widget.child,
    );
  }
}
