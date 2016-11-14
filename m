From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 09/11] ARM: dts: r8a7794: Add device node for PRR
Date: Mon, 14 Nov 2016 19:37:15 +0100
Message-ID: <1479148637-5399-10-git-send-email-geert+renesas@glider.be>
References: <1479148637-5399-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1479148637-5399-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Dirk Behme <dirk.behme@de.bosch.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add a device node for the Product Register, which provides SoC product
and revision information.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Add to posted series,

v2:
  - New.
---
 arch/arm/boot/dts/r8a7794.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 364b4aa8d1c1aa28..63dc7f29d216c32e 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -1377,6 +1377,11 @@
 		};
 	};
 
+	prr: chipid@ff000044 {
+		compatible = "renesas,prr";
+		reg = <0 0xff000044 0 4>;
+	};
+
 	sysc: system-controller@e6180000 {
 		compatible = "renesas,r8a7794-sysc";
 		reg = <0 0xe6180000 0 0x0200>;
-- 
1.9.1
