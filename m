Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3181FC433E4
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 17:03:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E41D82070A
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 17:03:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="fh02pe9z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727908AbgETRDs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 13:03:48 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:41692 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726845AbgETRD2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 20 May 2020 13:03:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=5Nq/Qbw+3jcIDdGGvZz/h/9HcUwoFW2MiffJT/Jkch4=; b=fh02pe9zBhFyvy8Q0SyEGgnuOF
        n3PAAcVM732AOdMf59KhPzQVsE1vAK/D6iJABmW8AZGk5m0ijc1tUebzWyIoRRv2qhTCJedEnw6FX
        JHeAjytBBgsx69WD7t4Rret+6TTkGrn20H960k5IJmfbHNjHx/CdOHesQKWMXiOkUMCk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1jbS7m-002pGj-G1; Wed, 20 May 2020 19:03:22 +0200
Date:   Wed, 20 May 2020 19:03:22 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     fugang.duan@nxp.com
Cc:     davem@davemloft.net, netdev@vger.kernel.org,
        martin.fuzzey@flowbird.group, robh+dt@kernel.org,
        shawnguo@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net 3/4] ARM: dts: imx6: update fec gpr property to match
 new format
Message-ID: <20200520170322.GJ652285@lunn.ch>
References: <1589963516-26703-1-git-send-email-fugang.duan@nxp.com>
 <1589963516-26703-4-git-send-email-fugang.duan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589963516-26703-4-git-send-email-fugang.duan@nxp.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 20, 2020 at 04:31:55PM +0800, fugang.duan@nxp.com wrote:
> From: Fugang Duan <fugang.duan@nxp.com>
> 
> Update the gpr property to define gpr register offset and
> bit in DT.
> 
> Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
> ---
>  arch/arm/boot/dts/imx6qdl.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
> index 98da446..a4a68b7 100644
> --- a/arch/arm/boot/dts/imx6qdl.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl.dtsi
> @@ -1045,7 +1045,7 @@
>  					 <&clks IMX6QDL_CLK_ENET>,
>  					 <&clks IMX6QDL_CLK_ENET_REF>;
>  				clock-names = "ipg", "ahb", "ptp";
> -				gpr = <&gpr>;
> +				gpr = <&gpr 0x34 27>;
>  				status = "disabled";
>  			};

Hi Andy

This is the same values as hard coded, so no change here.

The next patch does not use grp at all. So it is unclear to me if you
actually make use of what you just added. I don't see anywhere

gpr = <&gpr 0x42 24>;

which is the whole point of this change, being able to specify
different values.

      Andrew
