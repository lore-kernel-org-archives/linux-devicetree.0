Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB649C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 08:31:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 992102068F
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 08:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594629096;
	bh=FsFblUdL5K5d2aFPvTZlzHuZddUIieZMqtgdM3CU/po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=0ar1kkMvn++OTY54GPxgBnCyApE231rFXtXZ7C5+6jWlumtIJb9Orr+k4xTySnAPl
	 IdMw3rJCW+hZIQl1WAdjdysu4RtlyQAMcaLHt3qctXT0TuUqSBfjIfv58j9j2DPofZ
	 OJLudIdo1THfnch2mKL3I8nNXT38N0qLsZkSB8V8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbgGMIbg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 04:31:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:33866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725818AbgGMIbg (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 13 Jul 2020 04:31:36 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C60362067D;
        Mon, 13 Jul 2020 08:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594629095;
        bh=FsFblUdL5K5d2aFPvTZlzHuZddUIieZMqtgdM3CU/po=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VcssKVuD/CLz2ppkMgV25dtCwaGPQkvDDD9harM49EQqHQvivUa34cBlj8IDVJ/Ho
         sU1wTda0feaoQJeFygOzSTeihQeZlxc/jhopd0UmnZ65o/TMOmkIeYKXRjo2VlPrVX
         kk+JMXngbaqfitIeLMrjLrEZ7PY3B6VIFuCGqIMw=
Date:   Mon, 13 Jul 2020 16:31:30 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, devicetree@vger.kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH 1/4] doc: dt-binding: ci-hdrc-usb2: add property for imx
 picophy
Message-ID: <20200713083129.GC15718@dragon>
References: <20200709105902.23165-1-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709105902.23165-1-peter.chen@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jul 09, 2020 at 06:58:59PM +0800, Peter Chen wrote:
> Add two parameters which are used to tune USB signal for imx picophy,
> picophy is used at imx7d, imx8mm, and imx8mn.
> 
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> index 51376cbe5f3d..e9858dafb08f 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> @@ -100,6 +100,13 @@ i.mx specific properties
>    It's recommended to specify the over current polarity.
>  - power-active-high: power signal polarity is active high
>  - external-vbus-divider: enables off-chip resistor divider for Vbus
> +- picophy,pre-emp-curr-control: HS Transmitter Pre-Emphasis Current

'picophy' should be documented in vendor-prefixes.yaml?

Shawn

> +  Control. This signal controls the amount of current sourced to the
> +  USB_OTG*_DP and USB_OTG*_DN pins after a J-to-K or K-to-J transition.
> +  Details can refer to TXPREEMPAMPTUNE0 bits of USBNC_n_PHY_CFG1.
> +- picophy,dc-vol-level-adjust: HS DC Voltage Level Adjustment.
> +  Adjust the high-speed transmitter DC level voltage, details can refer
> +  to TXVREFTUNE0 bits of USBNC_n_PHY_CFG1.
>  
>  Example:
>  
> -- 
> 2.17.1
> 
