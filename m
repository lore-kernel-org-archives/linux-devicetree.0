From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] [V2] ARM: dts: sun7i: Add dts file for
 Bananapi M1 Plus board
Date: Wed, 15 Jun 2016 22:52:23 +0200
Message-ID: <20160615205223.GC5144@lukather>
References: <20160602023623.5761-1-luoyi.ly@gmail.com>
 <CAGRGNgUiGaxoVxtq=k8NG5mCqEXS9fd-ry1vvVJfzb+R2ATMTA@mail.gmail.com>
 <20160602081638.GG4908@lukather>
 <574FF94B.3020309@web.de>
 <20160610093851.GQ5242@lukather>
 <CAGb2v64PYU9H7Ag45ogwtjJAO87D6saTFv5-4P_E7d1xobQXXA@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O3RTKUHj+75w1tg5"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBCEAQ65QKGQEGHUPXXQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v64PYU9H7Ag45ogwtjJAO87D6saTFv5-4P_E7d1xobQXXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Bernhard Nortmann <bernhard.nortmann-S0/GAf8tV78@public.gmane.org>, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?utf-8?B?572X57+8?= <luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--O3RTKUHj+75w1tg5
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi Chen-Yu,

On Mon, Jun 13, 2016 at 11:01:53AM +0800, Chen-Yu Tsai wrote:
> On Fri, Jun 10, 2016 at 5:38 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > On Thu, Jun 02, 2016 at 11:15:55AM +0200, Bernhard Nortmann wrote:
> >> Am 02.06.2016 um 10:16 schrieb Maxime Ripard:
> >> >[...]
> >> >Yes, everything that is shared with the banana-pro (which, judging
> >> >from Bernhard, is pretty much everything but a GPIO) should be merged
> >> >in the banapro DT.
> >> >
> >> >Maxime
> >> >
> >>
> >> Don't take my word for granted, as I do not own this hardware or know it
> >> particularly well. There is no doubt that "BPi-M1+" and "Banana Pro" are
> >> very similar, but if in doubt the information form the wiki should be
> >> verified.
> >
> > Hmmmm, ok. Chen-Yu, any input on this? You know the banana-pis much
> > more than I do.
> 
> I did a comparison of the "Banana Pro" vs the "BPi-M1+".
> 
> The differences are similar to what we have with any other development
> board, say the Cubietruck:
> 
>   - A different WiFi chip is used, and the BT part is not hooked up.
>   - Different GPIOs for external power regulator/switches
>   - Different GPIOs for LEDs
>   - Different peripherals exposed on the headers.
> 
> IMO There's no need to merge or have a common .dtsi for the two boards.

Ok.

> They (and all the other development boards) look similar because
> everyone is following the basic set by Allwinner's reference design,
> like which MMC controller and pins are used for SD/MMC, which ones
> are used for SDIO-based WiFi, and so on.
> 
> I did a version completely from scratch using just the schematics:
> 
>   https://github.com/wens/linux/commits/bpi-m1-plus

So, what do you mean by that? Do you have some comments on that patch,
or should I merge it, and you'll post your additions on top of it?

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--O3RTKUHj+75w1tg5--
