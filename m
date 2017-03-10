From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 1/2] doc: bindings: Add bindings documentation for mtd
 nvmem
Date: Fri, 10 Mar 2017 07:38:10 +0100
Message-ID: <20170310063810.2efkb6j2kdgadalv@lukather>
References: <1488875164-30440-1-git-send-email-albeu@free.fr>
 <1488875164-30440-2-git-send-email-albeu@free.fr>
 <9f54978c-6d61-cf2c-fb2d-f5ef2af19e0f@gmail.com>
 <CAAtXAHc34fG_TZbHrRp=oB_e=-o18zDesT73YSEx1Tr5ZE0oSw@mail.gmail.com>
 <eb8f93fd-0534-2b91-7fec-7d40ddf7b8cb@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3arhlnyyg55m4xqf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <eb8f93fd-0534-2b91-7fec-7d40ddf7b8cb@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Alban <albeu@free.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Devicetree List <devicetree@vger.kernel.org>, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--3arhlnyyg55m4xqf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Fri, Mar 10, 2017 at 05:52:36AM +0100, Marek Vasut wrote:
> On 03/10/2017 05:06 AM, Moritz Fischer wrote:
> > On Thu, Mar 9, 2017 at 7:17 PM, Marek Vasut <marek.vasut@gmail.com> wro=
te:
> >> On 03/07/2017 09:26 AM, Alban wrote:
> >>> Config data for drivers, like MAC addresses, is often stored in MTD.
> >>> Add a binding that define how such data storage can be represented in
> >>> device tree.
> >>>
> >>> Signed-off-by: Alban <albeu@free.fr>
> >>> ---
> >>> Changelog:
> >>> v2: * Added a "Required properties" section with the nvmem-provider
> >>>       property
> >>> ---
> >>>  .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 33 ++++++++++++=
++++++++++
> >>>  1 file changed, 33 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem=
=2Etxt
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b/=
Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> >>> new file mode 100644
> >>> index 0000000..8ed25e6
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> >>> @@ -0,0 +1,33 @@
> >>> +=3D NVMEM in MTD =3D
> >>> +
> >>> +Config data for drivers, like MAC addresses, is often stored in MTD.
> >>> +This binding define how such data storage can be represented in devi=
ce tree.
> >>> +
> >>> +An MTD can be defined as an NVMEM provider by adding the `nvmem-prov=
ider`
> >>> +property to their node. Data cells can then be defined as child nodes
> >>> +of the partition as defined in nvmem.txt.
> >>
> >> Why don't we just read the data from MTD and be done with it ? What's
> >> the benefit of complicating things by using nvmem ?
> >=20
> > Well because usually stuff like MAC addresses etc are stored in eeproms.
>=20
> But eeproms are already supported, see drivers/misc/ .

This the old, free for all, way to support eeproms. We have a proper
framework for them now, and it's called nvmem.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3arhlnyyg55m4xqf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYwknOAAoJEBx+YmzsjxAgGmUP/RX1rovHyKm3sd7r9B37+XOy
Z0Kxte3kbZAtaCLOdjoOkuXW4gSDLxHJhnLN+v+obdpqhQ2319UiHnpsJ/4mzJ83
51N5UF9kpyWKau7MfiHUn+g9DvDsFFUhjRZBxqOq2YfKmBQekH6WEHcFDoWju4s7
2gqOty5U/sdpcITjA+SkaZ4Z88ZuPL6swprzXkcoiE+6MCG9KESguaW2bIf4qPMr
DrV+ynUdWmUxEzVL68SCALBk5Jen8e6FR0Saay4NrJMDRurNmr3b59h+c0g5lBXM
CD+7zKPRzOjAPsdARpqz718MQlUOlEren1UHsecANWjD5iR/JNEw5S5NKkrz2E/s
7x2f40TTDcThwpDo5ZD77BY8qiJ/2jrmoWmTiYpcdO9xYF9qtkrbemKpPjhBONAT
MZgpPmuU31tF29n0c4YRHwrbCzmXFjV2fxLlPOdO5+vvzJau+airOXc9Esqc4bqh
bBD4eEyzW9MY5m0E9sWkk50ZzgZg2tzVYWrMsYpIVCmJWiLvUq/5mqzsYgHdlIgx
lcvjugRuR8OUqWloguemvhrHqqzb2poZiYeofrleS2SECzIvy1ZmilNiXVsj1rW1
zOzdYTiPJLnIQop3TECAmetmFGXh0jDhxLgJB76dwhqWXkJ4uwf96TKO5OACwhP6
Aul97yaL7gAdbh7I1kwE
=nPb9
-----END PGP SIGNATURE-----

--3arhlnyyg55m4xqf--
