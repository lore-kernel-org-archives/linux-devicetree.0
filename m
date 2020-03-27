Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31538C43331
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 12:46:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07E1C20838
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 12:46:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="DWz54k89"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbgC0MqE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Mar 2020 08:46:04 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:33770 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727336AbgC0MqE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Mar 2020 08:46:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=JmG3WZJDcGCwktscCEiZxzaRHTNMSk7OqWqcb9CklMU=; b=DWz54k89BzS61Gaj5ZJHumDZX
        A9o+tS6Qwk8axxNgL9dRnmwHjd28UR22jF3LCFXrrymwxj9w0XXBk68sfUJfOSWzl5iHozJ68yimP
        +GEcJv1uvGOlnsPFEPA5rs5yMwQUAwmCe9jsVuNi00LGzaAkvOxFm6dRpyjRSLvvABfXd95UQS+Tf
        6/EzYQl4S5bd37TxwTG7IauMWF3PiZdabuFbAspX3OC13squhg3b1IIi0QcDx/xLGNatWa0QSJAcU
        6tLNLOpNKEJAG54OESpBlSZK1yMLaK+OiUJXNyQSg/MNoACzdIslqnVwYxmMCKWLskf+Ra7hmEXea
        IBGnmkR3g==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:37908)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jHoMs-00016y-C2; Fri, 27 Mar 2020 12:45:46 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jHoMq-0004EP-KG; Fri, 27 Mar 2020 12:45:44 +0000
Date:   Fri, 27 Mar 2020 12:45:44 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Gregory Clement <gregory.clement@bootlin.com>
Cc:     "Madalin Bucur (OSS)" <madalin.bucur@oss.nxp.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: update SolidRun Armada 8040 phy interface
 types
Message-ID: <20200327124544.GK25745@shell.armlinux.org.uk>
References: <E1jHoHy-0002Ep-IY@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1jHoHy-0002Ep-IY@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

A note for Gregorii / bootlin people:

After this patch, these still remain:

arch/arm64/boot/dts/marvell/cn9131-db.dts:      phy-mode = "10gbase-kr";
arch/arm64/boot/dts/marvell/armada-7040-db.dts: phy-mode = "10gbase-kr";
arch/arm64/boot/dts/marvell/armada-8040-db.dts: phy-mode = "10gbase-kr";
arch/arm64/boot/dts/marvell/armada-8040-db.dts: phy-mode = "10gbase-kr";
arch/arm64/boot/dts/marvell/cn9132-db.dts:      phy-mode = "10gbase-kr";
arch/arm64/boot/dts/marvell/cn9130-db.dts:      phy-mode = "10gbase-kr";

Please can you check whether these should be updated, and if so also
update them?  10GBASE-KR is the backplane variant of 10GBASE-R which
involves some negotiation.

Thanks.

On Fri, Mar 27, 2020 at 12:40:42PM +0000, Russell King wrote:
> Update the SolidRun Armada 8040 platforms phy interface types from the
> old 10gbase-kr to the newer and more correct 10gbase-r.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
>  arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts   | 2 +-
>  arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dts | 4 ++--
>  arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts            | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
> index 1e7b47affe26..006666272489 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
> @@ -401,7 +401,7 @@
>  /* SFP */
>  &cp0_eth0 {
>  	status = "okay";
> -	phy-mode = "10gbase-kr";
> +	phy-mode = "10gbase-r";
>  	managed = "in-band-status";
>  	phys = <&cp0_comphy2 0>;
>  	sfp = <&sfp_cp0_eth0>;
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dts b/arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dts
> index 26114d96d637..b44f4c029b78 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dts
> @@ -16,14 +16,14 @@
>  
>  &cp0_eth0 {
>  	status = "okay";
> -	phy-mode = "10gbase-kr";
> +	phy-mode = "10gbase-r";
>  	managed = "in-band-status";
>  	sfp = <&sfp_eth0>;
>  };
>  
>  &cp1_eth0 {
>  	status = "okay";
> -	phy-mode = "10gbase-kr";
> +	phy-mode = "10gbase-r";
>  	managed = "in-band-status";
>  	sfp = <&sfp_eth1>;
>  };
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
> index 087a5502631e..42741adf867b 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
> @@ -63,14 +63,14 @@
>  	status = "okay";
>  	/* Network PHY */
>  	phy = <&phy0>;
> -	phy-mode = "10gbase-kr";
> +	phy-mode = "10gbase-r";
>  };
>  
>  &cp1_eth0 {
>  	status = "okay";
>  	/* Network PHY */
>  	phy = <&phy8>;
> -	phy-mode = "10gbase-kr";
> +	phy-mode = "10gbase-r";
>  };
>  
>  &cp1_pinctrl {
> -- 
> 2.20.1
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
