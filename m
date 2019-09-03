From: Philippe Schenker <philippe.schenker@toradex.com>
Subject: [PATCH 0/3] Add new binding regulator-fixed-clock to regulator-fixed
Date: Tue, 3 Sep 2019 08:03:45 +0000
Message-ID: <20190903080336.32288-1-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Max Krummenacher <max.krummenacher@toradex.com>, Rob Herring <robh+dt@kernel.org>, Stefan Agner <stefan.agner@toradex.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mark Rutland <mark.rutland@arm.com>, Luka Pivk <luka.pivk@toradex.com>, Philippe Schenker <philippe.schenker@toradex.com>, Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org


Our hardware has a FET that is switching power rail of the ethernet PHY
on and off. This switching enable signal is a clock from the SoC.

There is no possibility in regulator subsystem to have this hardware
reflected in software.

I already discussed with Mark Brown about possible solutions and he
suggested to create at least a new compatible. [1]
This discussion includes also a better explanation of our circuit as
well as schematics. So please refer to that link if you have questions
about that.

In this first attempt I created a new binding "regulator-fixed-clock"
that can take a clock from devicetree. This is a simple addition to
regulator-fixed. If the binding regulator-fixed-clock is given, the
clock is simply enabled on regulator enable and disabled on regulator
disable.
To be able to have multiple consumers a counter variable is also given
that tells how many consumers need power from this regulator.

Best regards,
Philippe

[1] https://lkml.org/lkml/2019/8/7/78



Philippe Schenker (3):
  regulator: fixed: add possibility to enable by clock
  ARM: dts: imx6ull-colibri: add phy-supply and respective regulator
  dt-bindings: regulator: add regulator-fixed-clock binding

 .../bindings/regulator/fixed-regulator.yaml   | 18 +++-
 arch/arm/boot/dts/imx6ull-colibri.dtsi        | 12 +++
 drivers/regulator/fixed.c                     | 86 ++++++++++++++++++-
 3 files changed, 112 insertions(+), 4 deletions(-)

--=20
2.23.0
