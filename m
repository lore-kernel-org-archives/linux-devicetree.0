From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: Add Mali Utgard bindings
Date: Tue, 17 Jan 2017 21:50:03 +0100
Message-ID: <20170117205003.5vrwo4gnsdse2isk@lukather>
References: <20170116132424.7038-1-maxime.ripard@free-electrons.com>
 <20170116184906.r62di7xiil5lae33@kozik-lap>
 <20170117093813.mxp2hgoxbgske6ru@lukather>
 <4f5b8608-af6c-3ef5-aaf0-e7e034d006cd@baylibre.com>
 <CAJKOXPe5AWTK+NuVpiObzjEG+CFWB5_AeYncNkbkSXRr+4RQUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4434190453456822776=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAJKOXPe5AWTK+NuVpiObzjEG+CFWB5_AeYncNkbkSXRr+4RQUQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Kukjin Kim <kgene@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Carlo Caione <carlo@caione.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============4434190453456822776==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sl5avpbi22etgpzp"
Content-Disposition: inline


--sl5avpbi22etgpzp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2017 at 01:33:57PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Jan 17, 2017 at 12:22 PM, Neil Armstrong
> <narmstrong@baylibre.com> wrote:
> > On 01/17/2017 10:38 AM, Maxime Ripard wrote:
> >> Hi,
> >>
> >> On Mon, Jan 16, 2017 at 08:49:06PM +0200, Krzysztof Kozlowski wrote:
> >>> On Mon, Jan 16, 2017 at 02:24:23PM +0100, Maxime Ripard wrote:
> >>>> The ARM Mali Utgard GPU family is embedded into a number of SoCs from
> >>>> Allwinner, Amlogic, Mediatek or Rockchip.
> >>>>
> >>>> Add a binding for the GPU of that family.
> >>>>
> >>>> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> >>>> ---
> >>>>  .../devicetree/bindings/gpu/arm,mali-utgard.txt    | 76 +++++++++++=
+++++++++++
> >>>>  1 file changed, 76 insertions(+)
> >>>>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-u=
tgard.txt
> >>>
> >>> Do you have a driver in kernel which will implement these bindings?
> >>
> >> No, but we have bindings for out-of-tree drivers already.
> >>
> >>> Defining them for out-of-tree driver does not bring any benefits
> >>> (3rd party driver will not respect them anyway).
> >>
> >> You could see it the other way around too. The out-of-tree drivers
> >> don't respect it at the moment because there's no binding to respect.
> >>
> >> And at least for us, we definitely plan on doing that.
> >>
> >> Maxime
> >
> > Hi Maxime, Krzysztof,
> >
> > We hope this will be accepted so it will solve the same issue we have o=
n Amlogic SoCs
> > and all the other mali powered SoCs.
>=20
> It will be helpful also for other SoCs using Mali 400 (e.g.
> Exynos3250, Exynos4412).

Yep, hence why you were in Cc :)

> > Having mainline bindings will forcre out-of-tree driver to respect thos=
e bindings
> > and remove a dts out-of-tree patch aswell.
>=20
> I would argue here over the word "force". Having bindings defined here
> does not force anyone into anything. The out-of-tree can do whatever
> they want. It is a wish from kernel side - it might be respected but
> it might not.

Well, that statement can be made for each line of the kernel itself,
nothing forces you to use the code as is, or to make any kind of
modifications, including to its ABI. You just have an incentive to
respect the various frameworks and ABI because it's the path of least
resistance and all the tools, libraries and applications already know
how to use those interfaces.

But that's just it, an incentive, that anyone is free or not to comply
to.

> Just to be sure - I am not opposed against. Some time ago I wanted
> Mali400 to be upstreamed but with current policy about user-space side
> it is not possible.

While I would also very much like to see the kernel driver upstreamed,
this is unreasonable at this point. But this patch is here only to add
a binding to it, so that the out-of-tree drivers can comply to it, and
this is something we already have done.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--sl5avpbi22etgpzp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYfoN3AAoJEBx+YmzsjxAgbiAQAKDVNA6faFJx+gDPt3F4y+a/
ZfAHAooz+54fhfeJqABQgKITE2QQDBFMGSb/MUQCcgDtGOWe6vr5qO56jUOVOtmr
c2H3f3/Ctst9Cg2lVfKGliEYTfNuSIfjNgxXxSYLlwixWVnWQf3iqO6WW1I/CPDy
iWASeqjSRYCHDUaomM6Ky0mw0xVPJ5Udhd6ibSq2hFXfSnqpfGgeo8vCr8SmgO1k
SEaA14zWFmfzYUIZewpbU5yMhP7ZrazLpetJjDszAM1q05jonIFNhi9Wb5ilaf1u
nunCGUgHEZqf3qygwQBGARosXL+bhvtXF5CRopMvRWLO7qRuMYoH97HVij8G0BbS
8KE5NbhRo6+4VylEZB+VS4mJ/N6hjLV51sD3BiJa7zWHgIzTys6pe7fWH3ZGoFPN
Zb00cNfrTSLem2/DCQ2uaKCsTwl0CRriNPh4iHCXqsfVn0OLcHLZ45fWHfajlXWq
uqWPXqHJj+ROgF9AzxGDaVc+ephN6IVqGeXjtZDrxRJFCLyx/HzD0LIluX6eI7V6
3tmKOY33hy/oOos85BCf4ATslJza3dw86cWRdN+so4QJp3CoTucAkmErz7CVIMi9
Yg01ZolUScZ73dHD3luFuOU8bHfv+8YkKSf4hvGw9bjA3RQqaEpxfG/LJRfhhgi6
FS4n3pL1jEIG5koAOOXU
=YJpE
-----END PGP SIGNATURE-----

--sl5avpbi22etgpzp--


--===============4434190453456822776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4434190453456822776==--
