From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 3/3] arm64: dts: marvell: adjust name of sd-mmc-gop clock in syscon
Date: Tue, 13 Dec 2016 13:41:20 +0100
Message-ID: <1481632880-9198-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1481632880-9198-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1481632880-9198-1-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Cc: Marcin Wojtas <mw@semihalf.com>, Nadav Haklai <nadavh@marvell.com>, Hanna Hawa <hannah@marvell.com>, Yehuda Yitschak <yehuday@marvell.com>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

This commit adjusts the names of gatable clock #18 of the Marvell Armada
CP110 system controller. This clock not only controls SD/MMC, but also
the GOP (Group Of Ports) used for networking. So the clock is renamed to
{cpm,cps}-sd-mmc-gop instead of {cpm,cps}-sd-mmc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi | 2 +-
 arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
index 602e2c2..895babc 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
@@ -74,7 +74,7 @@
 					"cpm-gop-dp", "none", "cpm-pcie_x10",
 					"cpm-pcie_x11", "cpm-pcie_x4", "cpm-pcie-xor",
 					"cpm-sata", "cpm-sata-usb", "cpm-main",
-					"cpm-sd-mmc", "none", "none",
+					"cpm-sd-mmc-gop", "none", "none",
 					"cpm-slow-io", "cpm-usb3h0", "cpm-usb3h1",
 					"cpm-usb3dev", "cpm-eip150", "cpm-eip197";
 			};
diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
index 6bf9e24..db99646 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
@@ -74,7 +74,7 @@
 					"cps-gop-dp", "none", "cps-pcie_x10",
 					"cps-pcie_x11", "cps-pcie_x4", "cps-pcie-xor",
 					"cps-sata", "cps-sata-usb", "cps-main",
-					"cps-sd-mmc", "none", "none",
+					"cps-sd-mmc-gop", "none", "none",
 					"cps-slow-io", "cps-usb3h0", "cps-usb3h1",
 					"cps-usb3dev", "cps-eip150", "cps-eip197";
 			};
-- 
2.7.4

