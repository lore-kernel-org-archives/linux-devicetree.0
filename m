Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEAAC11D3D
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 15:17:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05A5024688
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 15:17:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="PFbYRJJM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729751AbgB0PRq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 10:17:46 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:39334 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729279AbgB0PRq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Feb 2020 10:17:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=/amHjcp1m9GoN8wK56yOYd/PS1D0Vy3heZyNFBxc3ds=; b=PFbYRJJMzHEFkfxOTRfSgTi3G
        gE5m1bTrwGEHezS9/LTsHpkZz4dteZuwm74wT0ghQVY1F1f6MMHbJRBr5vQyn9xCE1qv+YGPllo0S
        xZ6Th/U0hZEY0pu6gQHj3eRjq9P6kQBTe87swuLU0Ci1NdlGzZaZAN3FLMcorpLZ1mtEj2Ct4PwVB
        UQsOuU6LiErdmCFJQxZe4kf0Pnr0Ij8dUhrtqN3DmEAGdjQK4MpyJQwdy+1Lmcj7KQE+UlrnVCmmy
        fGDQKyu5aSfn3isWf3vw0wILNTtRfKhY+RXo6w3f/AZZqfgqmjgsNtShUqh03T+WWEpo4RV8rhKet
        NfxR8xXdA==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:53522)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1j7Kuz-0006Jo-8N; Thu, 27 Feb 2020 15:17:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1j7Kux-00014m-3H; Thu, 27 Feb 2020 15:17:39 +0000
Date:   Thu, 27 Feb 2020 15:17:39 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: dts: imx6qdl-sr-som-ti: indicate powering off wifi
 is safe
Message-ID: <20200227151738.GM25745@shell.armlinux.org.uk>
References: <E1j7I7v-0004dS-5u@rmk-PC.armlinux.org.uk>
 <CAOMZO5A6os4myE41ZLBvW639bjRudg8Tax4yBa5JOyY5+oJW+g@mail.gmail.com>
 <20200227134538.GK25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227134538.GK25745@shell.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Feb 27, 2020 at 01:45:39PM +0000, Russell King - ARM Linux admin wrote:
> On Thu, Feb 27, 2020 at 09:57:40AM -0300, Fabio Estevam wrote:
> > Hi Russell,
> > 
> > On Thu, Feb 27, 2020 at 9:19 AM Russell King <rmk+kernel@armlinux.org.uk> wrote:
> > >
> > > We need to indicate that powering off the TI WiFi is safe, to avoid:
> > >
> > > wl18xx_driver wl18xx.2.auto: Unbalanced pm_runtime_enable!
> > > wl1271_sdio mmc0:0001:2: wl12xx_sdio_power_on: failed to get_sync(-13)
> > >
> > > which prevents the WiFi being functional.
> > >
> > > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > 
> > Shouldn't this have a Fixes tag so that it can be backported to stable kernels?
> 
> If I knew where the breakage happened and what commit was responsible
> for it, then yes - but it used to work with earlier kernels (I don't
> know which) and at some point it broke.
> 
> The suggestion for how to fix it came from Jon Nettleton.

Jon says:

"It was changes to the mmc power handling.  Basically telling the
controller that the card should be able to wake it up from a sleep
state.

"I think it has to do with the runtime PM addition.  This was added
to the TI driver in commit, 9b71578de08748defb3bcae3ce8ed1a75cb6a8d7
I don't know if that is what broke it, but that was the initial
integration.

"That was added after changes to the MMC layer were done I believe."

Jon thinks the idea for fixing it came from a post on one of the
mailing lists, but is unable to find it now.

So, I think the cause is now lost in the mists of time.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
