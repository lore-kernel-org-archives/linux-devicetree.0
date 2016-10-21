From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 11/23] arm64: renesas: r8a7796 dtsi: Add device node for RST module
Date: Fri, 21 Oct 2016 15:17:25 +0200
Message-ID: <1477055857-17936-12-git-send-email-geert+renesas@glider.be>
References: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add a device node for the RST module, which provides a.o. reset control
and mode pin monitoring.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Dirk Behme <dirk.behme@de.bosch.com>
---
v4:
  - Add Acked-by,

v3:
  - New.
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 9217da9835256573..75c8c55a824835bf 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -233,6 +233,11 @@
 			#power-domain-cells = <0>;
 		};
 
+		rst: reset-controller@e6160000 {
+			compatible = "renesas,r8a7796-rst";
+			reg = <0 0xe6160000 0 0x0200>;
+		};
+
 		sysc: system-controller@e6180000 {
 			compatible = "renesas,r8a7796-sysc";
 			reg = <0 0xe6180000 0 0x0400>;
-- 
1.9.1
