From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v7 3/3] ARM: dts: Renesas R9A06G032 SMP enable method
Date: Thu, 28 Jun 2018 14:18:14 +0200
Message-ID: <20180628121813.ffrppdo7p3s42t5i@verge.net.au>
References: <1530173842-56851-1-git-send-email-michel.pollet@bp.renesas.com>
 <1530173842-56851-4-git-send-email-michel.pollet@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1530173842-56851-4-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michel Pollet <michel.pollet@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, phil.edworthy@renesas.com, Michel Pollet <buserror+upstream@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Douglas Anderson <dianders@chromium.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Rajendra Nayak <rnayak@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, Stefan Wahren <stefan.wahren@i2se.com>, Carlo Caione <carlo@endlessm.com>, Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 28, 2018 at 09:17:14AM +0100, Michel Pollet wrote:
> Add a special enable method for the second CA7 of the R9A06G032
> as well as the default value for the "cpu-release-addr" property.
> 
> Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.

I had to manually resolve a conflict due to updates to the patch
that added this dtsi file (as noted elsewhere). Please check that this is
correct.


From: Michel Pollet <michel.pollet@bp.renesas.com>
Subject: [PATCH] ARM: dts: Renesas R9A06G032 SMP enable method

Add a special enable method for the second CA7 of the R9A06G032
as well as the default value for the "cpu-release-addr" property.

Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r9a06g032.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index 339d0958011e..afe29c95a006 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -29,6 +29,8 @@
 			compatible = "arm,cortex-a7";
 			reg = <1>;
 			clocks = <&sysctrl 84>;
+			enable-method = "renesas,r9a06g032-smp";
+			cpu-release-addr = <0 0x4000c204>;
 		};
 	};
 
-- 
2.11.0
