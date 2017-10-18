From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [Ksummit-discuss] Devicetree Workshop at Kernel Summit Prague
 (26 Oct 2017)
Date: Wed, 18 Oct 2017 13:59:10 -0400
Message-ID: <20171018175910.GP12015@bill-the-cat>
References: <CACxGe6sxKzNKZbdGA-G=Th2oHwuanyC2kGYuaFcKbSRkuhep+Q@mail.gmail.com>
 <20171017114823.58476908@bbrezillon>
 <CAGb2v67GU4uW7uPMrqFjTW0qBR6LPNeX4Md+tf9S=HRWT_GVqA@mail.gmail.com>
 <20171018110958.mh76pngzluazmc7y@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Y5U3e7U54RGuQ3mm"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171018110958.mh76pngzluazmc7y-7j8lgAiuQgnQXOPxS62xeg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Y5U3e7U54RGuQ3mm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2017 at 12:09:58PM +0100, Mark Brown wrote:
> On Wed, Oct 18, 2017 at 06:35:24PM +0800, Chen-Yu Tsai wrote:
>=20
> > I'd like to add something on the topic of non-Linux projects. In this
> > case it's diverging DT bindings from U-boot:
>=20
> > https://patchwork.ozlabs.org/patch/823158/
>=20
> > U-boot already has a set of devicetree binding additions:
> > https://github.com/u-boot/u-boot/tree/master/doc/device-tree-bindings
>=20
> > The patch in question wants to ab(use) the regulator-name property for
> > driver instance binding. In my opinion this is not going to fly, as
> > boards are free to define the names. This either sees no use other than
> > as a dirty workaround for dts files that aren't following the PMIC
> > regulator bindings (regulator node names should follow well defined,
> > identifying names), or results in divergence of the DT files.
>=20
> One meta issue I'm seeing here is that the u-boot people appear to have
> their own divergent copy of some of the binding documents.

Putting on my U-Boot hat now, it's mostly unintentional and something in
general (yes, the initial topic here is not such an example) we try and
avoid, or use u-boot, as the prefix on as it's something that had been
previously rejected or deemed inappropriate to be in the upstream
version of the binding.

But perhaps it's time to try and force the issue again, given what Rob
and others have said in other parts of the thread.

--=20
Tom

--Y5U3e7U54RGuQ3mm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZ55ZuAAoJEIf59jXTHXZS/zsQALR0lw2OwGhx/6uTExhOCIx5
C7rFyqbUtJayNjXZh5Qp6vGIdVkC7eNTinTyfKJ2Mq5bcv/KGh0kfxDj9CzB/8MA
YfEQDxuGUAs4zALiUD6k4kTqWNhM7Sr6gEGUa4dTmZMXOiIwBIgiy3il6MaAJGHv
SRcQZsXNUVAcxTXzUu628idbCtCmMUpFaPxSNET7KbjbjYqeiySEFDf1prMhzKvD
bq0Q17Vf9ZPO+7jqb1GE9W6tlD4TL7X2oU+DTySrQgUlei6PelA4/MnciWGo82ik
oezMUk6TtkmnUNzSYm9g55ZcyQEZyzlQd2kQ/9/SoBM3YkbQAqroDQ+LHHJWXqjN
ElZANJU4CTdabTBHUilU74HAzXXB1A+/1keI6zJ0FE4c61v9x0jh5Kl7WZnfEdQY
/kMyh+2mCBEVEIVM7znna/rOtVYU3jyhsUAbW84JlBfuLC4gr7zXN4kWe3a6BWWZ
kt1OFJr0l2RCxBJ2kJC4o+MrHRsCqSx0bx9ujxmxV4O+SuTysE+Jkdxh2xbW/612
Cv7x1jabMYiWEfe8kbADoZldAiXTaSIvAzaLVW5DApDDwAK0ujEqriO9igHTelCq
3lhta8FekAp5yYd4bog5Q0uExaaJwCW4WNrlpyeXWKJjY0nUI8A/Ww+opF+OuTp7
+eC10pLJJGfMGv3Fkm11
=HSQB
-----END PGP SIGNATURE-----

--Y5U3e7U54RGuQ3mm--
