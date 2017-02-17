From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: r8a7795: Upgrade to PSCI v1.0 to support Suspend-to-RAM
Date: Fri, 17 Feb 2017 18:00:31 +0100
Message-ID: <1487350832-29820-2-git-send-email-geert+renesas@glider.be>
References: <1487350832-29820-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1487350832-29820-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Khiem Nguyen <khiem.nguyen.xt@renesas.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

From: Khiem Nguyen <khiem.nguyen.xt@renesas.com>

>From PSCI v1.0, Suspend-to-RAM is supported via SYSTEM_SUSPEND PSCI
function call. Hence, upgrade PSCI version for R-Car H3 to support
Suspend-to-RAM.

The Suspend-to-RAM is highly dependent on ARM Trusted Firwmare support
since necessary callback functions will be registered after a query
to ARM Trusted Firmware about SYSTEM_SUSPEND support.

Since PSCI v1.0 is backward compatible with PSCI v0.2, CPU Hotplug and
CPUIdle should be able to work normally with this change.

Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Khiem: I've updated your email address.
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 98cd42f586b5fd62..4eae2d471d41ee55 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -29,7 +29,7 @@
 	};
 
 	psci {
-		compatible = "arm,psci-0.2";
+		compatible = "arm,psci-1.0";
 		method = "smc";
 	};
 
-- 
1.9.1
