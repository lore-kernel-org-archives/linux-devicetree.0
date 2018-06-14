From: Michel Pollet <michel.pollet@bp.renesas.com>
Subject: [PATCH v5 3/3] ARM: dts: Renesas R9A06G032 SMP enable method
Date: Thu, 14 Jun 2018 11:58:58 +0100
Message-ID: <1528973943-28132-4-git-send-email-michel.pollet@bp.renesas.com>
References: <1528973943-28132-1-git-send-email-michel.pollet@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528973943-28132-1-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>
Cc: phil.edworthy@renesas.com, Michel Pollet <buserror+upstream@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Frank Rowand <frank.rowand@sony.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Carlo Caione <carlo@endlessm.com>, Stefan Wahren <stefan.wahren@i2se.com>, Rajendra Nayak <rnayak@codeaurora.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add a special enable method for the second CA7 of the R9A06G032
as well as the default value for the "cpu-release-addr" property.

Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r9a06g032.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index 353e06f..3e45375 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -30,6 +30,8 @@
 			compatible = "arm,cortex-a7";
 			reg = <1>;
 			clocks = <&sysctrl R9A06G032_CLK_A7MP>;
+			enable-method = "renesas,r9a06g032-smp";
+			cpu-release-addr = <0 0x4000c204>;
 		};
 	};
 
-- 
2.7.4
