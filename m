From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v2 01/11] dt-bindings: cp110: fix name of the GOP gate clock
Date: Wed, 31 May 2017 15:41:45 +0200
Message-ID: <2ad931cb6c6efbb3b75ddd18c0c2dd7ccefa1a5e.1496237893.git-series.gregory.clement@free-electrons.com>
References: <cover.d3a417499f4e5f039deaa27832bf6eccdd090a6f.1496237893.git-series.gregory.clement@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.d3a417499f4e5f039deaa27832bf6eccdd090a6f.1496237893.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.d3a417499f4e5f039deaa27832bf6eccdd090a6f.1496237893.git-series.gregory.clement@free-electrons.com>
References: <cover.d3a417499f4e5f039deaa27832bf6eccdd090a6f.1496237893.git-series.gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, Kostya Porotchkin <kostap@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Omri Itach <omrii@marvell.com>, Shadi Ammouri <shadi@marvell.com>
List-Id: devicetree@vger.kernel.org

This patch updates the documentation according to the change made in the
patch "clk: mvebu: cp110 fix name of the GOP gate clock": the GOP
clock (bit 18) is not at all used for emmc but only for GOP.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
index 07dbb358182c..eb6cf44caa0f 100644
--- a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
@@ -45,7 +45,7 @@ The following clocks are available:
    - 1 15	SATA
    - 1 16	SATA USB
    - 1 17	Main
-   - 1 18	SD/MMC/GOP
+   - 1 18	GOP
    - 1 21	Slow IO (SPI, NOR, BootROM, I2C, UART)
    - 1 22	USB3H0
    - 1 23	USB3H1
@@ -65,7 +65,7 @@ Required properties:
 	"cpm-audio", "cpm-communit", "cpm-nand", "cpm-ppv2", "cpm-sdio",
 	"cpm-mg-domain", "cpm-mg-core", "cpm-xor1", "cpm-xor0", "cpm-gop-dp", "none",
 	"cpm-pcie_x10", "cpm-pcie_x11", "cpm-pcie_x4", "cpm-pcie-xor", "cpm-sata",
-	"cpm-sata-usb", "cpm-main", "cpm-sd-mmc-gop", "none", "none", "cpm-slow-io",
+	"cpm-sata-usb", "cpm-main", "cpm-gop", "none", "none", "cpm-slow-io",
 	"cpm-usb3h0", "cpm-usb3h1", "cpm-usb3dev", "cpm-eip150", "cpm-eip197";
 
 Example:
@@ -78,6 +78,6 @@ Example:
 		gate-clock-output-names = "cpm-audio", "cpm-communit", "cpm-nand", "cpm-ppv2", "cpm-sdio",
 			"cpm-mg-domain", "cpm-mg-core", "cpm-xor1", "cpm-xor0", "cpm-gop-dp", "none",
 			"cpm-pcie_x10", "cpm-pcie_x11", "cpm-pcie_x4", "cpm-pcie-xor", "cpm-sata",
-			"cpm-sata-usb", "cpm-main", "cpm-sd-mmc-gop", "none", "none", "cpm-slow-io",
+			"cpm-sata-usb", "cpm-main", "cpm-gop", "none", "none", "cpm-slow-io",
 			"cpm-usb3h0", "cpm-usb3h1", "cpm-usb3dev", "cpm-eip150", "cpm-eip197";
 	};
-- 
git-series 0.9.1
