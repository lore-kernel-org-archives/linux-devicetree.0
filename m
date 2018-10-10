From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v15 06/16] of/fdt: add helper functions for handling
 properties
Date: Wed, 10 Oct 2018 11:30:16 +1100
Message-ID: <20181010003016.GH7004@umbus.fritz.box>
References: <20180928064841.14117-1-takahiro.akashi@linaro.org>
 <20180928064841.14117-7-takahiro.akashi@linaro.org>
 <CAL_JsqKwmcdQ+2eK3LGHhcQ2Wb+Yz1-Atz0-3K6WKNZQt_woVw@mail.gmail.com>
 <6a8d3ddb-c3bc-c044-4d6c-55e110d89e72@gmail.com>
 <20181005050627.GL32578@linaro.org>
 <bd3d0472-1bd7-52ed-b9f6-b5edae8c8b6d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="d3slIU+tL1lDaIh/"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bd3d0472-1bd7-52ed-b9f6-b5edae8c8b6d@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: "AKASHI, Takahiro" <takahiro.akashi@linaro.org>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, David Howells <dhowells@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, David Miller <davem@davemloft.net>, dyoung@redhat.com, Baoquan He <bhe@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, prudo@linux.ibm.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>, James Morse <james.morse@arm.com>, bhsharma@redhat.com, kexec@lists.infradead.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel>
List-Id: devicetree@vger.kernel.org


--d3slIU+tL1lDaIh/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 09, 2018 at 11:02:29AM -0700, Frank Rowand wrote:
> On 10/04/18 22:06, AKASHI, Takahiro wrote:
[snip]
> >>>> +int fdt_setprop_reg(void *fdt, int nodeoffset, const char *name,
> >>>> +                                               u64 addr, u64 size)
> >>>> +{
> >>>> +       int addr_cells, size_cells;
> >>
> >> unsigned
> >=20
> > fdt_[address|size]_cell() returns an int.
>=20
> I stand corrected.  They take advantage of the fact that valid values
> are in the range 0..4 and return a negative value for error.

I'm not sure if the spec formally defines that these values will fit
in a positive 'int'.  But if addresses are 8GiB each, you're going to
have much bigger problems putting it in a device tree than this
function.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--d3slIU+tL1lDaIh/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlu9SBgACgkQbDjKyiDZ
s5Joog/+Mp4GTHh8MV62ufe3LUp5dlUtwKaKypnCp0sN4DKEcqwzn/GHlv/FxZ1f
4FWaF/NOJQ3tvqHrX/uS9S2YNe0EILpEz4dllcVBi31MRwwP3XRsPriKSD1JLFFu
MJSiNVztKYw91UwbOo6e2etdRlNytAfNz6BMiBCtZUlwxqlsB4svjNLifTeazhEk
UuzPeekac6W4sSRqExSR/vX8jR8yl9S0VhftH83nDZrHyjwZYeLgW0o8iINHkUGJ
YxvtyL6kEX7uMn1JtqPxHfBxZlKOLrxSasbziqJVvUwzAV9DU40Rp761YbjUlrkV
zGAOswcB351l58jf3EQOVnmszeXK0ZeeyOABr0WD8z0VHt67sBL6gFkNcS8OLOjm
KMTwAyRz99tmUW044RAJREY907NJGiO69MJyJzWn9JMyk+E/rWto8Q4AkrmNpzrz
KsYuwymXIjFFKMdDdnfamf3YLjx86pa7Q5Tu8xmh1HEjrUaYwFqptaFpjDBAFRAR
C5EY14p/ftKrl4O1LhqRDj2Xe0/+ZWeXPlCLlHYejNFqWBPlyE6ukrRLAg1TF0Sv
cbyylJams/EaC2VIv6ztpyVf5T/fgPf49mXof67scxnmiMzgN9WhH6V8wKHCFZ4V
7ElFrHb4WK+YB6CY7U61SuVvpBJuwH8a0XBJoh1h+e9EdSm2UMM=
=lNt5
-----END PGP SIGNATURE-----

--d3slIU+tL1lDaIh/--
