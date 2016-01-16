From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [PATCH v3 0/2] ARM: dts: imx6: Add support for Toradex Apalis iMX6Q/D SoM/Ixora carrier board
Date: Sat, 16 Jan 2016 02:51:05 +0100
Message-ID: <1452909067-1998-1-git-send-email-marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Lucas Stach <l.stach@pengutronix.de>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>, Shawn Guo <shawn.guo@linaro.org>, Fabio Estevam <festevam@gmail.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stefan Agner <stefan@agner.ch>, Joshua Clayton <stillcompiling@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org


This patch series adds support for Toradex Apalis iMX6Q/D SoM module [1=
] and
Ixora carrier board [2].

Petr =C5=A0tetiar has simply taken content of DTSes from Toradex's Git =
tree [3],
removed not mainlined stuff and fixed all errors returned by checkpatch=
 script.

Please note that RESET_MOCI# used as mini-PCIe PERST# is not directly
GPIO1_IO28 but rather inverted (e.g. active-high and ored with RESETBMC=
U coming
off the PMIC but that is not relevant in this context). As changing the
reset-gpio polarity wasn't previously supported Petr =C5=A0tetiar's
"PCI: imx6: Fix reset-gpio to work with active low GPIO" fix [4] is nee=
ded.

1. https://www.toradex.com/computer-on-modules/apalis-arm-family/freesc=
ale-imx-6
2. https://www.toradex.com/products/carrier-boards/ixora-carrier-board
3. https://git.toradex.com/cgit/linux-toradex.git/log/?h=3Dtoradex_imx_=
3.14.28_1.0.0_ga
4. https://patchwork.ozlabs.org/patch/552886/

Changes in v3:
- integrated review feedback from Petr
- integrated review feedback from Stefan
- move I2C DDC enablement and assignement handling into carrier board D=
TS where it belongs
- move CAN nodes up a little to keep the alphabetical order
- added an explanatory comment about PWR_I2C usage
- integrated review feedback from Petr
- integrated review feedback from Stefan
- fix comment concerning Apalis GPIO usage as GPIO7 is only used for PC=
Ie switch reset on Apalis Evaluation board
- move I2C DDC handling into carrier board DTS where it belongs
- simplify RTC alias

Changes in v2:
- clarify exact Apalis iMX6Q/D SoM type in cover letter
- clarify exact Apalis iMX6Q/D module type and Ixora carrier board in m=
odel
  node
- got rid of obsolete mmc aliases
- working SGTL5000 audio/sound integration
- working STMPE811 touch screen controller integration
- integrated review feedback from Lucas
- left and even added some more comments as I don't see why putting any
  explanatory comments in dts' should be such a bad thing to do
- completely got rid of the memory node as that is something typically =
filled
  in by the boot loader e.g. U-Boot
- without the regulators simple-bus it no longer boots
- even though we supposedly shipped a few hundred V1.0a modules drop DC=
E UART
  support for now and simplify file layout
- replaced obsolete no-1-8-v by mainline supported voltage-ranges =3D <=
3300 3300>
  usdhc property and yes card detects are indeed active low (;-p)
- integrated review feedback from Stefan
- fixed Ethernet PHY reset & interrupt (requires Micrel PHY driver to b=
e
  enabled)
- fixed HDMI DDC (requires GPIO-based bitbanging I2C to be enabled)
- fixed SPDIF
- clarify exact Apalis iMX6Q/D SoM type in cover letter
- clarify exact Apalis iMX6Q/D module type and Ixora carrier board in m=
odel
  node
- got rid of obsolete mmc aliases
- working SGTL5000 audio/sound integration
- working STMPE811 touch screen controller integration
- integrated review feedback from Lucas
- left and even added some more comments as I don't see why putting any
  explanatory comments in dts' should be such a bad thing to do
- completely got rid of the memory node as that is something typically =
filled
  in by the boot loader e.g. U-Boot
- without the regulators simple-bus it no longer boots
- even though we supposedly shipped a few hundred V1.0a modules drop DC=
E UART
  support for now and simplify file layout
- replaced obsolete no-1-8-v by mainline supported voltage-ranges =3D <=
3300 3300>
  usdhc property and yes card detects are indeed active low (;-p)
- integrated review feedback from Stefan
- fixed Ethernet PHY reset & interrupt (requires Micrel PHY driver to b=
e
  enabled)
- fixed HDMI DDC (requires GPIO-based bitbanging I2C to be enabled)
- fixed SPDIF

Petr =C5=A0tetiar (2):
  ARM: dts: imx6: Add support for Toradex Apalis iMX6Q/D SoM
  ARM: dts: imx6: Add support for Toradex Ixora carrier board

 arch/arm/boot/dts/Makefile               |    1 +
 arch/arm/boot/dts/imx6q-apalis-ixora.dts |  275 ++++++++
 arch/arm/boot/dts/imx6qdl-apalis.dtsi    | 1012 ++++++++++++++++++++++=
++++++++
 3 files changed, 1288 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6q-apalis-ixora.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-apalis.dtsi

--=20
2.5.0
