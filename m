From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 6/7] arm64: dts: r8a7795: Add device node for PRR
Date: Mon, 31 Oct 2016 12:30:54 +0100
Message-ID: <1477913455-5314-7-git-send-email-geert+renesas@glider.be>
References: <1477913455-5314-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477913455-5314-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yangbo Lu <yangbo.lu@nxp.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add a device node for the Product Register, which provides SoC product
and revision information.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 681f54422375f4f7..a39a702b904da73c 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -321,6 +321,11 @@
 			#power-domain-cells = <0>;
 		};
 
+		prr: chipid@fff00044 {
+			compatible = "renesas,prr";
+			reg = <0 0xfff00044 0 4>;
+		};
+
 		sysc: system-controller@e6180000 {
 			compatible = "renesas,r8a7795-sysc";
 			reg = <0 0xe6180000 0 0x0400>;
-- 
1.9.1
