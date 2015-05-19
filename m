From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 0/2] BCM6358 LED driver
Date: Tue, 19 May 2015 19:12:56 +0200
Message-ID: <1432055578-14089-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Sender: linux-leds-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, cooloney@gmail.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com, j.anaszewski@samsung.com
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

These patches add support and documentation for the BCM6358 LED driver,=
 which is present on BCM6358 and BCM6368.
In these SoCs there are Serial LEDs (LEDs connected to a 74hc controlle=
r), which can either be controlled by software (exporting the 74hc as s=
pi-gpio) or hardware using this driver.

=C3=81lvaro Fern=C3=A1ndez Rojas (2):
  leds: add DT binding for BCM6358 LED controller
  leds: add BCM6358 LED driver

 .../devicetree/bindings/leds/leds-bcm6358.txt      | 145 +++++++++++++
 drivers/leds/Kconfig                               |   8 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-bcm6358.c                        | 241 +++++++++++++=
++++++++
 4 files changed, 395 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6358=
=2Etxt
 create mode 100644 drivers/leds/leds-bcm6358.c

--=20
1.9.1
