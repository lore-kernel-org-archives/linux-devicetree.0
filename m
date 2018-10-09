Return-Path: <SRS0=6MUZ=MV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46893 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbeJIQbI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Oct 2018 12:31:08 -0400
Received: by mail-ed1-f65.google.com with SMTP id g32-v6so980224edg.13
        for <devicetree@vger.kernel.org>; Tue, 09 Oct 2018 02:15:11 -0700 (PDT)
Date: Tue, 9 Oct 2018 11:15:08 +0200
From: Oliver Graute <oliver.graute@gmail.com>
Subject: Re: Can't set MX6UL_PAD_LCD_DATA10 register with devicetree
Message-ID: <20181009091508.GA13624@graute-opti>
References: <20181005124519.GA7699@graute-opti>
 <20181008062102.GJ3587@dragon>
 <AM0PR04MB42116046ADF97D5A0E05C63980E70@AM0PR04MB4211.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB42116046ADF97D5A0E05C63980E70@AM0PR04MB4211.eurprd04.prod.outlook.com>
Sender: devicetree-owner@vger.kernel.org
To: "A.s. Dong" <aisheng.dong@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <anson.huang@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On 09/10/18, A.s. Dong wrote:
> > -----Original Message-----
> > From: Shawn Guo [mailto:shawnguo@kernel.org]
> > Sent: Monday, October 8, 2018 2:21 PM
> > To: Oliver Graute <oliver.graute@gmail.com>
> > Cc: devicetree@vger.kernel.org; s.hauer@pengutronix.de; dl-linux-imx
> > <linux-imx@nxp.com>; Fabio Estevam <fabio.estevam@nxp.com>; Anson
> > Huang <anson.huang@nxp.com>
> > Subject: Re: Can't set MX6UL_PAD_LCD_DATA10 register with devicetree
> > 
> > Copy NXP folks and list.
> > 
> > On Fri, Oct 05, 2018 at 02:45:19PM +0200, Oliver Graute wrote:
> > > Hello list,
> > >
> > > I try to set the following PAD in my imx6ul devicetree (derived from
> > > imx6ul-14x14-evk.dts)
> > >
> > > MX6UL_PAD_LCD_DATA10__GPIO3_IO15 0x100b0
> > >
> > > but after kernel compiling and booting the register value is not
> > > changed. A readout with devmem2 show me the wrong value.
> > >
> > > devmem2 0x020E03CC
> > > /dev/mem opened.
> > > Memory mapped at address 0x76fc4000.
> > > Read at address  0x020E03CC (0x76fc43cc): 0x000010B0
> > >
> > > Setting the register manually with devmem2 just works fine.
> > >
> > > /usr/bin/devmem2 0x020E03CC w 0x000100B0
> > >
> > > other PADs like MX6UL_PAD_GPIO1_IO07__ENET1_MDC I could configure via
> > > the imx6ul devicetree.
> > >
> > > ideas what I'm doing wrong here?
> > >
> 
> I tested imx6ul evk with Shawn's for next tree by manual change LCD_DATA10
> Pad set to 0x100b0, but did not reproduced your issue.
> 
> As I don't have devme2 tool in my rootfs, so I tried memtool in NXP released rootfs.
> root@imx6ul7d:~# /unit_tests/memtool -32 0x20e03cc 1
> E
> Reading 0x1 count starting at address 0x020E03CC
> 
> 0x020E03CC:  000100B0
> 
> I guess you can debug the issue with below approaches:
> 1) use below cmd to dump pad setting via pinctrl sysfs
> cat /sys/kernel/debug/pinctrl/20e0000.iomuxc/pinconf-pins | grep LCD_DATA10
> 2) Enable CONFIG_DEBUG_PINCTRL will make the booting dump all pad settings
> in register value. Then you may find some clue on it. 

thx for this hint. I didn't know this CONFIG_DEBUG_PINCTRL option
before. In my dmesg output I now see all the PAD settings.

Best regards,

Oliver
