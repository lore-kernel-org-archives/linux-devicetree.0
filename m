From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: sunxi:
 document new generic binding
Date: Mon, 27 Nov 2017 09:34:41 +0100
Message-ID: <20171127083441.7u442rkeqforqs5i@flea.home>
References: <20171113012523.2328-1-andre.przywara@arm.com>
 <20171113012523.2328-2-andre.przywara@arm.com>
 <CACRpkdbpfkM4odz425+4qyUCF5vqPWBQ=F5Yk7AtJL5SqXghpg@mail.gmail.com>
 <20171124105240.GB3792@ulmo>
 <20efcf8f-85a5-3cad-a84b-434ee5cad68e@arm.com>
 <20171124133123.GA15999@ulmo>
 <0c8051e6-5d8c-32d6-97e4-11c2283da5b4@arm.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tw5orycc7cliq6wr"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBLE457IAKGQES3YEU4A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <0c8051e6-5d8c-32d6-97e4-11c2283da5b4-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--tw5orycc7cliq6wr
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, Nov 24, 2017 at 05:19:24PM +0000, Andre Przywara wrote:
> > This is not the same as saying we need to be able to fully validate all
> > aspects of device tree. We can't, because some information simply does
> > not exist outside of DT. However, I think it's a big mistake to trust a
> > user to fully know about all intricacies of a pinmux and not make any
> > mistake when writing the device tree.
> 
> When does a *user* write a device tree? What would a clueless Joe
> Average expect from doing so? The device tree is written by either the
> board/SoC vendor or by some kernel developers. It is not meant to be
> changed by the user, apart from carefully crafted overlays, maybe. You
> can have the same control by just changing the kernel (binary patching
> the image file or re-compiling with
> writel(MATCHES, base_addr + SET_FIRE)).

I guess the expectation should be that it's a Joe Average user in the
Allwinner case at least. It's far from the exception that someone that
never got any kernel (or electronics) experience before jumps in,
creates a DT for the shiny new board they just received and then
submits it.

I guess it's more the case in the Allwinner case than for any other
SoCs I've worked on at least, probably because of its widespread use
in the low-end consumer market and their reputation amongst hackers,
but still, this is basically our default.

> > What if one of the settings causes the board to go up in flames?
> 
> Then you better not play with it. But I don't think this is a valid
> argument, really. What if gravity reverses tomorrow?
> Are there any known issues with writing mux values to pinctrl registers?
> I don't think the consequences would be different from putting low or
> high to a GPIO, which you can do already from userland.

I guess the difference would be that's it's active in your example,
while the pinmux will be set even if a user doesn't do anything. And I
can testify that you can very well permanently fry a board passively
using pinctrl :)

> > And let's face it: the really difficult part of adding pinmux support is
> > to write the driver (or subsystem if you don't have one yet). Adding the
> > data is really the easy part.
> 
> I know, I did this before. But currently you have to write both the DT
> part *and* the kernel table. And check patch 3/3, that's what the table
> gets reduced to. So you avoid writing 601 lines, instead add 23 lines to
> the DT.

And I'll just add here that if the data size is of concern, as it can
be in a bootloader, you can very well have partial tables. There's
plenty of devices that will be of no use in a bootloader.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--tw5orycc7cliq6wr--
