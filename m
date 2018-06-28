From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v9 3/5] ARM: dts: Renesas R9A06G032 base device tree file
Date: Thu, 28 Jun 2018 14:00:32 +0200
Message-ID: <20180628120031.eq2yuysz4re2olwn@verge.net.au>
References: <1528973829-25493-1-git-send-email-michel.pollet@bp.renesas.com>
 <1528973829-25493-4-git-send-email-michel.pollet@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1528973829-25493-4-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michel Pollet <michel.pollet@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, phil.edworthy@renesas.com, Michel Pollet <buserror+upstream@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 14, 2018 at 11:56:32AM +0100, Michel Pollet wrote:
> This adds the Renesas R9A06G032 bare bone support.
> 
> This currently only handles the SYSCTRL block note,
> generic parts (gic, architected timer) and a UART.
> 
> Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, applied with the following appended:

diff --git a/MAINTAINERS b/MAINTAINERS
index 9d5eeff51b5f..4c85ac04872d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1969,6 +1969,7 @@ S:	Supported
 F:	arch/arm/boot/dts/emev2*
 F:	arch/arm/boot/dts/r7s*
 F:	arch/arm/boot/dts/r8a*
+F:	arch/arm/boot/dts/r9a*
 F:	arch/arm/boot/dts/sh*
 F:	arch/arm/configs/shmobile_defconfig
 F:	arch/arm/include/debug/renesas-scif.S
