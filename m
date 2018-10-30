Return-Path: <SRS0=ocas=NK=verge.net.au=horms@kernel.org>
Date: Tue, 30 Oct 2018 16:51:51 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] ARM: dts: iwg23s-sbc: Enable cmt0
Message-ID: <20181030155151.7jxqfzvd4y44zuij@verge.net.au>
References: <1540543709-35959-1-git-send-email-biju.das@bp.renesas.com>
 <1540543709-35959-2-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1540543709-35959-2-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Oct 26, 2018 at 09:48:29AM +0100, Biju Das wrote:
> This patch enables cmt0 support on the iWave iwg23s sbc.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks, I applied this for v4.21, resolving a conflict.
The result is as follows:

From: Biju Das <biju.das@bp.renesas.com>
Date: Fri, 26 Oct 2018 09:48:29 +0100
Subject: [PATCH] ARM: dts: iwg23s-sbc: Enable cmt0

This patch enables cmt0 support on the iWave iwg23s sbc.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index ffd8216f28c3..295f11afac21 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -77,6 +77,10 @@
 	clock-frequency = <20000000>;
 };
 
+&cmt0 {
+	status = "okay";
+};
+
 &pfc {
 	mmc_pins_uhs: mmc_uhs {
 		groups = "mmc_data8", "mmc_ctrl";
-- 
2.11.0
