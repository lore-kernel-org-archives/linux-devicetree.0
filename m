From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/5] clk: sunxi: Add USB clock register defintions
Date: Fri, 7 Feb 2014 14:48:31 +0100
Message-ID: <20140207134831.GJ3192@lukather>
References: <1390426587-16287-1-git-send-email-hdegoede@redhat.com>
 <1390426587-16287-3-git-send-email-hdegoede@redhat.com>
 <20140127144349.GJ3867@lukather>
 <52E67316.5020906@redhat.com>
 <20140128094427.GZ3867@lukather>
 <52E77FCD.5050701@redhat.com>
 <20140204094051.GL25625@lukather>
 <52F0BD94.1060601@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="P6YfpwaDcfcOCJkJ"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBC6J2OLQKGQEU5RHRCY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52F0BD94.1060601-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--P6YfpwaDcfcOCJkJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2014 at 11:14:44AM +0100, Hans de Goede wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hi,
>=20
> On 02/04/2014 10:40 AM, Maxime Ripard wrote:
> > Hi Hans,
> >=20
> > On Tue, Jan 28, 2014 at 11:00:45AM +0100, Hans de Goede wrote:
> >> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
> >>=20
> >> Hi,
> >>=20
> >> On 01/28/2014 10:44 AM, Maxime Ripard wrote:
> >>> On Mon, Jan 27, 2014 at 03:54:14PM +0100, Hans de Goede wrote:
> >>>>>> "allwinner,sun5i-a13-usb-gates-clk" - for usb gates + resets on A13
> >>>>>=20
> >>>>> Maybe we can just remove the gates from there? Even though they are=
 gates, they are also (a bit) more than that.
> >>>>=20
> >>>> To be clear you mean s/usb-gates-clk/usb-clk/ right ?
> >>>=20
> >>> Yep, exactly
> >>>=20
> >>>>> I guess that means that we will have the OHCI0 gate declared with <=
&...-gates-clk 6>, while it's actually the first gate for this clock?
> >>>>=20
> >>>> Correct.
> >>>>=20
> >>>>> Maybe introducing an offset field in the gates_data would be a good=
 idea, so that we always start from indexing the gates from 0 in the DT?
> >>>>=20
> >>>> Well for the other "gates" type clks we also have holes in the range=
, and we always refer to the clk with the bit number in the reg as the cloc=
k-cell value.
> >>>=20
> >>> Yes, we have holes, but I see two majors differences here: - the othe=
r gates are just gates, while the usb clocks are a bit more than that.
> >>=20
> >> The usb-clk registers contain more then that, but the bits we are talk=
ing about now are gates.
> >>=20
> >>> - the other gates' gating bits thus all start at bit 0, while - here,=
 since it's kind of a "mixed" clock, the gating bits start - at bit 6 (on t=
he A20 at least)
> >>=20
> >> Right, still I believe that the consistent thing to do is keeping the =
bit-number for the bit in the register controlling the gate as the specifie=
r.  When adding new dts entries / reviewing existing ones I'm used to match=
ing the specifier to the bit-nr in the data-sheet, I think making things di=
fferent just for this one register is counter productive.
> >=20
> > And if you turn it the other way around, it would be inconsistent that =
all gates indices start at 0, and we would start at 6 here :)
>=20
> I think the problem here is that you see the specifier part of the clk
> phandle as an index, which it is not. All devicetree docs / code talks
> about specifiers or arguments not indexes. Once you stop seeing this as
> an index, you will hopefully also stop insisting this needs to
> start at 0 :)
>=20
> Also note that it already is not an index for existing sunxi clks which h=
ave
> cells !=3D 0, as there are holes in the bits used in the gates registers =
and
> calling the specifier an index suggest we're dealing with an array, and
> arrays never have holes.
>=20
> The clk specifier as currently used in sunxi clks is a 1:1 mapping of the
> gate register bit numbers, as is clearly documented in ie:
> Documentation/devicetree/bindings/clock/sunxi/sun4i-a10-gates.txt
> Where the datasheet is referenced as the source for (most) of the values
> to put in the specifier.
>=20
> My biggest objection is that this would loose 1:1 mapping we currently
> have between the specifier and bit-nr in the register, which really is
> convenient when writing new dts bindings.
>=20
> When we add an offset users will need to first lookup which clk they need=
 in
> the datasheet and then look at both the dts bindings doc to find how this=
 is
> mapped to the specifier. In my experience such an extra level of indirect=
ion
> in documentation is a PITA, and all that just so that some random number
> (it is not an index!) can start at 0 ?
>=20
> To me adding an offset here and making the clk gates different form all
> our other clock gates just feels wrong.

Emilio pretty much share your feeling. I won't get in the way then :)

I only had the compatible name comment left then.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--P6YfpwaDcfcOCJkJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJS9OQvAAoJEBx+YmzsjxAgnYwQALaxgDyQXp5sa336pRn1b+Og
2lf2yblABHAsop24ZO7tS455XEsQN6gyxuUHAswqvSG6b6dTR2F2dvwz34QxwhGe
FfWumc1mOQb2lBJEyA6bFqTzRbeF1gqmZh6N72Vhncud7xlVXMdv/mH7aFyh3+vL
luc6Ch6xrxIbtSclPcApIPZ7K8GT9LYcTPSisH2W2rueGXoefq5kjnZRQ9LZ4WKa
BImD13njGwnWCRW61xfNLmMn7RZrv6O4zLtUGqxV+AZLq7h9N1KwgfIUuYnbWQtt
4lWD3VKscrZemAjL7fmGFV9yjS6tUIDAbCOWRGaFPA5qDxivXtnAx6oRLRWtIruF
8QWLOAKOQqfURgHgqBsCPET/QTlw1CbrQi6eAnSz7tGIP9P9e/8ZeB2eW7Dx0K+Q
wvQ7TcRnMuhnSn28MBEiKVsTR5LP82k+jegbn/jggknfqT2VlxU0+Aar8/GmlmET
5X3EX26lT+aRyP09aBETXp96fJX858qiZCRiJDx3F1Fbq9JPAUFRzM6QddcnMmwJ
2pxjY5rmtoZ9C4kgoqIcfdIGn4/BRkrR0gDJMK7hjl6GX3kgYa3a3tbRexPE0Rhg
d3pLpHblFL+9WanYRPAklOV9dmxUK9YTyi2037SoMJMGIjhylc2fGyZhzfUPMf68
ecbs6OoylfnGrNbpWp2i
=Tyga
-----END PGP SIGNATURE-----

--P6YfpwaDcfcOCJkJ--
