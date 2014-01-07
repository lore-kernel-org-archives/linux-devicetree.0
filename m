From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: vf610: use the interrupt macros
Date: Tue, 7 Jan 2014 21:25:55 +0800
Message-ID: <20140107132553.GJ12346@S2101-09.ap.freescale.net>
References: <1387952367-6321-1-git-send-email-b32955@freescale.com>
 <20140106060429.GC27227@S2101-09.ap.freescale.net>
 <20140107075217.GA27279@shlinux2.ap.freescale.net>
 <e1421f5854394a4797628684293397da@BL2PR03MB467.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e1421f5854394a4797628684293397da-AZ66ij2kwab4MB1ZSnT4iOO6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "shijie.huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <shijie.huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 07, 2014 at 09:39:09AM +0000, Jingchang Lu wrote:
> > > > @@ -90,7 +91,7 @@
> > > >  			uart0: serial@40027000 {
> > > >  				compatible = "fsl,vf610-lpuart";
> > > >  				reg = <0x40027000 0x1000>;
> > > > -				interrupts = <0 61 0x00>;
> > >
> > > Why is it so special having a 0x00 IRQ trigger type?  Or is it just a
> > > typo?  While we are at it, we should probably fix it if it's a typo.
> > hi Jingchang:
> >   i think it is a typo.
> > 
> > do you any idea about it?
>   Yes, it is a typo I made, please help fix it here.

Okay.  I just fixed it up and applied the patch.

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
