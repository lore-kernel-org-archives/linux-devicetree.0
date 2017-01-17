From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: Add Mali Utgard bindings
Date: Tue, 17 Jan 2017 21:51:19 +0100
Message-ID: <20170117205119.5cb2qc5wclxd2a3v@lukather>
References: <20170116132424.7038-1-maxime.ripard@free-electrons.com>
 <20170116184906.r62di7xiil5lae33@kozik-lap>
 <20170117093813.mxp2hgoxbgske6ru@lukather>
 <CAJKOXPdbbzoqNLg=iRGC8ijVPdpLD5+CFyqysfM49vkx6o3rRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5309412147619014085=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAJKOXPdbbzoqNLg=iRGC8ijVPdpLD5+CFyqysfM49vkx6o3rRQ@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kukjin Kim <kgene@kernel.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>, Carlo Caione <carlo@caione.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============5309412147619014085==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rgin5sp5xdw4efym"
Content-Disposition: inline


--rgin5sp5xdw4efym
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2017 at 01:31:19PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Jan 17, 2017 at 11:38 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Hi,
> >
> > On Mon, Jan 16, 2017 at 08:49:06PM +0200, Krzysztof Kozlowski wrote:
> >> On Mon, Jan 16, 2017 at 02:24:23PM +0100, Maxime Ripard wrote:
> >> > The ARM Mali Utgard GPU family is embedded into a number of SoCs from
> >> > Allwinner, Amlogic, Mediatek or Rockchip.
> >> >
> >> > Add a binding for the GPU of that family.
> >> >
> >> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> >> > ---
> >> >  .../devicetree/bindings/gpu/arm,mali-utgard.txt    | 76 +++++++++++=
+++++++++++
> >> >  1 file changed, 76 insertions(+)
> >> >  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-u=
tgard.txt
> >>
> >> Do you have a driver in kernel which will implement these bindings?
> >
> > No, but we have bindings for out-of-tree drivers already.
> >
> >> Defining them for out-of-tree driver does not bring any benefits
> >> (3rd party driver will not respect them anyway).
> >
> > You could see it the other way around too. The out-of-tree drivers
> > don't respect it at the moment because there's no binding to respect.
>=20
> Indeed, that's a point. However valid only when the out-of-tree driver
> will respect them, for example do not break them on next release.

If you're talking about the default platform provided by ARM, you also
have the option of creating your own. That's what we did, and it
worked like a charm.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--rgin5sp5xdw4efym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYfoPHAAoJEBx+YmzsjxAgMz4P/3J4+5ZpcdfGLQLsxNhcFBVn
M+uaan4i3HWb79xn5cTVamBzGjF1+Rna89jMEAUeR0V4Nde11Oo8Ja8CUJvD+47A
b/E63kJ1+TG1LO986h+SWJtxOc8t4qiTNKQrwowUUQIgLfYHy41XtF26KAvDX6CQ
DgyF4suh8clpydz4iScukBqfl1Gini3zqbOlUroYcMoGImRlxg1e2dXXlfWi1twe
9b25BfJpM8bDn6/ojVw2e+DGXEBzS8ae9w3hpbf8+byb/gPcl5oq5IImKALFr2KX
SdK4DEgHODTOAMbVv9cuS45eZWIooi5xA+cbChzMb8Mz3ESXkLgFTy7paQbiIFnk
3/mpYtVCtzLVkj+xq5VVFjIV6r3BZh6A6Uyyn42BsOHlHdsPnnJgGfEzOR+8fZ5a
LdxLG3ZrZHticPiUCAI2/dsW5ocoYFfd9ecVF4a3HJgyZcHH09cFdmUYxhGBIVnA
GvX8BTP0Cq+WxY9N8oQSlOJb+8B3xx6adI5u5B91RB1uj8fCcu8LuTEtoj2BjQOo
1B3T6maPvg82hkZgLxkMEbS0nXNXcgYYKJg6gMKQd5i8aKeAaS+4o/6aKPFWD77f
BwCN+F6tDq97pNzUqcLLxuHimMjtt1euF1KmnboSuRW/ST6a8iyKgo8CJdfFXoGi
Z6dcQch5FJsLpEaZ0flG
=FFgJ
-----END PGP SIGNATURE-----

--rgin5sp5xdw4efym--


--===============5309412147619014085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5309412147619014085==--
