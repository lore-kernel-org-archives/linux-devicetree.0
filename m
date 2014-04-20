From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 1/8] usb: host: xhci-plat: Allow to register glue code
 using the device tree
Date: Sat, 19 Apr 2014 22:15:17 -0500
Message-ID: <20140420031517.GA26893@saruman.home>
References: <1397816563-9000-1-git-send-email-gregory.clement@free-electrons.com>
 <1397816563-9000-2-git-send-email-gregory.clement@free-electrons.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1100739722772385073=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1397816563-9000-2-git-send-email-gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Grant Likely <grant.likely@linaro.org>, Tawfik Bayouk <tawfik@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

--===============1100739722772385073==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 18, 2014 at 12:22:36PM +0200, Gregory CLEMENT wrote:
> This patch allow to register specific glue code for xhci controller.
> It creates a structure called xhci_plat_ops to register functions
> specific to an SoC. Currently there are only probe() and remove() but

What SoC-specific code do you need ?

> it can be extended later, it was the point to create such a structure.
>=20
> Each compatible string can then be associated to an instance of this
> structure. In the non device tree case a default structure is used.
>=20
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---
>  drivers/usb/host/xhci-plat.c | 72 ++++++++++++++++++++++++++++++++++++++=
+++---
>  drivers/usb/host/xhci.h      |  4 +++
>  2 files changed, 72 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 151901ce1ba9..8029cc82edc4 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -16,6 +16,7 @@
>  #include <linux/slab.h>
>  #include <linux/of.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/of_device.h>
> =20
>  #include "xhci.h"
> =20
> @@ -85,7 +86,7 @@ static const struct hc_driver xhci_plat_xhci_driver =3D=
 {
>  	.bus_resume =3D		xhci_bus_resume,
>  };
> =20
> -static int xhci_plat_probe(struct platform_device *pdev)
> +int common_xhci_plat_probe(struct platform_device *pdev, void *priv)

no, I rather not see this sort of hack.

--=20
balbi

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTUzvFAAoJEIaOsuA1yqREEoMP/ihPOo8wrZ6Pt2iEGqC6/48A
kcBk/BkqmzfCBtj2MMOvrvA9qF7VC2dzVlo3QTKiiullp2ogzA2tWxRtjA1ky1Mx
vqbsr2fs84OjuTMxtOYwUWBcUHXIb2B6lSMomVYvcOrm4AkQ//R5ikYprkdw/dSq
OBI0wgnsCyALm1sM5ngjraSVyQZakUhBJ3SyUaCiVQgZ2bf75d5JoKzQO+5l9hUI
Q8UG5pfoNlUebbw//aX8hc0Ewi+QYPWzJP3hGeaduHquV9RQuKRCs3gaPo4okPAB
EzcG8htpryDZCkye0umznICzGfzkdLNE+0ANiuOPihVEbZITC+nCSVlJN1mBVf59
fGAPrI+jowyRKmJ20KVeCOmNqFenCEnv+nGyKmb6sBgY58kjAsOZ4Eq3N96YBxuF
YTQUAVEQ3odJ6Eq30qmIAczaFw6OcFB9DRHiDpm7uBfKrI+P6EcgZ3K8U8NlrccE
RqG/eKFfiYj3dRlz/KJrr1xADqrDIBd+XRjdTjILTSfaDIar8um65OCpBqPAjTOK
WbWBUtvICLRM3uqv4hg4CqkN9VdkZdpHhqPePjApWO6aO8zep7RGAEbMlzMFEdcJ
UcGi/PVm8rEVhBhTkO9A6dths5l6jfXjymZFOjbpl3KGKFD8nx+BcQzUB3ruQXmS
nvFByDnNFgDEuGY89T48
=qD3P
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--


--===============1100739722772385073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1100739722772385073==--
