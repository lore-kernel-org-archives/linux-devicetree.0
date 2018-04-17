From: Michel Pollet <michel.pollet@bp.renesas.com>
Subject: [PATCH v2 1/3] dt-bindings: cpu: Add Renesas RZ/N1D SMP enable method.
Date: Tue, 17 Apr 2018 13:48:00 +0100
Message-ID: <1523969291-41756-2-git-send-email-michel.pollet@bp.renesas.com>
References: <1523969291-41756-1-git-send-email-michel.pollet@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523969291-41756-1-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>
Cc: phil.edworthy@renesas.com, Michel Pollet <buserror+upstream@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Rowand <frank.rowand@sony.com>, Kevin Hilman <khilman@baylibre.com>, Stefan Wahren <stefan.wahren@i2se.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Carlo Caione <carlo@endlessm.com>, Chen-Yu Tsai <wens@csie.org>, Juri Lelli <juri.lelli@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add a special enable method for second CA8 of the Renesas RZ/N1D
(R9A06G032).

Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/cpus.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index 29e1dc5..b395d107 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -219,6 +219,7 @@ described below.
 			    "qcom,kpss-acc-v1"
 			    "qcom,kpss-acc-v2"
 			    "renesas,apmu"
+			    "renesas,r9a06g032-smp"
 			    "rockchip,rk3036-smp"
 			    "rockchip,rk3066-smp"
 			    "ste,dbx500-smp"
-- 
2.7.4
