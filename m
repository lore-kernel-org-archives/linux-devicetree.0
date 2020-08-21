Return-Path: <SRS0=+ed7=B7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CA8C433E3
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 05:56:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF73E20732
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 05:56:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725268AbgHUF44 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Aug 2020 01:56:56 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48119 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgHUF4z (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Aug 2020 01:56:55 -0400
X-Greylist: delayed 1195 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 Aug 2020 01:56:54 EDT
Received: from [2001:67c:670:100:1d::c5] (helo=pty.hi.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1k8zjU-0004x7-IT; Fri, 21 Aug 2020 07:36:56 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1k8zjT-0003RB-CS; Fri, 21 Aug 2020 07:36:55 +0200
Date:   Fri, 21 Aug 2020 07:36:55 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Li Jun <jun.li@nxp.com>
Cc:     kishon@ti.com, robh+dt@kernel.org, devicetree@vger.kernel.org,
        peter.chen@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com
Subject: Re: [PATCH 2/2] phy: freescale: imx8mq-usb: add support for imx8mp
 usb phy
Message-ID: <20200821053655.mpbp4zhbavjpgdwy@pengutronix.de>
References: <1591621893-22363-1-git-send-email-jun.li@nxp.com>
 <1591621893-22363-2-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591621893-22363-2-git-send-email-jun.li@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:35:05 up 279 days, 20:53, 257 users,  load average: 0.03, 0.06,
 0.04
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On 20-06-08 21:11, Li Jun wrote:

...

> +static int imx8mp_usb_phy_init(struct phy *phy)
> +{
> +	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
> +	u32 value;
> +
> +	/* USB3.0 PHY signal fsel for 24M ref */
> +	value = readl(imx_phy->base + PHY_CTRL0);
> +	value &= ~PHY_CTRL0_FSEL_MASK;
> +	value |= PHY_CTRL0_FSEL_24M;
> +	writel(value, imx_phy->base + PHY_CTRL0);
> +
> +	/* Disable alt_clk_en and use internal MPLL clocks */
> +	value = readl(imx_phy->base + PHY_CTRL6);
> +	value &= ~(PHY_CTRL6_ALT_CLK_SEL | PHY_CTRL6_ALT_CLK_EN);
> +	writel(value, imx_phy->base + PHY_CTRL6);
> +
> +	value = readl(imx_phy->base + PHY_CTRL1);
> +	value &= ~(PHY_CTRL1_VDATSRCENB0 | PHY_CTRL1_VDATDETENB0);
> +	value |= PHY_CTRL1_RESET | PHY_CTRL1_ATERESET;
> +	writel(value, imx_phy->base + PHY_CTRL1);
> +
> +	value = readl(imx_phy->base + PHY_CTRL0);
> +	value |= PHY_CTRL0_REF_SSP_EN;
> +	writel(value, imx_phy->base + PHY_CTRL0);
> +
> +	value = readl(imx_phy->base + PHY_CTRL2);
> +	value |= PHY_CTRL2_TXENABLEN0 | PHY_CTRL2_OTG_DISABLE;
> +	writel(value, imx_phy->base + PHY_CTRL2);
> +
> +	udelay(10);

Nit:
Do we need the active wait here or is it also possible to use
usleep_range() here?

> +
> +	value = readl(imx_phy->base + PHY_CTRL1);
> +	value &= ~(PHY_CTRL1_RESET | PHY_CTRL1_ATERESET);
> +	writel(value, imx_phy->base + PHY_CTRL1);
> +
> +	return 0;
> +}
