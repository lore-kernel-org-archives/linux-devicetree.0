Return-Path: <SRS0=bp0t=UQ=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v2 0/3] Add Support for Kontron SMARC-sAMX6i
Date: Mon, 17 Jun 2019 18:14:29 +0200
Message-Id: <20190617161432.32268-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, shawnguo@kernel.org, linux-imx@nxp.com
Cc: devicetree@vger.kernel.org, Gilles.Buloz@kontron.com, frieder.schrempf@kontron.de, thomas.schaefer@kontron.com, Stefan.Nickl@kontron.com, Michael.Brunner@kontron.com, kernel@pengutronix.de, festevam@gmail.com, plaes@plaes.org
List-ID: <devicetree@vger.kernel.org>

Hi,

this v2 covers the feedback made on my v1 [1]. Patch 3-17 are now
squashed into one patch.

[1] https://www.spinics.net/lists/devicetree/msg287251.html

Marco Felsch (1):
  dt-bindings: add Kontron vendor prefix

Michael Grzeschik (1):
  ARM: dts: imx6qdl-kontron-samx6i: add Kontron SMARC SoM Support

Priit Laes (1):
  ARM: dts: imx6qdl-kontron-samx6i: Add iMX6-based Kontron SMARC-sAMX6i
    module

 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/imx6dl-kontron-samx6i.dtsi  |  12 +
 arch/arm/boot/dts/imx6q-kontron-samx6i.dtsi   |  36 +
 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi | 815 ++++++++++++++++++
 4 files changed, 865 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-kontron-samx6i.dtsi
 create mode 100644 arch/arm/boot/dts/imx6q-kontron-samx6i.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi

-- 
2.20.1
