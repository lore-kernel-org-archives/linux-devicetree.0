From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] Convert imx6 clock to device tree
Date: Thu, 24 Nov 2011 09:49:23 +0100
Message-ID: <20111124084923.GW27267@pengutronix.de>
References: <1321926536-671-1-git-send-email-shawn.guo@linaro.org>
 <20111122082314.GB27267@pengutronix.de>
 <20111124025902.GB17979@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111124025902.GB17979-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Richard Zhao <richard.zhao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 24, 2011 at 10:59:03AM +0800, Shawn Guo wrote:
> On Tue, Nov 22, 2011 at 09:23:14AM +0100, Sascha Hauer wrote:
> > On Tue, Nov 22, 2011 at 09:48:53AM +0800, Shawn Guo wrote:
> > > As I promised to Arnd, I will convert imx6 clock code to common clock
> > > framework and in turn device tree at the earliest time.  Here it is.
> > 
> > Very nice ;) I like the patches.
> > 
> > Is there a way to improve the way how the entities find their base
> > addresses? Currently the C code figures out the base addresses based
> > on compatible.
> 
> May I understand the problem with doing that?
> 
> > Maybe we could put the crm clocks and anatop clocks into
> > two different nodes instead of putting them all directly under clocks{}.
> > 
> I do not quite understand this.  Are you suggesting we keep using the
> static base address definition in C code for ccm and anatop rather than
> retrieving them from device tree?  No, we do not want to do this.  So
> if we need to get the addresses from device tree anyhow, using
> compatible to find the correct node is the best way to me.

What I meant is that currently there are many clock nodes which do have
a register offset associated with them, but the base address has to be
guessed in C code, like this:

>	if (of_device_is_compatible(np, "fsl,imx6q-pll-sys")) {
>		base = anatop_base;
>		ops = &pll_sys_ops;
>	} else if (of_device_is_compatible(np, "fsl,imx6q-pll-usb")) {
>		base = anatop_base;
>		ops = &pll_ops;
>		powerup_set_bit = true;
>	} else if (of_device_is_compatible(np, "fsl,imx6q-pll-av")) {
>		base = anatop_base;
>		ops = &pll_av_ops;
>	} else if (of_device_is_compatible(np, "fsl,imx6q-pll-enet")) {
>		base = anatop_base;
>		ops = &pll_enet_ops;
>	} else if (of_device_is_compatible(np, "fsl,imx6q-pll")) {
>		base = anatop_base;
>		ops = &pll_ops;
>	} else if (of_device_is_compatible(np, "fsl,imx6q-pfd")) {
>		base = anatop_base;
>		ops = &pfd_ops;
>		gate_set_bit = true;
>	} else if (of_device_is_compatible(np, "fsl,imx6q-ldb-di-clock")) {
>		base = ccm_base;
>		ops = &ldb_di_clk_ops;
>	}

Wouldn't it be possible to arrange the devicetree like this:

	ccm@020c4000 {
		compatible = "fsl,imx6q-ccm";
		reg = <0x020c4000 0x4000>;
		interrupts = <0 87 0x04 0 88 0x04>;
		clocks {
			/* put ccm clocks here */
		}
	}

	anatop@020c8000 {
		compatible = "fsl,imx6q-anatop";
		reg = <0x020c8000 0x1000>;
		interrupts = <0 49 0x04 0 54 0x04 0 127 0x04>;
		clocks {
			/* put anatop clocks here */
		}
	}

Of course this has a high cost on indention levels.

On i.MX6 we only seem to have two base addresses relevant for clocks,
but on i.MX5 there are multiple identical PLLs with different base
addresses, so guessing the base address would not be possible based
on of_device_is_compatible(), we would also have to match the name or
some other identification property:

	if (is_compatible(np, "fsl,imx5-pll") && np->name == "pll1")
		base = pll1_base;
	else if ...

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
