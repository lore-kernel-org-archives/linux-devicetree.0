From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 03/23] ARM: dts: r8a7778: Add device node for RESET/WDT module
Date: Fri, 21 Oct 2016 15:17:17 +0200
Message-ID: <1477055857-17936-4-git-send-email-geert+renesas@glider.be>
References: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
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
 arch/arm/boot/dts/r8a7778.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
index e571d66ea0fe1721..3d0a18abd408c76d 100644
--- a/arch/arm/boot/dts/r8a7778.dtsi
+++ b/arch/arm/boot/dts/r8a7778.dtsi
@@ -626,4 +626,9 @@
 				"sru-src6", "sru-src7", "sru-src8";
 		};
 	};
+
+	rst: reset-controller@ffcc0000 {
+		compatible = "renesas,r8a7778-reset-wdt";
+		reg = <0xffcc0000 0x40>;
+	};
 };
-- 
1.9.1
