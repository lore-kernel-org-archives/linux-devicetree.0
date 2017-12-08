From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] arm64: allwinner: a64: orangepi-zero-plus2:
 add usb otg
Date: Fri, 8 Dec 2017 08:57:35 +0100
Message-ID: <20171208075735.nk5gsdpmbrol7fnq@flea.lan>
References: <1512644748-14491-1-git-send-email-jagan@amarulasolutions.com>
 <20171207133409.cpp7wxx4yflkgavp@flea.lan>
 <CAD6G_RQkBWth6iygyGfBX_rROEM7XUh3BmvoXfsxm8=po+kksQ@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="km5sivfxzg2ekixt"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB6MLVHIQKGQE2G66U7A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAD6G_RQkBWth6iygyGfBX_rROEM7XUh3BmvoXfsxm8=po+kksQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--km5sivfxzg2ekixt
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, Dec 07, 2017 at 10:23:18PM +0530, Jagan Teki wrote:
> On Thu, Dec 7, 2017 at 7:04 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Hi,
> >
> > On Thu, Dec 07, 2017 at 04:35:48PM +0530, Jagan Teki wrote:
> >> Add usb otg support for orangepi-zero-plus2 board:
> >> - Add usb_otg node with dr_mode as 'otg'
> >> - USB0-IDDET connected to PA21
> >> - VBUS connected through DCIN which always on
> >>
> >> Tested mass storage function.
> >>
> >> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> >
> > Did you test the OTG or peripheral modes?
> 
> dr_mode with otg and I've tested mas storage gadget with mmc disk
> emulation.

So, peripheral, not OTG.

> >
> >> Note: Anyone please check vbus connection [1]
> >> Since it is connected through DCIN of vcc-5v, I've added vcc-5v0
> >> regulator for the same and attached to usb0_vbus-supply but it is
> >> disabling during kernel boot.
> >> [    1.887854] vcc5v0: disabling
> >
> > VBUS is the power line that is provided on the USB connector. In
> > peripheral, that power is provided by the host, therefore it needs to
> > be shutdown on the peripheral end. This is the expected behaviour.
> 
> So, in my test with 'otg' host drive the vbus so-it is disabling at
> target end is it?

You're not testing OTG, you're testing in peripheral mode. OTG is
switching between host and peripheral at runtime. And I'm pretty sure
this board cannot implement OTG at all, since its only source of power
seems to be USB.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--km5sivfxzg2ekixt--
