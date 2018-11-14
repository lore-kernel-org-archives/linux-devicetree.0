From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.18 24/59] ARM: dts: fsl: Fix improperly quoted stdout-path values
Date: Wed, 14 Nov 2018 17:22:56 -0500
Message-ID: <20181114222335.99339-24-sashal@kernel.org>
References: <20181114222335.99339-1-sashal@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181114222335.99339-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh@kernel.org>

[ Upstream commit 1af6ab3bac8458fc2e92ad7bb97b62de4a1fddef ]

A quoted label reference doesn't expand to the node path and is taken as
a literal string. Dropping the quotes can fix this unless the baudrate
string is appended in which case we have to use the alias.

At least on VF610, the problem was masked by setting the console in
bootargs. Use the alias syntax with baudrate parameter so we can drop
setting the console in bootargs.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/imx53-ppd.dts       | 2 +-
 arch/arm/boot/dts/vf610m4-colibri.dts | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx53-ppd.dts b/arch/arm/boot/dts/imx53-ppd.dts
index 3aa6f693fa9f..1228789f0f3a 100644
--- a/arch/arm/boot/dts/imx53-ppd.dts
+++ b/arch/arm/boot/dts/imx53-ppd.dts
@@ -55,7 +55,7 @@
 	};
 
 	chosen {
-		stdout-path = "&uart1:115200n8";
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory@70000000 {
diff --git a/arch/arm/boot/dts/vf610m4-colibri.dts b/arch/arm/boot/dts/vf610m4-colibri.dts
index 41ec66a96990..ca6249558760 100644
--- a/arch/arm/boot/dts/vf610m4-colibri.dts
+++ b/arch/arm/boot/dts/vf610m4-colibri.dts
@@ -50,8 +50,8 @@
 	compatible = "fsl,vf610m4";
 
 	chosen {
-		bootargs = "console=ttyLP2,115200 clk_ignore_unused init=/linuxrc rw";
-		stdout-path = "&uart2";
+		bootargs = "clk_ignore_unused init=/linuxrc rw";
+		stdout-path = "serial2:115200";
 	};
 
 	memory@8c000000 {
-- 
2.17.1
