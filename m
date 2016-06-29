From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: Re: Re: [PATCH 1/4] brcmfmac: Add brcm,nvram_file_name
 dt property
Date: Wed, 29 Jun 2016 22:54:38 +0300
Message-ID: <1467230078.2598.2.camel@plaes.org>
References: <1467209074-15634-1-git-send-email-hdegoede@redhat.com>
	 <ea10ff70-26e6-e151-5cea-c54bd12a054c@redhat.com>
	 <f8995599-115d-87e5-7928-c029b48584f1@broadcom.com>
	 <6402170.5s0abZDqlD@wuerfel>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDJLTBEBXENBBFGP2C5QKGQECXUI67Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <6402170.5s0abZDqlD@wuerfel>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: arnd-r2nGTMty4D4@public.gmane.org, Arend Van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "John W . Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2016-06-29 at 21:33 +0200, Arnd Bergmann wrote:
> On Wednesday, June 29, 2016 8:51:44 PM CEST Arend Van Spriel wrote:
> > > Typical wifi devices will have some sort of non volatile storage
> > > on board to not only store the ethernet(mac) address, but also
> > > to contain e.g. info about the antenna gain so that the firmware
> > > and/or the driver can take the antenna gain into account and
> > > ensure
> > > that they never exceed the maximum allowed broadcast strength.
> > >=20
> > > However on some embedded devices there is no non-volatile storage
> > > for the wifi (for cost reasons) and instead this configuration
> > > info
> > > (which is board / pcb specific) is loaded in the form of a
> > > file which contains the contents which would normally be in the
> > > non-volatile storage.
> > >=20
> > > Since we are dealing with a per-board config-file here, which is
> > > loaded from the os filesystem we really need to specify a
> > > basename
> > > here as the list of possible boards is endless, so we cannot
> > > have a lookup table in the driver.
> >=20
> > As Jonas mentioned the general principle of device tree is to be
> > agnostic with regards to OS and/or driver as you undoubtedly know.
> > His
> > proposal seems like a usable solution for your problem while
> > complying
> > to the device tree principle. So instead of overriding the default
> > brcmfmac should modify it when dt specifies the "module" property,
> > ie:
> >=20
> > no "module" in DT:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nvram filename =
=3D brcm/brcmfmac43362-
> > sdio.txt
> > "module=3Dap6210" in DT:=C2=A0=C2=A0nvram filename =3D brcm/brcmfmac433=
62-
> > ap6210.txt
> >=20
> > By the way, the example in the bindings file does not seem to
> > specify a
> > basename, but path+basename+fileext.
>=20
> What is the size of this nvram file? As it's board specific, I wonder
> if we can simply include it inside of the DT verbatim. I remember
> doing that (in the pre-dtb days, on real open firmware) for the
> "spidernet"
> ethernet driver.

It contains a bit too much info:

This is what CubieTruck requires:

http://dl.cubieboard.org/public/Cubieboard/benn/firmware/ap6210/nvram_a
p6210.txt

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
