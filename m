From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC v3 05/22] ARM: dts: r8a7790: Add device node for RST module
Date: Wed,  1 Jun 2016 21:21:03 +0200
Message-ID: <1464808880-343-6-git-send-email-geert+renesas@glider.be>
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
  - Use "renesas,<soctype>-rst" instead of "renesas,rst-<soctype>",
  - Drop "syscon" compatible value,

v2:
  - Correct unit address,
  - Drop RFC status and TODO,
  - Change one-line summary prefix to match current arm-soc practices.
---
 arch/arm/boot/dts/r8a7790.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 9997e7dfabe2250c..0c548e9b180b6c1d 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1481,6 +1481,11 @@
 		};
 	};
 
+	rst: reset-controller@e6160000 {
+		compatible = "renesas,r8a7790-rst";
+		reg = <0 0xe6160000 0 0x0100>;
+	};
+
 	sysc: system-controller@e6180000 {
 		compatible = "renesas,r8a7790-sysc";
 		reg = <0 0xe6180000 0 0x0200>;
-- 
1.9.1
