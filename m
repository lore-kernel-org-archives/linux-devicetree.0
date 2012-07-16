From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [RFC PATCH v2 1/2] drivers: misc: omap: add a new driver for
 ocp2scp
Date: Mon, 16 Jul 2012 11:12:05 +0300
Message-ID: <20120716081204.GI7955@arwen.pp.htv.fi>
References: <1340370942-23201-1-git-send-email-kishon@ti.com>
 <CAAe_U6+dkiQw-i93pFapt6qKrArzaQoE8X3GjDzUDraziG8B2Q@mail.gmail.com>
 <20120625122449.GA30463@arwen.pp.htv.fi>
 <201206251626.09666.arnd@arndb.de>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4663252096285554978=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201206251626.09666.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, "ABRAHAM,
 KISHON VIJAY" <kishon-l0cyMroinI0@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============4663252096285554978==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1E1Oui4vdubnXi3o"
Content-Disposition: inline


--1E1Oui4vdubnXi3o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 25, 2012 at 04:26:08PM +0000, Arnd Bergmann wrote:
> On Monday 25 June 2012, Felipe Balbi wrote:
> > > > Can't this live where the scp drivers live?  Actually, where is tha=
t at?
> > > > Do we have scp drivers?
> > > AFAIK, there isn't any driver for scp. But we have a driver for ocp
> > > and it is present at arch/arm/mach-omap2/omap_l3_noc.c
> >=20
> > I don't think this deserves a directory of its own. Maybe
> > drivers/platform/arm/omap/ ?? the l3_noc is an OMAP-specific
> > interconnect and the SCP bus is also an OMAP-specific bus. I don't know
> > of any other arch/soc who uses the same interconnect IP as OMAP and the
> > same ocp2scp bridge. That bridge was created by TI for all I know.
> >=20
> > Greg, would drivers/platform/arm/omap/ work for you ? We could also move
> > the interconnect drivers there.
>=20
> I really don't like the idea of introducing drivers/platform/arm/ because
> very little of the stuff that one would put in there are actually ARM
> specific.
>=20
> I have suggested a drivers/bus/ before and people did not see the need
> back then, and we agreed to continue having a directory for each bus,
> as we have for the big ones (pci, usb, i2c, spi, ...) and a lot of
> simple (amba, rapidio, bcma, ...) or obscure (tc,  vlynq, nubus, ...)
> ones.
>=20
> I think we should reconsider the idea of drivers/bus/ with a file per
> bus in there at least for new buses, but doing a new drivers/scp/
> would be ok for me if there is enough opposition against the idea
> of drivers/bus aggregating different buses.

I don't mind either way. The fact is that this ocp-to-scp bridge is
really a TI/OMAP thing. Not sure it deserves a directory of its own.

--=20
balbi

--1E1Oui4vdubnXi3o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQA8zUAAoJEIaOsuA1yqRE4JkQALI83LTo9OfM8CoTYh0g7KGd
5TJvXf0AG0WBfCoDlQvZ9j5EgtYRszt3i+M9E+0w+kyvzyGbIJKfLY/IfB4rr3BR
dh79GY4omy6olnD4qU6cKv4lOz36W+LFgbM61ncopuo3zUXMPWy6cgOGnMWnSRFl
XGs53wEWyC0Ya2GB81c5HXXMAlMJYQOwF2yQgQczR9ruS3cVPZbyZwylK/to0cFa
utLMCVH9SZDBEZLtz6krTPf2Msm2paa74FFmDvgQTbkz6Ytz5rOPkmzeqUjapAzx
8EnMrzEBbpRXC+wTmnCNw+Cp5lU2xF4kgWWkE0JITimEQcLPo3/N0BlNnCW3VDEl
oAVJyNpEU1Tgeeby415yiVaUKBKEECVdKXJgalZud4FEnEThyiSqKsw7N4Vsp3aF
iIBO/8Nth/3kdwPvf4hVdC28+rDKqkOPm8hG/qW+eAvKRwb4K5J5Wa9yIAG+QmLl
E+eD+NIHeVb86JmtlLubn9X50mInRV6qVGS2KYkCYHAKiU2oIPRZq/prnahTP9Jx
LJq+/DiHFoyqtsz7rOq8YzGePKKGMRmU4XnaAAJFhRxQBNbLDI8sP0UTpxUFQpEx
/OqeFIacUyw5WgFHmYF6UZJYt22rqDX0Kv5r++/Xg1jKvEgdeqWUIS+89AmuuQ47
2ViplZx5LsFYUuxnn2I5
=uQmT
-----END PGP SIGNATURE-----

--1E1Oui4vdubnXi3o--

--===============4663252096285554978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4663252096285554978==--
