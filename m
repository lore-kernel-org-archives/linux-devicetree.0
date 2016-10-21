From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 04/23] ARM: dts: r8a7779: Add device node for RESET/WDT module
Date: Fri, 21 Oct 2016 15:17:18 +0200
Message-ID: <1477055857-17936-5-git-send-email-geert+renesas@glider.be>
References: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add a device node for the RESET/WDT module, which provides a.o. reset
control, mode pin monitoring, and watchdog control.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Dirk Behme <dirk.behme@de.bosch.com>
---
v4:
  - Add Acked-by,

v3:
  - New.
---
 arch/arm/boot/dts/r8a7779.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index b9bbcce69dfbd5b9..4a30b232624e1d24 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -595,4 +595,9 @@
 		reg = <0xffd85000 0x0200>;
 		#power-domain-cells = <1>;
 	};
+
+	rst: reset-controller@ffcc0000 {
+		compatible = "renesas,r8a7779-reset-wdt";
+		reg = <0xffcc0000 0x48>;
+	};
 };
-- 
1.9.1
