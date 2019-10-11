From: Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH 0/3] Add new Overkiz Kizbox3 support
Date: Fri, 11 Oct 2019 14:50:19 +0200
Message-ID: <20191011125022.16329-1-kamel.bouhara@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, linux-arm-kernel@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kamel Bouhara <kamel.bouhara@bootlin.com>
List-Id: devicetree@vger.kernel.org

Add support for the Kizbox3 Overkiz SAS boards.
Those boards are based on the Atmel SAMA5D27 SoC.

Kamel Bouhara (3):
  dt-bindings: Add vendor prefix for Overkiz SAS
  dt-bindings: arm: at91: Document Kizbox3 HS board binding
  ARM: at91: add Overkiz KIZBOX3 board

 .../devicetree/bindings/arm/atmel-at91.yaml   |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/at91-kizbox3-hs.dts         | 309 +++++++++++++
 arch/arm/boot/dts/at91-kizbox3_common.dtsi    | 412 ++++++++++++++++++
 5 files changed, 731 insertions(+)
 create mode 100644 arch/arm/boot/dts/at91-kizbox3-hs.dts
 create mode 100644 arch/arm/boot/dts/at91-kizbox3_common.dtsi

--
2.23.0
