From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC v3 10/22] arm64: renesas: r8a7796 dtsi: Add device node for RST module
Date: Wed,  1 Jun 2016 21:21:08 +0200
Message-ID: <1464808880-343-11-git-send-email-geert+renesas@glider.be>
References: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add a device node for the RST module, which provides a.o. reset control
and mode pin monitoring.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - New.
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index fab61eddede3818c..cb7cd9dceafe4c40 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -107,6 +107,11 @@
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
