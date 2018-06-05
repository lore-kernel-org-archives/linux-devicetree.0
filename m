From: Michel Pollet <michel.pollet@bp.renesas.com>
Subject: [PATCH v4 1/3] dt-bindings: cpu: Add Renesas R9A06G032 SMP enable method.
Date: Tue,  5 Jun 2018 12:28:46 +0100
Message-ID: <1528198148-23308-2-git-send-email-michel.pollet@bp.renesas.com>
References: <1528198148-23308-1-git-send-email-michel.pollet@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528198148-23308-1-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>
Cc: phil.edworthy@renesas.com, Michel Pollet <buserror+upstream@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Carlo Caione <carlo@endlessm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Douglas Anderson <dianders@chromium.org>, Kevin Hilman <khilman@baylibre.com>, Frank Rowand <frank.rowand@sony.com>, Florian Fainelli <f.fainelli@gmail.com>, Rajendra Nayak <rnayak@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add a special enable method for second CA7 of the R9A06G032

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
