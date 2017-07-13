From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] dts: ls2088a: add pcie support
Date: Thu, 13 Jul 2017 16:31:22 +0800
Message-ID: <20170713083121.GR3172@dragon>
References: <1499331330-38362-1-git-send-email-Zhiqiang.Hou@nxp.com>
 <20170713081728.GQ3172@dragon>
 <VI1PR0402MB2782E2EB4B0E36EFF55CD5E684AC0@VI1PR0402MB2782.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <VI1PR0402MB2782E2EB4B0E36EFF55CD5E684AC0-9IDQY6o3qQhW5Nc2rBmepo3W/0Ik+aLCnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Z.q. Hou" <zhiqiang.hou-3arQi8VN3Tc@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 13, 2017 at 08:27:47AM +0000, Z.q. Hou wrote:
> Hi Shawn,
> 
> Thanks for your comments!
> 
> > -----Original Message-----
> > From: Shawn Guo [mailto:shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> > Sent: 2017年7月13日 16:18
> > To: Z.q. Hou <zhiqiang.hou-3arQi8VN3Tc@public.gmane.org>
> > Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org; catalin.marinas-5wv7dgnIgG8@public.gmane.org;
> > will.deacon-5wv7dgnIgG8@public.gmane.org; Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
> > Subject: Re: [PATCH 1/3] dts: ls2088a: add pcie support
> > 
> > On Thu, Jul 06, 2017 at 04:55:28PM +0800, Zhiqiang Hou wrote:
> > > From: Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
> > >
> > > The physical memory map address and CCSR registers map address are
> > > different between LS2088A and other LS2080A series SoCs.
> > >
> > > Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
> > > ---
> > >  arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
> > > b/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
> > > index 5c695c6..7d26531 100644
> > > --- a/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
> > > @@ -134,6 +134,7 @@
> > >  };
> > >
> > >  &pcie1 {
> > > +	compatible = "fsl,ls2088a-pcie", "snps,dw-pcie";
> > 
> > I do not see "fsl,ls2088a-pcie" in either bindings doc or kernel driver.
> > 
> 
> I submitted the DT node patch and driver code patch separately, see the driver patch:
> https://patchwork.kernel.org/patch/9827915/

Send me the dts changes after bindings and driver patch land on
mainline.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
