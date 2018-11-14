From: Janek Kotas <jank@cadence.com>
Subject: [PATCH 0/2] clk: Add driver and bindings for Fixed MMIO clock
Date: Wed, 14 Nov 2018 15:24:17 +0000
Message-ID: <37A652CE-2DB0-4232-8F94-F11A38D2FA76@global.cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <18C1E87ACC78DA4FB2C6CB876CF17F8B@namprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This patchset adds a driver support for Fixed Memory Mapped IO clock.

The driver reads a clock frequency value from a single 32-bit memory
mapped register and registers it as a fixed rate clock.

It can be useful for prototyping Linux on various hardware platforms.

Jan Kotas (2):
  dt-bindings: clk: Add bindings for Fixed MMIO clock
  clk: Add Fixed MMIO clock driver

 .../devicetree/bindings/clock/fixed-mmio-clock.txt | 22 ++++++++++
 drivers/clk/Kconfig                                |  6 +++
 drivers/clk/Makefile                               |  1 +
 drivers/clk/clk-fixed-mmio.c                       | 49 ++++++++++++++++++=
++++
 4 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/fixed-mmio-cloc=
k.txt
 create mode 100644 drivers/clk/clk-fixed-mmio.c

--=20
2.15.0
