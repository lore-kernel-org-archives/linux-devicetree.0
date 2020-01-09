Return-Path: <SRS0=GIEZ=26=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABBFC32771
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 08:06:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 247DF2073A
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 08:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578557173;
	bh=frNZUoA+Js9y3eU3kSR8bgFjwgkS8/kuonlvihAjvSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=BO37JQ7Q1M6pSX8xBblL7dwyyomUbEp6PS82KftQZLBABD0QTsx1vsKOBW+3M+3nb
	 x7E4TTCBVUW7MFYtYg6TygoZaZ/CVV6uyBXR/uj2mLmMStnZ5udZx+hXBVxMLsgQCD
	 U+Y/CI6+cBHdrVoVwoD+zgNTUF2dg0z30Bxhz7e8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728428AbgAIIGM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jan 2020 03:06:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:54096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728397AbgAIIGM (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 9 Jan 2020 03:06:12 -0500
Received: from T480 (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2AD092072E;
        Thu,  9 Jan 2020 08:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578557171;
        bh=frNZUoA+Js9y3eU3kSR8bgFjwgkS8/kuonlvihAjvSc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xBzTtAbqVqwWdnLfufSeO/2oD0lXsmooGNSAkKrGGsuS9kgdh7wr5AtP4gvTt3wfS
         jHRPs2tIVoDk3dn73pXnetxFjVD+BZ+I4rkE/d7JRC/hJ3g6BXcNRB10m5Oyv97k2k
         An0CEXzsb6W8Xv02Uvn/qPtBhvTSFB1tKHzCaDBE=
Date:   Thu, 9 Jan 2020 16:06:01 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, andreas@kemnade.info,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH 1/5] ARM: dts: imx6qdl-sabresd: Remove incorrect power
 supply assignment
Message-ID: <20200109080600.GH4456@T480>
References: <1577670071-1322-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577670071-1322-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Dec 30, 2019 at 09:41:07AM +0800, Anson Huang wrote:
> The vdd3p0's input should be from external USB VBUS directly, NOT

Shouldn't USB VBUS usually be 5V?  It doesn't seem to match 3.0V which
is suggested by vdd3p0 name.

> PMIC's sw2, so remove the power supply assignment for vdd3p0.
> 
> Fixes: 93385546ba36 ("ARM: dts: imx6qdl-sabresd: Assign corresponding power supply for LDOs")

Is it only a description correcting or is it fixing a real problem?  I'm
trying to understand it is a 5.5-rc material or can be applied for 5.6.

Shawn

> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  arch/arm/boot/dts/imx6qdl-sabresd.dtsi | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> index 71ca76a..fe59dde 100644
> --- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> @@ -749,10 +749,6 @@
>  	vin-supply = <&vgen5_reg>;
>  };
>  
> -&reg_vdd3p0 {
> -	vin-supply = <&sw2_reg>;
> -};
> -
>  &reg_vdd2p5 {
>  	vin-supply = <&vgen5_reg>;
>  };
> -- 
> 2.7.4
> 
