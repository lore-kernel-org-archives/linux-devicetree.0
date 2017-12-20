From: <jan.tuerk@emtrion.com>
Subject: [PATCH v2 0/5] Add basic support for emtrion emCON-MX6 modules
Date: Wed, 20 Dec 2017 14:47:00 +0100
Message-ID: <20171220134710.64479-1-jan.tuerk@emtrion.com>
References: <20171123125600.41562-1-jan.tuerk@emtrion.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171123125600.41562-1-jan.tuerk@emtrion.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Kevin Hilman <khilman@baylibre.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, SZ Lin <sz.lin@moxa.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Jan Tuerk <jan.tuerk@emtrion.com>

The following patch-series adds support for emtrion's emCON-MX6 modules 
with all their dependencies. 
The focus is based on the emtrion standard developer-kit configuration. 
It includes a new vendor-prefix, an new simple-panel type, 
a small modification of the imx6dl.dtsi, 
as well as modifications of the common imx_v6_v7_defconfig.
And finally the board devicetrees themselves.

For V2 there are some changes and small fixes following below. 
The smtp issue which was converting tabs into spaces should be fixed now, 
so checkpatch should only warn about the new Documentation files and the
new devicetree bindings which are documented in the corresponding patch.

The documentation for the EDT display is kept as an extra file currently,
as it is done by the most displays in the documentation. Also a new 
new Vartiant of the EDT already arrived. So merging their documentations
should be discussed separately.

  [PATCH v2 1/5] drm/panel: Add support for the EDT ETM0700G0BDH6
	No changes, resend.

  [PATCH v2 2/5] dt-bindings: Add vendor prefix for emtrion GmbH
	v2:
	 - Reviewed-by: Andreas Färber <afaerber@suse.de>
	 - Acked-by: Rob Herring <robh@kernel.org>

  [PATCH v2 3/5] ARM: dts: imx: Add an cpu0 label for imx6dl devices.
	v2:
	 - Reviewed-by: Andreas Färber <afaerber@suse.de>

  [PATCH v2 4/5] ARM: dts: Add support for emtrion emCON-MX6 series
	Changes in v2:
	 - Fixed typo (reg_prallel.. --> reg_parallel)
	 - Removed trailing new-line
	 - Fix uppercase addresses as Rob H. noted
	 - Fix warning about lcd@di0 -> rename to disp0
	 - Renamed some nodes regarding Rob H.

  [PATCH v2 5/5] ARM: imx_v6_v7_defconfig: Enable DA0963 PMIC support.
	No changes, resend.


 Documentation/devicetree/bindings/arm/emtrion.txt  |  13 +
 .../bindings/display/panel/edt,etm0700g0bdh6.txt   |   9 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/imx6dl-emcon-avari.dts           | 233 ++++++
 arch/arm/boot/dts/imx6dl-emcon.dtsi                |  37 +
 arch/arm/boot/dts/imx6dl.dtsi                      |   2 +-
 arch/arm/boot/dts/imx6q-emcon-avari.dts            | 233 ++++++
 arch/arm/boot/dts/imx6q-emcon.dtsi                 |  37 +
 arch/arm/boot/dts/imx6qdl-emcon.dtsi               | 848 ++++++++++++++++
 arch/arm/configs/imx_v6_v7_defconfig               |   4 +
 drivers/gpu/drm/panel/panel-simple.c               |  15 +
 12 files changed, 1433 insertions(+), 1 deletion(-)

-- 
emtrion GmbH
Alter Schlachthof 45
76131 Karlsruhe
GERMANY
https://www.emtrion.de

Amtsgericht Mannheim
HRB 110 300
Geschäftsführer: Dieter Baur, Ramona Maurer
