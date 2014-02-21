From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/3] NFC: trf7970a: Add driver with ISO/IEC 14443 Type 2
 Tag Support
Date: Thu, 20 Feb 2014 19:20:14 -0600
Message-ID: <20140221011955.GC19336@saruman.home>
References: <1391206631-9862-1-git-send-email-mgreer@animalcreek.com>
 <1391206631-9862-2-git-send-email-mgreer@animalcreek.com>
 <20140221005059.GS18868@zurbaran>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="brEuL7wsLY8+TuWz"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140221005059.GS18868@zurbaran>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: "Mark A. Greer" <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>, Lauro Ramos Venancio <lauro.venancio-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Aloisio Almeida Jr <aloisio.almeida-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Erick Macias <emacias-l0cyMroinI0@public.gmane.org>, Thierry Escande <thierry.escande-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfc-y27Ovi1pjclAfugRpC6u6w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--brEuL7wsLY8+TuWz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 21, 2014 at 01:50:59AM +0100, Samuel Ortiz wrote:
> > +#define TRF7970A_QUIRK_IRQ_STATUS_READ_ERRATA	BIT(0)
> Are there actually any TRF970 devices that do not need this quirk ?

in the oven ;-)

--=20
balbi

--brEuL7wsLY8+TuWz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTBqnOAAoJEIaOsuA1yqREDakP+gISIGOrOTXn/8FGkLmoMAic
NKYddiwynGB2eZRTR4LSBH0GzZ0LAV1xP4LF8qoFqYImcycqKX5P1hLWkb1mG45x
V715me8v7Bl6hTjyhA/VrUaTvm1n5JwfXhoS+vDHXSN8heMKKZpbS01B4BGOS9bE
Bdnp35RWNNap1c9mn4pyhYop1hZ10zrx8TXx/zdTRZcH4Y+HBbIXAtQnC0/chvx/
meGfJqEyP35/JViHfg1QVx4L4skQgccnV3KAxgYgyygiTTx1RtKApxJw6MjpCSxY
jkEGHnLfNGXNdt14Y0tEJ1YZObbzD17r4E0fTow6vLapL5app11rkUNQaHV4jhRW
fUjeiE2oviZ8oqdm8oBiyj+YSxQBi+AyyNUlL8y7wfrV5xtlF2A0SG13WFkqiE8h
Mdq97NBzsNthMg7DsHOoFdHsqnJ3BMLHcFv35CU2RcKRs4SkIunDzmY+g76+DXau
jtc8JnZ4L+jzw+QGQYaJlGX3Ozy4nrl9s8kzdYmtmm0YYt0VPCvX3jyP4E6avgqi
hpqqEnuRhb1/NO18ztzjCSeC9kn6myU99EmWbQ30NmUQ+w1glvxqQ+QNk6q/GEVQ
L6as8i/Rq9k/tK4thdz4SgKK3tFehLv2m2kl9yJuQdPI2K8Rrjmp+fNHXYkAZTSj
PlDlNuyw1+JLlyO/Pfn5
=pRcA
-----END PGP SIGNATURE-----

--brEuL7wsLY8+TuWz--
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
