From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 3/8] xhci-platform: Add a new controller using xhci:
 Armada 38x
Date: Sat, 19 Apr 2014 22:21:59 -0500
Message-ID: <20140420032159.GC26893@saruman.home>
References: <1397816563-9000-1-git-send-email-gregory.clement@free-electrons.com>
 <1397816563-9000-4-git-send-email-gregory.clement@free-electrons.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1397816563-9000-4-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2014 at 12:22:38PM +0200, Gregory CLEMENT wrote:
> Extend the compatible string list with xhci-armada-380. It is used to
> describe xhci controller which is in the Armada 38x SoCs.
>=20
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documen=
tation/devicetree/bindings/usb/usb-xhci.txt
> index 90f8f607d125..c49c14037afe 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -1,7 +1,8 @@
>  USB xHCI controllers
> =20
>  Required properties:
> -  - compatible: should be "generic-xhci" (deprecated: "xhci-platform").
> +  - compatible: should be on of "generic-xhci",

should be "one" of.

> +    "marvell,xhci-armada-380" (deprecated: "xhci-platform").

and this gives me a better idea, instead of using the quirk I suggested
before, match against this compatible:

	if (of_device_is_compatible(dev, "marvell,xhci-armada-380")
		xhci_marvel_mbus_init_quirk(dev);

--=20
balbi

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTUz1XAAoJEIaOsuA1yqREYIgQALVyDBue9uvhNyN1mAstkVV1
nAVviGXycW6K8GW/O95ihuRSjsHeqHMxQsWlPzylz1vaWm4mlXIQUg/wvDRESAbI
oB3i88CSOI/r+C1b9UnOcMF99oo/upyLp3zKjZKKuAbMjFUwU85UaRhHhYpnprxk
rXyGv44eCZIaYQkEtUE+6Mlu7E4KxpdxcpDX6O2AeDh19D3kfQgC63cPQe8UMRFC
y64SHcQuRcFr3d+3s32sn/DbNunIZ/+0PK+IVpCpLVyiE622mK4ME7fRAY1ribnf
BGMn0jmRQ7ESoMHP5GE1+pWsizqHQOS9umcFR724UsHFoREfDkvR362wk0okxUg5
VmVMMiQTlA3re9OnjYoWFVwrFH5yP1wo5fIDbd4wWk91V6mDus/2Ou1dK13P1xt/
lqGOhyZgVAoJubc1Ti3hwIRf8Pw9Wx6CjQ30prHAAtPc8bZSoDIqpyiaUhlkXI/c
kL0CMI5GfuTvS1JVT52Ztff/uRY5z52XXZi9pB0fEKwXvm82bbrJ623+40JOQBfr
xE4GCKPHmKQpKvrwQIwO/ozFO0TZrErHCs8y06Jj+ohZDcS8gxbnIZkPZd1Aw15v
VNvbckD7mUp/VXcyaFY15JGr70FlurTwD9Em7ZlsvIuvjytB3e8E+WhXCgXNF1Q5
Oe62gHuVQwVd7D1CBcci
=fRIf
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
