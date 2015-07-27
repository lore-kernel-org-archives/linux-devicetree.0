From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 6/7] ARM64: zynqmp: Enable sdhci on ep108
Date: Mon, 27 Jul 2015 11:48:14 +0200
Message-ID: <f6be42a011f11a399e04939f726bcefb202eba49.1437990464.git.michal.simek@xilinx.com>
References: <48a75b64b05dc094e34fe27e5d03552dbfe77fe2.1437990464.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <48a75b64b05dc094e34fe27e5d03552dbfe77fe2.1437990464.git.michal.simek@xilinx.com>
In-Reply-To: <48a75b64b05dc094e34fe27e5d03552dbfe77fe2.1437990464.git.michal.simek@xilinx.com>
References: <48a75b64b05dc094e34fe27e5d03552dbfe77fe2.1437990464.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, devicetree@vger.kernel.org, monstr@monstr.eu, Suneel Garapati <suneel.garapati@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Enable both sdhcis on ep108.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
index faee1617ab16..206e18eca2fb 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
@@ -55,6 +55,14 @@
 	ceva,broken-gen2;
 };
 
+&sdhci0 {
+	status = "okay";
+};
+
+&sdhci1 {
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
2.3.5
