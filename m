From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 6/7] arm64: dts: r8a7795: Add missing properties to CA57 L2 cache node
Date: Mon, 15 Feb 2016 21:38:34 +0100
Message-ID: <1455568715-20880-7-git-send-email-geert+renesas@glider.be>
References: <1455568715-20880-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1455568715-20880-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, Sudeep Holla <sudeep.holla@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add the missing "cache-unified" and "cache-level" properties to the
Cortex-A57 cache-controller node.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Remaining part of "[PATCH v2 6/6] arm64: renesas: r8a7795: Add L2
    cache-controller nodes", after dropping the "arm,data-latency" and
    "arm,tag-latency" properties.
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index b5e46e4ff72ad003..c07f4e83b988ba42 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -68,6 +68,8 @@
 
 	L2_CA57: cache-controller@0 {
 		compatible = "cache";
+		cache-unified;
+		cache-level = <2>;
 	};
 
 	extal_clk: extal {
-- 
1.9.1
