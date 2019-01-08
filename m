From: "Wiebe, Wladislav (Nokia - DE/Ulm)" <wladislav.wiebe@nokia.com>
Subject: [PATCH 0/2] Support for ARM Cortex A15 L2 internal asynchronous error
 detection
Date: Tue, 8 Jan 2019 08:10:20 +0000
Message-ID: <AM6PR0702MB3799317C93057F1EA6C86393FA8A0@AM6PR0702MB3799.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "davem@davemloft.net" <davem@davemloft.net>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "arnd@arndb.de" <arnd@arndb.de>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "bp@alien8.de" <bp@alien8.de>, "mchehab@kernel.org" <mchehab@kernel.org>"akpm@linux-foundation.org" <akpm@linux-foundation.org>"nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>"arnd@arndb.de" <arnd@arndb.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This patch series adds support for L2 internal asynchronous error detection
caused by L2 RAM double-bit ECC error or illegal writes to the
Interrupt Controller memory-map region on the Cortex A15.

Testing:
- works as module (loadable & unloadable) - OK
- works as build in kernel driver - OK
- interrupt registration - OK
- appears in EDAC subsystem/sysfs - OK

Wladislav Wiebe (2):
  dt-bindings: edac: ARM Cortex A15 L2 asynchronous error detection
  EDAC: add ARM Cortex A15 L2 internal asynchronous error detection driver

 .../bindings/edac/cortex_a15_l2_async_edac.txt     |  22 ++++
 MAINTAINERS                                        |   8 ++
 drivers/edac/Kconfig                               |  11 ++
 drivers/edac/Makefile                              |   1 +
 drivers/edac/cortex_a15_l2_async_edac.c            | 134 +++++++++++++++++=
++++
 5 files changed, 176 insertions(+)
 create mode 100644 .../bindings/edac/cortex_a15_l2_async_edac.txt
 create mode 100644 drivers/edac/cortex_a15_l2_async_edac.c

--=20
2.16.1
