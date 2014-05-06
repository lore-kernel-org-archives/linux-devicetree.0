From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 04/20] usb: xhci: add a platform-private field
Date: Tue, 6 May 2014 10:40:14 -0500
Message-ID: <20140506154014.GG25849@saruman.home>
References: <1399335255-589-1-git-send-email-gregory.clement@free-electrons.com>
 <1399335255-589-5-git-send-email-gregory.clement@free-electrons.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Cp3Cp8fzgozWLBWL"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1399335255-589-5-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Cp3Cp8fzgozWLBWL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2014 at 02:13:59AM +0200, Gregory CLEMENT wrote:
> This patch adds an xhci->priv field for private use by xHCI platform
> drivers. This field was present for OHCI and EHCI and it was not
> needed until now for xHCI. With the introduction of the clock support,
> then a private field will be useful, so let's mimic what have been
> done for the other HCI.
>=20
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>

> ---
>  drivers/usb/host/xhci.h | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index d280e9213d08..054017f66246 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1584,6 +1584,9 @@ struct xhci_hcd {
>  	u32			port_status_u0;
>  /* Compliance Mode Timer Triggered every 2 seconds */
>  #define COMP_MODE_RCVRY_MSECS 2000
> +
> +	/* platform-specific data -- must come last */
> +	unsigned long		priv[0] __aligned(sizeof(s64));
>  };
> =20
>  /* convert between an HCD pointer and the corresponding EHCI_HCD */
> --=20
> 1.8.1.2
>=20

--=20
balbi

--Cp3Cp8fzgozWLBWL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTaQJeAAoJEIaOsuA1yqRE0eIQAJ8f8Ky6nc6bPSl/VzLKtJF1
gCXhMvocUl2WwGUr/oikTPkgAXCChrQpAlfzhl7h3GLggOHV23yCND2/DdChHkQf
LwE4Mn7E06lUTTKYkdOrYQ6/Y2jXpOkyGK5kUB45wgu30k2RAXhBBGUAhu1kyjVo
ESV4sH7CoGeYda2WKa792r6GudpwGOXdiXnyJD8XBNuWU1GNSVkse51QebSjE2VV
jnZKB+KAIRZexOF4HNRHkoP5UiM2cZuvOo6ENvPqrGw3FEWXna22fjpnW9G1GiyE
tIB1LV/TkwAd/lm8i9tEl/ifyQxwffuS26XpRR9kXz8CmznFhJTTK/VyfQmDv5Y+
GE5AoRlR2SFcTLWKnVH+pxzlZ43qJ5Sv1PlxU00511IUofgI66dMrfJ3Q4mqY8tj
I+bNFojjNPYuh/zY/Pb7HKrPpYhWmTMC2ErNBLJaudKelcj1uhtnn+OnR30VV4RN
GVCwU1bzDHCLyVzROlBrpIY9GfIoB8l2CSkE2JiXGFNMosSES2QUpiEZaxtTkRDb
5/H7vW+Nq/AkjFRJsirh0FUhjpqMhv5V0y7Vr/okyqt5a7I+p3e3XfJ3Pux4r9Bx
ja66SMxeSDa/oKHnUnfbvxUdy20J0Ao79vkjA6gW0JkflhT1cEJk69M5TYr8nb+d
e2/YLodFIz1srGz+n17n
=tyjZ
-----END PGP SIGNATURE-----

--Cp3Cp8fzgozWLBWL--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
