From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Re: [PATCH 1/4] brcmfmac: Add brcm,nvram_file_name
 dt property
Date: Wed, 29 Jun 2016 22:07:21 +0200
Message-ID: <6119590.gPKNGsSJ3t@wuerfel>
References: <1467209074-15634-1-git-send-email-hdegoede@redhat.com> <6402170.5s0abZDqlD@wuerfel> <1467230078.2598.2.camel@plaes.org>
Reply-To: arnd-r2nGTMty4D4@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDEKVJM7XAHRBYWT2C5QKGQEVEHQ5VY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1467230078.2598.2.camel-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: Arend Van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "John W . Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday, June 29, 2016 10:54:38 PM CEST Priit Laes wrote:
> On Wed, 2016-06-29 at 21:33 +0200, Arnd Bergmann wrote:

> > What is the size of this nvram file? As it's board specific, I wonder
> > if we can simply include it inside of the DT verbatim. I remember
> > doing that (in the pre-dtb days, on real open firmware) for the
> > "spidernet"
> > ethernet driver.
> 
> It contains a bit too much info:
> 
> This is what CubieTruck requires:
> 
> http://dl.cubieboard.org/public/Cubieboard/benn/firmware/ap6210/nvram_a
> p6210.txt

Ah, I had not realized that this is a text based interface rather than
a small binary blob with fixed offsets.

On the other hand, each line in there could be translated easily into
a separate DT property, and some of them (manfid/prodid, macaddr, ...)
look like they directly correspond to properties we already have.

As Arend said there is also the option of having a chip specific
nvram file (brcmfmac43362-sdio.txt) as a fallback when there is no
more specific module. How many of the lines in your example would
actually differ between the two? Does this affect all of them, or
just a subset that could be turned into a smaller set of DT
properties?

	Arnd
