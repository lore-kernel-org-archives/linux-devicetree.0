From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH v2 0/8] regulator: support Silergy SY8824C/SY8824E etc.
Date: Wed, 28 Aug 2019 06:08:09 +0000
Message-ID: <20190828135646.52457ac3@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <60EC053632AE7C439CA40447EB6F4990@namprd03.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add support for Silergy SY8824C/SY8824E/SY20276/SY20278 regulator.

Changes since v1:
  - use c++ comment style for SPDX header
  - add prefix for BUCK_EN and MODE

Jisheng Zhang (8):
  regulator: add binding for the SY8824C voltage regulator
  regulator: add support for SY8824C regulator
  dt-bindings: sy8824x: Document SY8824E support
  regulator: sy8824x: add SY8824E support
  dt-bindings: sy8824x: Document SY20276 support
  regulator: sy8824x: add SY20276 support
  dt-bindings: sy8824x: Document SY20278 support
  regulator: sy8824x: add SY20278 support

 .../devicetree/bindings/regulator/sy8824x.txt |  24 ++
 drivers/regulator/Kconfig                     |   7 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/sy8824x.c                   | 231 ++++++++++++++++++
 4 files changed, 263 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/sy8824x.txt
 create mode 100644 drivers/regulator/sy8824x.c

--=20
2.23.0.rc1
