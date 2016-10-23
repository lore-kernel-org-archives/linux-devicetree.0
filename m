From: LABBE Corentin <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dt: sun8i-h3: Add sunxi-sid to dts for sun8i-h3
Date: Sun, 23 Oct 2016 10:26:31 +0200
Message-ID: <20161023082631.GA28485@Red>
References: <1475660904-7959-1-git-send-email-clabbe.montjoie@gmail.com>
 <20161005122130.8cc229ff5d4990149956b49c@free.fr>
 <20161019074016.GA31440@Red>
 <20161020203654.2erph2mr73yzksla@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161020203654.2erph2mr73yzksla@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 20, 2016 at 10:36:54PM +0200, Maxime Ripard wrote:
> On Wed, Oct 19, 2016 at 09:40:16AM +0200, LABBE Corentin wrote:
> > On Wed, Oct 05, 2016 at 12:21:30PM +0200, Jean-Francois Moine wrote:
> > > On Wed,  5 Oct 2016 11:48:24 +0200
> > > Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > 
> > > > This patch add support for the sunxi-sid driver to the device tree for sun8i-h3.
> > > > 
> > > > Signed-off-by: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > ---
> > > >  arch/arm/boot/dts/sun8i-h3.dtsi | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > > 
> > > > diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
> > > > index 9f58bb4..abfd29c 100644
> > > > --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> > > > +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> > > > @@ -211,6 +211,11 @@
> > > >  			#size-cells = <0>;
> > > >  		};
> > > >  
> > > > +		sid: eeprom@01c14200 {
> > > > +			compatible = "allwinner,sun7i-a20-sid";
> > > > +			reg = <0x01c14200 0x200>;
> > > 
> > > The datasheet says 1Kb starting at 0x01c14000.
> > > Is there any reason to reduce the area and to shift the offset?
> > > 
> > 
> > According to http://linux-sunxi.org/SID_Register_Guide "For
> > Allwinner A83T and H3 the SID address space starts at 0x01c14000,
> > and the e-fuses are at offset 0x200".
> >
> > So I use this offset, since the sunxi_sid driver need the base
> > address of e-fuses.
> > 
> > The easiest solution is to use 0x01c14200 since the other part of
> > sid is not used and not known (A83T/H3 user manual doesnt give any
> > information on all sid space, worse for A64 which reference SID only
> > in memory map).
> > 
> > So probably for H3/A64/A83T, there will never any usage of the rest
> > of the SID address space.
> 
> And since we can't know that, and we have to maintain the DT ABI,
> using the whole address map and an offset, with a new compatible, is
> definetely the safest thing to do.
> 

I have two way of doing it, which one do you prefer ?

- Adding two optionnal properties: efuses-offset and efuses-size defaulting to 0 and resourcesize.
- Adding a subnode called efuses with its own reg=<>

The first one is easy and didnt need any work on previous DT entries.

Regards
Corentin Labbe
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
