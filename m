From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/3] pinctrl: pinctrl-imx: add imx pinctrl core driver
Date: Tue, 17 Apr 2012 14:30:06 +0200
Message-ID: <20120417123006.GC3852@pengutronix.de>
References: <1334333915-1174-1-git-send-email-b29396@freescale.com>
 <20120414134814.GA3852@pengutronix.de>
 <CAA+hA=T0FAfuGKcW0vAKO+OWyFdM-6vQqVo53xKf8y28m7gPOQ@mail.gmail.com>
 <20120415141736.GG24997@S2101-09.ap.freescale.net>
 <20120416034713.GB17173@shlinux2.ap.freescale.net>
 <20120416034646.GI24997@S2101-09.ap.freescale.net>
 <20120417095722.GF17173@shlinux2.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120417095722.GF17173@shlinux2.ap.freescale.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <aisheng.dong@freescale.com>
Cc: Shawn Guo <shawn.guo@linaro.org>, Dong Aisheng-B29396 <B29396@freescale.com>, Dong Aisheng <dongas86@gmail.com>, "linus.walleij@stericsson.com" <linus.walleij@stericsson.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 17, 2012 at 05:57:23PM +0800, Dong Aisheng wrote:
> Sascha & Shawn,
> 
> Just let you know:
> After changes the pinctrl table may look like:
> (i also removed fsl,* config properties since it was introduced for better
> readability before, but after dtc macro support is available, it could also
> be removed. So i removed now. Then the using is much similar as iomux-v3).
> 
> iomuxc@020e0000 {
>         compatible = "fsl,imx6q-iomuxc";
>         reg = <0x020e0000 0x4000>;
> 
>         /* shared pinctrl settings */
>         uart4 {
>                 pinctrl_uart4_1: uart4grp-1 {
>                         fsl,pins = <58 61>;
>                         fsl,configs = <0x12407>

Why do we have a hex value for the config now? This should be
independent on how we describe the mux settings.

Also I think a single fsl,configs entry for a pin group is not
enough, what for example with I2C where the data line needs a pullup
whereas the clock line does not?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
