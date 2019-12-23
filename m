Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD631C3F68F
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 06:28:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 87A312081E
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 06:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577082487;
	bh=AzNaaYdA+aO/mCr5Q/bSgxjw+1HDyCMO7xiteViwaCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ozaHs3NQjUGgu4iQWfzphawjs70YwQyV8u1pxJcWcKmMJmZlVsDvcZl2+WQfjkNwa
	 WbCSBedQWZfmMGu2u9GliI5T86gSv1F3aHqxSmlXvETNaskVr+flyYzr6V8AvVQhsu
	 6mnSYPvW4y8/3Cee5J2vsDcwHJOUHsTs92yZ3j64=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbfLWG2G (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Dec 2019 01:28:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:39036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725811AbfLWG2G (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 23 Dec 2019 01:28:06 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C093B206B7;
        Mon, 23 Dec 2019 06:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577082486;
        bh=AzNaaYdA+aO/mCr5Q/bSgxjw+1HDyCMO7xiteViwaCk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hJjOGS/r/xF2npfcwighqSOeBXm0ja3MQ28pkg7dxCq6h4WnIrWmMm367hTV4Y51n
         sEL2QNmy/3/oO+/ZAfSF8balkwUrb9CPMrlUARbKqHnUaxGxtmQYW2UC74etXyPkLd
         0U/uK4NwFU8/cRtljxtinWM5/8TP7m65dPG2lYvw=
Date:   Mon, 23 Dec 2019 14:27:45 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     robh+dt@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx7: Unify temp-grade and speed-grade nodes
Message-ID: <20191223062744.GL11523@dragon>
References: <20191212133800.17929-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212133800.17929-1-festevam@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Dec 12, 2019 at 10:38:00AM -0300, Fabio Estevam wrote:
> The following warning is seen when building with W=1:
> 
> arch/arm/boot/dts/imx7s.dtsi:551.39-553.7: Warning (unique_unit_address): /soc/aips-bus@30000000/ocotp-ctrl@30350000/temp-grade@10: duplicate unit-address (also used in node /soc/aips-bus@30000000/ocotp-ctrl@30350000/speed-grade@10)
> 
> Since temp-grade and speed-grade point to the same node, replace them by
> a single one to avoid the duplicate unit-address warning.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  arch/arm/boot/dts/imx7d.dtsi | 2 +-
>  arch/arm/boot/dts/imx7s.dtsi | 9 ++-------
>  2 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
> index d8acd7cc7918..92f6d0c2a74f 100644
> --- a/arch/arm/boot/dts/imx7d.dtsi
> +++ b/arch/arm/boot/dts/imx7d.dtsi
> @@ -12,7 +12,7 @@
>  			clock-frequency = <996000000>;
>  			operating-points-v2 = <&cpu0_opp_table>;
>  			#cooling-cells = <2>;
> -			nvmem-cells = <&cpu_speed_grade>;
> +			nvmem-cells = <&fuse_grade>;
>  			nvmem-cell-names = "speed_grade";
>  		};
>  
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index 1b812f4e7453..05d099da5a02 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -152,8 +152,7 @@
>  		interrupt-parent = <&gpc>;
>  		interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
>  		fsl,tempmon = <&anatop>;
> -		nvmem-cells = <&tempmon_calib>,
> -			<&tempmon_temp_grade>;
> +		nvmem-cells = <&tempmon_calib>,	<&fuse_grade>;
>  		nvmem-cell-names = "calib", "temp_grade";
>  		clocks = <&clks IMX7D_PLL_SYS_MAIN_CLK>;
>  	};
> @@ -548,11 +547,7 @@
>  					reg = <0x3c 0x4>;
>  				};
>  
> -				tempmon_temp_grade: temp-grade@10 {
> -					reg = <0x10 0x4>;
> -				};
> -
> -				cpu_speed_grade: speed-grade@10 {
> +				fuse_grade: temp-grade@10 {

Rename the node to fuse-grade too?

Shawn

>  					reg = <0x10 0x4>;
>  				};
>  			};
> -- 
> 2.17.1
> 
