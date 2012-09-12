From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2] usb: gadget: at91_udc: dt: fix platform_data check
Date: Wed, 12 Sep 2012 09:14:16 +0300
Message-ID: <20120912061414.GB18563@arwen.pp.htv.fi>
References: <1347365267-7507-1-git-send-email-fabio.porcedda@gmail.com>
 <504F2C83.7080706@atmel.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <504F2C83.7080706-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 11, 2012 at 02:20:19PM +0200, Nicolas Ferre wrote:
> On 09/11/2012 02:07 PM, Fabio Porcedda :
> > Don't fail the initialization check for the platform_data
> > if there is avaiable an associated device tree node.
> >=20
> > This patch fix the dt support introduced in 3.4-rc1 by commit
> > ("d1494a3 USB: at91: Device udc add dt support").
> >=20
> > Tested on a at91sam9260 based board (PRO3-EVK).
> >=20
> > Signed-off-by: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: Stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> [v3.4+]
> > Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
>=20
> Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>=20
> Felipe, Greg, can we queue this one for 3.6-final ?

I had already taken the other version before Fabio sent this v2... it's
now merged in greg/usb-next branch. I suggest doing a cherry-pick for
stable tree and resending the patch once v3.7-rc1 is tagged.

cheers

--=20
balbi

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQUCg2AAoJEIaOsuA1yqREbd0P/27XDPjbEO/X/evJfWUzxIHs
AF5UPrqQmvEEtPm3NKFgj5eUWfGE+3Hr1MQUsuPvLqYhKqa/Ky/acgN0jHnuaXP3
TZdZPJJ4EBQf8Uyhv4IcbN2RfMrfxDdNYwsmAlNZQhuuqpMQMOJ/cqJfyV1Bsk92
i4Ra6QPE66LP01SHCtmxEd3KIAf1Uj28ilkuP0E2eSuGHLrC9AGe486w6cVad31j
iGl6kMXdWkUDMgaLaERvigvMbyG0Bs1h3wQecgNi5N/TIHYMNBPzz4RZJOKSVNKw
4rohzUV2AAdof7miLLYHhJeTqCYgcNneeLVT/ZCsYvpvVkgs/GB3Qqp8BJjJJ3C1
E0rquRWMxWM0hogtl/zvrpabTBv//Pch5F4gUbrF7wne+V9olvI1lH+qvvXr9Vx5
ZIUoOyIt+6jmOt2yTWrm4ld+tcLkSzGX9jPglRD1rA1GygULnp8gyNuGFGnW0Fo1
fuSmp1ngD1ySIzEGtybxdgJDWdjDC/IuBZgsq1eyll05rIkltuZk181aA2zWEyUv
xlIP+kX48lQ4nrTw0/Em3ZBB8XAgUV23pXieX3IQH/AwRbkctyPBDMZV8E2S/yf9
K4uTm3NmHJ1qQjSsgOTF435qmEbVHs80Bw74ChgwXEh8wuYLjpk7oesEcNAQp6jZ
NiThvFaYB/mqS2igisNO
=F03R
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
