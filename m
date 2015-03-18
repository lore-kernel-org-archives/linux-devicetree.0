From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 1/5] USB: ehci-atmel: rework clk handling
Date: Wed, 18 Mar 2015 13:28:54 +0100
Message-ID: <20150318122854.GA18070@kroah.com>
References: <Pine.LNX.4.44L0.1503171459310.1061-100000@iolanthe.rowland.org>
 <55095E86.1060201@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55095E86.1060201-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Gilbert <dgilbert-qazKcTl6WRFWk0Htik3J/w@public.gmane.org>, Robert Nelson <robert.nelson-9gsZL1vm+hpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 18, 2015 at 12:16:22PM +0100, Nicolas Ferre wrote:
> Le 17/03/2015 20:01, Alan Stern a =E9crit :
> > On Tue, 17 Mar 2015, Boris Brezillon wrote:
> >=20
> >> The EHCI IP only needs the UTMI/UPLL (uclk) and the peripheral (ic=
lk)
> >> clocks to work properly. Remove the useless system clock (fclk).
> >>
> >> Avoid calling set_rate on the fixed rate UTMI/IPLL clock and remov=
e
> >> useless IS_ENABLED(CONFIG_COMMON_CLK) tests (all at91 platforms ha=
ve been
> >> moved to the CCF).
> >>
> >> This patch also fixes a bug introduced by 3440ef1 (ARM: at91/dt: f=
ix USB
> >> high-speed clock to select UTMI), which was leaving the usb clock
> >> uninitialized and preventing the OHCI driver from setting the usb =
clock
> >> rate to 48MHz.
> >> This bug was caused by several things:
> >> 1/ usb clock drivers set the CLK_SET_RATE_GATE flag, which means t=
he rate
> >>    cannot be changed once the clock is prepared
> >> 2/ The EHCI driver was retrieving and preparing/enabling the uhpck
> >>    clock which was in turn preparing its parent clock (the usb clo=
ck),
> >>    thus preventing any rate change because of 1/
> >>
> >> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org=
>
> >=20
> > Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
>=20
> Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> and:
> Fixes: 3440ef169100 ("ARM: at91/dt: fix USB high-speed clock to selec=
t UTMI")
>=20
> Alan, Greg,
>=20
> Can you please take this patch (only this patch 1/5 of the series) as=
 a fix=20
> for the 4.0-rc? It would solve the issue that we see on at91sam9x5/at=
91sam9n12.
> I'll take care of the rest of the series for 4.1.
>=20
> If you want me to take it of to re-send the patch, tell me.

I'll queue it up now, thanks.  You can take the rest of the series :)

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
