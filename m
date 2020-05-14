Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB65C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 01:37:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 173912054F
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 01:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nHOcYkTd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgENBh6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 21:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725925AbgENBh6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 13 May 2020 21:37:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B408C061A0C
        for <devicetree@vger.kernel.org>; Wed, 13 May 2020 18:37:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A007C51F;
        Thu, 14 May 2020 03:37:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589420276;
        bh=N4lCU0zXsWxvmQtZ5sTeg28V0mz07vTG0n3Pl7thUAI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nHOcYkTdSgwwQsJPKR14GXEeCVquu35YFxuIuwcpmvPc0j6ZDUAjXgWCOcp0FI8iW
         8Y80lJ1EH8hq+/lfvytj/VR1y9BTsuaTKzo7vdHoulLb8d101K/hLxgMYNtZZGYZJC
         BtkBqX+AP7RYCLMs0wZhtauVlisqaw7wsWQdGwt4=
Date:   Thu, 14 May 2020 04:37:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
        robh+dt@kernel.org, xuwei5@hisilicon.com
Subject: Re: [PATCH v2 5/6] ARM: dts: iwg20d-q7-dbcm-ca: remove unneeded
 properties in hdmi@39
Message-ID: <20200514013750.GE7425@pendragon.ideasonboard.com>
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
 <20200511110611.3142-6-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200511110611.3142-6-ricardo.canuelo@collabora.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Mon, May 11, 2020 at 01:06:10PM +0200, Ricardo Cañuelo wrote:
> Remove the adi,input-style and adi,input-justification properties of
> hdmi@39 to make it compliant with the "adi,adv7511w" DT binding.
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi b/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
> index ede2e0c999b1..e10f99278c77 100644
> --- a/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
> +++ b/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
> @@ -72,8 +72,6 @@
>  		adi,input-depth = <8>;
>  		adi,input-colorspace = "rgb";
>  		adi,input-clock = "1x";
> -		adi,input-style = <1>;
> -		adi,input-justification = "evenly";
>  
>  		ports {
>  			#address-cells = <1>;

-- 
Regards,

Laurent Pinchart
