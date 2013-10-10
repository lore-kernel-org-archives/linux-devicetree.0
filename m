From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 2/5] usb: gadget: s3c-hsotg: support configurable UTMI
 PHY width
Date: Thu, 10 Oct 2013 10:29:22 -0500
Message-ID: <20131010152922.GF28375@radagast>
References: <1381140752-312-1-git-send-email-matt.porter@linaro.org>
 <1381140752-312-3-git-send-email-matt.porter@linaro.org>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5639761850916314332=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1381140752-312-3-git-send-email-matt.porter@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matt Porter <matt.porter@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Daudt <bcm@fixthebug.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Felipe Balbi <balbi@ti.com>, Linaro Patches <patches@linaro.org>, Paul Zimmerman <paulz@synopsys.com>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============5639761850916314332==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TU+u6i6jrDPzmlWF"
Content-Disposition: inline

--TU+u6i6jrDPzmlWF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2013 at 06:12:29AM -0400, Matt Porter wrote:
> Extend dwc2 binding with an optional utmi phy width property.
> Enable the s3c-hsotg.c driver to use standard dwc2 binding
> and enable configuration of the UTMI phy width based on the
> property.
>=20
> Signed-off-by: Matt Porter <matt.porter@linaro.org>
> Reviewed-by: Markus Mayer <markus.mayer@linaro.org>
> Reviewed-by: Tim Kryger <tim.kryger@linaro.org>
> ---
>  Documentation/devicetree/bindings/staging/dwc2.txt |  4 ++++
>  drivers/usb/gadget/s3c-hsotg.c                     | 18 ++++++++++++++++=
+-
>  drivers/usb/gadget/s3c-hsotg.h                     |  1 +
>  3 files changed, 22 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/staging/dwc2.txt b/Documen=
tation/devicetree/bindings/staging/dwc2.txt
> index 1a1b7cf..fb6b8ee 100644
> --- a/Documentation/devicetree/bindings/staging/dwc2.txt
> +++ b/Documentation/devicetree/bindings/staging/dwc2.txt
> @@ -6,10 +6,14 @@ Required properties:
>  - reg : Should contain 1 register range (address and length)
>  - interrupts : Should contain 1 interrupt
> =20
> +Optional properties:
> +- snps,phy-utmi-width: Must contain the UTMI data width (either 8 or 16)

isn't this available in any of the configuration registers ?

>  Example:
> =20
>          usb@101c0000 {
>                  compatible =3D "ralink,rt3050-usb, snps,dwc2";
>                  reg =3D <0x101c0000 40000>;
>                  interrupts =3D <18>;
> +		snps,phy-utmi-width =3D <8>;

indentation.

--=20
balbi

--TU+u6i6jrDPzmlWF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJSVsfSAAoJEIaOsuA1yqRELPIP/Ajde/LDQlr3ObNPEJ3yIC6L
3ZtjPtRK5d1lmIxRhTCm6y2s7ejFnRpze+wUkoVtNtsoC64CX1U3DZKUHO1jnppD
Tr26t1M3/Ya2vfK/be3+Oo4NV8fk2LAnJupWNTdSRkdpU0qB4GPqnviI+BUGLZG0
epl7C3dJKpAAvi8WETeBSRjji0foQ5OChu4xFeOOHwWkcxQyj3nnuNYCobIFYghV
vx18+1lsr9q1fuI7VB2kLP2EAPUEZ5LISXlI4kKVBuD5D6WpVuTaK5JyGoSWiiJt
83+IBUjxSMevjLLPZyDRc1BNu4gEW5GnS4+L3PkpRkMtJvCP8lZa/YBug8ZQdMo7
/lBSZi+g1RyYBsxcKAi979AsmYQZEb7AzQyufqeza37nbxvwtOEuidBgoLBWmc23
YyZQHCCkMjx8hhdbCiF9zU9J3LO7SoP3KPReUDQf//jZZkd889tb5JGSVBYpyv2/
aq7gxILRDpJxyEai0EkRU2/ZN3LV7y7kUUgdNHA6LxNrglOvIkaPCWgiRy/Znoic
fRLzpS3Y5qJatCF8F52a5l8jwKCVUVw/GElY8fqbgSEuxYveGc3HqZWoX/BJrHWq
6TWDqXijKt9dDbI5TIS31f0ZiBqChhceFBHcxSEakXM7NktBffjbaIWshaQUVn/t
CF8otXjmJ4IkSHwwMGC4
=kyS7
-----END PGP SIGNATURE-----

--TU+u6i6jrDPzmlWF--


--===============5639761850916314332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5639761850916314332==--
