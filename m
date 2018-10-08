Return-Path: <SRS0=zTHe=MU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725950AbeJHNbb (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 8 Oct 2018 09:31:31 -0400
Date: Mon, 8 Oct 2018 14:21:05 +0800
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: Can't set MX6UL_PAD_LCD_DATA10 register with devicetree
Message-ID: <20181008062102.GJ3587@dragon>
References: <20181005124519.GA7699@graute-opti>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181005124519.GA7699@graute-opti>
Sender: devicetree-owner@vger.kernel.org
To: Oliver Graute <oliver.graute@gmail.com>
Cc: devicetree@vger.kernel.org, s.hauer@pengutronix.de, linux-imx@nxp.com, Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <Anson.Huang@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Copy NXP folks and list.

On Fri, Oct 05, 2018 at 02:45:19PM +0200, Oliver Graute wrote:
> Hello list,
> 
> I try to set the following PAD in my imx6ul devicetree (derived from
> imx6ul-14x14-evk.dts)
> 
> MX6UL_PAD_LCD_DATA10__GPIO3_IO15 0x100b0
> 
> but after kernel compiling and booting the register value is not
> changed. A readout with devmem2 show me the wrong value.
> 
> devmem2 0x020E03CC
> /dev/mem opened.
> Memory mapped at address 0x76fc4000.
> Read at address  0x020E03CC (0x76fc43cc): 0x000010B0
> 
> Setting the register manually with devmem2 just works fine.
> 
> /usr/bin/devmem2 0x020E03CC w 0x000100B0
> 
> other PADs like MX6UL_PAD_GPIO1_IO07__ENET1_MDC I could configure via
> the imx6ul devicetree.
> 
> ideas what I'm doing wrong here?
> 
> Best Regards,
> 
> Oliver
