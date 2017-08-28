From: David Disseldorp <ddiss-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] arm: sun8i: nanopi-neo: Enable USB OTG
Date: Tue, 29 Aug 2017 01:41:40 +0200
Message-ID: <20170829014140.469b1bf7@suse.de>
References: <20170828001251.8440-1-ddiss@suse.de>
        <46910aa6a3f08e1628a5a23fb7751a61@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <46910aa6a3f08e1628a5a23fb7751a61-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, David Disseldorp <ddiss-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 28 Aug 2017 10:37:56 +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:

> 在 2017-08-28 08:12，David Disseldorp 写道：
> > From: David Disseldorp <ddiss-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
> > 
> > The NanoPi NEO features a MicroUSB port that can work in both host mode
> > and peripheral mode. Switching is handled via GPIO PG12.  
> 
> How's the Vbus of the OTG handled?

I don't know. Unlike the NanoPi NEO2[2], the NanoPi NEO schematics[1]
don't show a regulator connected to the Vbus pin. I've tested this
change with USB device mode only.

> > Signed-off-by: David Disseldorp <ddiss-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts | 27 
> > +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
> > b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
> > index 78f6c24952dd..5abf430ac5a6 100644
> > --- a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
> > +++ b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
> > @@ -47,9 +47,36 @@
> >  	compatible = "friendlyarm,nanopi-neo", "allwinner,sun8i-h3";
> >  };
> > 
> > +&ehci0 {
> > +	status = "okay";
> > +};
> > +
> > +&ehci3 {
> > +	status = "okay";
> > +};  
> 
> Why do you also enable ehci/ohci3 here?
> I think they're already enabled in sun8i-h3-nanopi.dtsi .

You're right. I'll drop the duplication here.

Cheers, David

1. NanoPi NEO schematics
   http://wiki.friendlyarm.com/wiki/images/1/1c/NanoPi-NEO-V1.2-1608-Schematic.pdf

2. NanoPi NEO2 schematics
   http://wiki.friendlyarm.com/wiki/images/a/a1/Schematic_NanoPi_NEO2-v1.0_1701.pdf
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
