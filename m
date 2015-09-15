From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: fsl-ls2085a: Add serial aliases
Date: Tue, 15 Sep 2015 17:09:03 -0500
Message-ID: <1442354943.2909.140.camel@freescale.com>
References: <20150915004827.GA19862@home.buserror.net>
	 <2766847.5egOSlNQ7I@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2766847.5egOSlNQ7I@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2015-09-15 at 08:43 +0200, Arnd Bergmann wrote:
> On Monday 14 September 2015 19:48:27 Scott Wood wrote:
> > These will allow U-Boot to set linux,stdout-path in /chosen based on
> > the active console device, which will allow devicetree-based earlycon.
> > 
> > Signed-off-by: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi 
> > b/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
> > index e281ceb..eae454e 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
> > @@ -55,6 +55,11 @@
> >         #address-cells = <2>;
> >         #size-cells = <2>;
> >  
> > +       aliases {
> > +               serial0 = &serial0;
> > +               serial1 = &serial1;
> > +       };
> > +
> 
> I normally ask people to put the aliases into the board specific dts file,
> to account for machines that do not have all the uarts, or that number them
> differently from the SoC.

OK, I'll respin on top of https://patchwork.kernel.org/patch/7120211/

> I didn't know about U-Boot setting the stdout-path property, but that's
> great, as long as U-Boot uses the same numbering of the uarts that the
> board uses. Do you know if that is normally the case?

Yes, the numbering of the serial aliases in the dts should match the 
numbering that U-Boot uses.

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
