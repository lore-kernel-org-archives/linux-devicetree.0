Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DC2C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 01:37:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB9322054F
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 01:37:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bmJQH7uR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgENBhc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 21:37:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51468 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgENBhb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 May 2020 21:37:31 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C807E51F;
        Thu, 14 May 2020 03:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589420250;
        bh=AZvfkT/3qOUK0pEh61PQ1h6H54uQqgG9FuCVwwTWtqU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bmJQH7uRpm7kKV/n2mhcUI/9VCqmpuykmeG9q5pJqwgU40PBQEFxIU1XHFh++ggVY
         Y84bkYR4/cKygjDfFbMRjHV69E42fivEHhsDVTnAWE1rmjMxghgq/IyDuZtoXsNb3y
         /bjlbUGvwerR53+amcYxkbmNf2WIdWD/8kFSZh8o=
Date:   Thu, 14 May 2020 04:37:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
        robh+dt@kernel.org, xuwei5@hisilicon.com
Subject: Re: [PATCH v2 4/6] arm64: dts: hisilicon: hikey: fixes to comply
 with adi,adv7533 DT binding
Message-ID: <20200514013723.GD7425@pendragon.ideasonboard.com>
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
 <20200511110611.3142-5-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200511110611.3142-5-ricardo.canuelo@collabora.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Mon, May 11, 2020 at 01:06:09PM +0200, Ricardo Cañuelo wrote:
> hi3660-hikey960.dts:
>   Define a 'ports' node for 'adv7533: adv7533@39' and the
>   'adi,dsi-lanes' property to make it compliant with the adi,adv7533 DT
>   binding.
> 
>   This fills the requirements to meet the binding requirements,
>   remote endpoints are not defined.
> 
> hi6220-hikey.dts:
>   Change property name s/pd-gpio/pd-gpios, gpio properties should be
>   plural. This is just a cosmetic change.
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 11 +++++++++++
>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts    |  2 +-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> index e035cf195b19..8c4bfbaf3a80 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> @@ -530,6 +530,17 @@
>  		status = "ok";
>  		compatible = "adi,adv7533";
>  		reg = <0x39>;
> +		adi,dsi-lanes = <4>;
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			port@0 {
> +				reg = <0>;
> +			};
> +			port@1 {
> +				reg = <1>;
> +			};
> +		};
>  	};
>  };
>  
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> index c14205cd6bf5..3e47150c05ec 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> @@ -516,7 +516,7 @@
>  		reg = <0x39>;
>  		interrupt-parent = <&gpio1>;
>  		interrupts = <1 2>;
> -		pd-gpio = <&gpio0 4 0>;
> +		pd-gpios = <&gpio0 4 0>;
>  		adi,dsi-lanes = <4>;
>  		#sound-dai-cells = <0>;
>  

-- 
Regards,

Laurent Pinchart
