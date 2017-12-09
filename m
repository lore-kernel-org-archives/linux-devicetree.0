From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 0/2] iio: magnetometer: Infineon TLV493D-A1B6 support
Date: Sun, 10 Dec 2017 00:25:05 +0100
Message-ID: <20171209232507.18594-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Marius Tarcatu <marius.tarcatu-d0qZbvYSIPpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

This mini-series adds initial support for the Infineon TLV493D-A1B6 3D Magnetic
Sensor found on the Infineon 3D Magnetic Sensor 2Go Kit.

Tested on a Raspberry Pi 3 with a DT Overlay.
https://github.com/afaerber/dt-overlays/blob/master/bcm2837-rpi-3-b%2Btlv493d-a1b6.dts

Have a lot of fun!

Cheers,
Andreas

Cc: Marius Tarcatu <marius.tarcatu-d0qZbvYSIPpWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Andreas Färber (2):
  dt-bindings: Add Infineon TLV493D-A1B6
  iio: magnetometer: Add Infineon TLV493D-A1B6

 .../devicetree/bindings/trivial-devices.txt        |   1 +
 drivers/iio/magnetometer/Kconfig                   |   9 +
 drivers/iio/magnetometer/Makefile                  |   2 +
 drivers/iio/magnetometer/tlv493d.c                 | 328 +++++++++++++++++++++
 4 files changed, 340 insertions(+)
 create mode 100644 drivers/iio/magnetometer/tlv493d.c

-- 
2.13.6
