From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: Re: [PATCH v2 3/3] mtd: nand: omap2: Support for hardware BCH error
 correction
Date: Fri, 30 Nov 2012 14:28:00 +0200
Message-ID: <1354278480.30168.116.camel@sauron.fi.intel.com>
References: <1351667307-447-1-git-send-email-avinashphilip@ti.com>
	 <1351667307-447-4-git-send-email-avinashphilip@ti.com>
Reply-To: artem.bityutskiy@linux.intel.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-DpG9zZfUrUN0u0VUCK+5"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1351667307-447-4-git-send-email-avinashphilip@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: "Philip, Avinash" <avinashphilip@ti.com>
Cc: dwmw2@infradead.org, afzal@ti.com, tony@atomide.com, broonie@opensource.wolfsonmicro.com, rmk+kernel@arm.linux.org.uk, gregkh@linuxfoundation.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, nsekhar@ti.com, gururaja.hebbar@ti.com, ivan.djelic@parrot.com
List-Id: devicetree@vger.kernel.org


--=-DpG9zZfUrUN0u0VUCK+5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-31 at 12:38 +0530, Philip, Avinash wrote:
> +static int erased_sector_bitflips(u_char *data, u_char *oob,
> +               struct omap_nand_info *info)
> +{
> +       int flip_bits =3D 0, i;
> +
> +       for (i =3D 0; i < info->nand.ecc.size; i++) {
> +               flip_bits +=3D hweight8(~data[i]);
> +               if (flip_bits > info->nand.ecc.strength)
> +                       return 0;
> +       }
> +
> +       for (i =3D 0; i < info->nand.ecc.bytes - 1; i++) {
> +               flip_bits +=3D hweight8(~oob[i]);
> +               if (flip_bits > info->nand.ecc.strength)
> +                       return 0;
> +       }

Why do you need the second for loop?

--=20
Best Regards,
Artem Bityutskiy

--=-DpG9zZfUrUN0u0VUCK+5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQuKZQAAoJECmIfjd9wqK0I+YP+gPF+ORK3F+fQONu1/VWC6yh
x80DhXGE6PRILvF72nEOi9zeAlIn+RnLCf86U27pAxFGK0I3FI97Ju+p0kEHV9VR
cFiLe7uD2MOMMDhXKMXSSU1ADNsyWiCRK6d9RaMJiu2/bDgPhKzSvTc756T81NPg
t1n/s9D7oc8QpMyUyDQmqj0LTa8qEU7f+BkXzWemuf5WAgiIWW1XSohiMoSWds9G
wxv4Xkvcggc3vTmG/H4t8rHfgTdDls9lut2UFym+Uw4HdGG6W7dRXvWOY+eEptnK
txk7qb4lfkPTuBRLQ/HQ64Qrm+7jAP0SKnawce4TsVZkLhoSmT+wpXnJaNJ5N9DO
B4gpFlBpXvEj7uFtYwosGrebgi7ANuUL8dbr0DjLCwTeN30SD/NHCoxp45RGSmIw
6HAQFNa0dPskY5AwPyHuguTmTrIBmnpB9ds2okpWhnAVtSO87vWWkVmS29Z0QaTr
1OuDbL/3RtlZrReu9Z1ohBNZoMrbPkcQKRBZT8Xw+1jglK9VhQJ6RUCd9u59g+ui
k9LnQDL8vgLq0oTENSR104ltBRBZhqHhTbjlDQ/cWpHV/j1/kM3j5dLnHjRKKe6l
gtIrLkclODVgiMLI2tM6KtmDG26wi+9JV9jnPhYKuNj0hs6RMa6e8F1VtkfIGeeB
BkXuqPk0atd8IOow/Dmw
=5I13
-----END PGP SIGNATURE-----

--=-DpG9zZfUrUN0u0VUCK+5--

