From: Michel Pollet <michel.pollet@bp.renesas.com>
Subject: [RFC 2/3] ARM: dts: Renesas RZ/N1D SMP enable method
Date: Mon, 16 Apr 2018 10:34:58 +0100
Message-ID: <1523871304-48517-4-git-send-email-michel.pollet@bp.renesas.com>
References: <1523871304-48517-1-git-send-email-michel.pollet@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523871304-48517-1-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>
Cc: phil.edworthy@renesas.com, buserror+upstream@gmail.com, Michel Pollet <michel.pollet@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Andy Gross <andy.gross@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Juri Lelli <juri.lelli@arm.com>, Carlo Caione <carlo@endlessm.com>, Rajendra Nayak <rnayak@codeaurora.org>, Frank Rowand <frank.rowand@sony.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add a special enable method for the second CA7 of the Renesas RZ/N1D
(R9A06G032), as well as the default value for the "cpu-release-addr"
property.

Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
---
 arch/arm/boot/dts/r9a06g032.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index 7d84b38..50f3043d 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -33,6 +33,8 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <1>;
+			enable-method = "renesas,r9a06g032-smp";
+			cpu-release-addr = <0x4000c204>;
 		};
 	};
 
-- 
2.7.4
