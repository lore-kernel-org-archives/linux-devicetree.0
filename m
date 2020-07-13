Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA2AC433E6
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 08:36:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6899E2073A
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 08:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594629368;
	bh=3tNASh6dCFNL/Yoj0vIRww+r644Q2ydE+mPBio/NrKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=VyS5dfSLTpbMqmBQolVnwCmWs7qWiGRYzlkyc8fWfGGqTKOwSypILizY88+n/5NYr
	 zbLwL/s4pwsBOpi/1PIbyPCIQFwjg/3wSF8hGzjk8EU6y/kklxumGuVjS1K+WD6CLa
	 8EqGUq/7ZuvbimoxhyY8bsXoc671zjo76Rgi0b9A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgGMIgH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 04:36:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:35580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725818AbgGMIgG (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 13 Jul 2020 04:36:06 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 75F482065D;
        Mon, 13 Jul 2020 08:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594629366;
        bh=3tNASh6dCFNL/Yoj0vIRww+r644Q2ydE+mPBio/NrKI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NxpxFaCht4DI+lqJvN8uqKv51dpT86bDfjcCoRLAJCE+CUXm6V/0s55F8oDKypc27
         l2wu9HHteEc29PTyIDh8oCZIIQIW47J9n3OO5qG7r028ZSvNKXV6iMf4sb9K1WTiHf
         nmEXAheRTLplE2k3AfyD9zFMbVH7S1Sw+7Xk1EMI=
Date:   Mon, 13 Jul 2020 16:36:01 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, devicetree@vger.kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH 3/4] ARM64: dts: fsl: imx8mm-evk: add two parameters for
 picophy tuning
Message-ID: <20200713083600.GD15718@dragon>
References: <20200709105902.23165-1-peter.chen@nxp.com>
 <20200709105902.23165-3-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709105902.23165-3-peter.chen@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jul 09, 2020 at 06:59:01PM +0800, Peter Chen wrote:
> With these two parameters tuning, it can pass USB eye diagram at evk board.
> 
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>

It's not so consistent, but idiomatically we prefix arm i.MX
platform/dts patches like 'ARM: ...', but 'arm64: ...' for arm64 ones.
Also with 'imx8mm-evk' in prefix, it's good enough to know this is
fsl/imx patch, so I suggest prefix like:

 'arm64: dts: imx8mm-evk: ...'

Shawn

> ---
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> index 0f1d7f8aeac4..c432b628e1ed 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> @@ -324,6 +324,8 @@
>  	srp-disable;
>  	adp-disable;
>  	usb-role-switch;
> +	picophy,pre-emp-curr-control = <3>;
> +	picophy,dc-vol-level-adjust = <7>;
>  	status = "okay";
>  
>  	port {
> -- 
> 2.17.1
> 
