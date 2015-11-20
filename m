From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/4] usb: dwc3: qcom: Configure TCSR phy mux register
Date: Fri, 20 Nov 2015 09:06:33 -0600
Message-ID: <87a8q8emme.fsf@saruman.tx.rr.com>
References: <1448008509-8913-1-git-send-email-agross@codeaurora.org> <1448008509-8913-3-git-send-email-agross@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg=pgp-sha1;
	protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448008509-8913-3-git-send-email-agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> writes:
> This patch adds automatic configuration of the TCSR phy mux register base=
d on
> the syscon-tcsr devicetree entry.  This configuration is optional, as some
> platforms may not require the mux selection.
>
> Signed-off-by: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

just when I find a way to make a generic dwc3-of-simple.c glue layer :-p

I can, certainly drop my patches but I need more details on the syscon
usage below.

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 0880260..fcf264c 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -17,6 +17,8 @@
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
>=20=20
>  struct dwc3_qcom {
>  	struct device		*dev;
> @@ -30,6 +32,9 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  {
>  	struct device_node *node =3D pdev->dev.of_node;
>  	struct dwc3_qcom *qdwc;
> +	struct regmap *regmap;
> +	u32 mux_offset;
> +	u32 mux_bit;
>  	int ret;
>=20=20
>  	qdwc =3D devm_kzalloc(&pdev->dev, sizeof(*qdwc), GFP_KERNEL);
> @@ -58,6 +63,26 @@ static int dwc3_qcom_probe(struct platform_device *pde=
v)
>  		qdwc->sleep_clk =3D NULL;
>  	}
>=20=20
> +	/* look for tcsr and if present, provision it */
> +	regmap =3D syscon_regmap_lookup_by_phandle(node, "syscon-tcsr");
> +	if (!IS_ERR(regmap)) {
> +		if (of_property_read_u32_index(node, "syscon-tcsr", 1,
> +					       &mux_offset)) {
> +			dev_err(qdwc->dev, "missing USB TCSR mux offset\n");
> +			return -EINVAL;
> +		}
> +		if (of_property_read_u32_index(node, "syscon-tcsr", 2,
> +					       &mux_bit)) {
> +			dev_err(qdwc->dev, "missing USB TCSR mux bit\n");
> +			return -EINVAL;
> +		}
> +
> +		regmap_update_bits(regmap, mux_offset, BIT(mux_bit),
> +				   BIT(mux_bit));

what is tcsr and what does it ? It also seems to be optional, why's that ?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWTzb6AAoJEIaOsuA1yqREPLgQAJ9JHHRhe163MPksLPCA6oxk
jbIG3Cpf08bTkpODDPO0yKNOdXa8QQp8Rca9EZS4iR3g2whsHweBgbE1uSqnSKqo
szeZ6fDvUAv6UDKYxX80AdtOS1OwqkqCTTkheJHp3uu8z9wFqrv0tmpfyEYFtN35
APDXkC31BPLpqTZSVDgszujwtJxOYreRQYsE4pec2wzVQDvU01J7z0oNbm9w9rGl
KibJBC4MUl73DO1H5No1jFm8n25/ZPbWzz4jULhjSk11NnLGaLeI1TufSeo/bieC
SjOXIwDFMwwpUgIO6rAsJ54crhUdyOinaMnBwbuezO8MAmfLgX3uEO/Nvvbz4E6H
l6B941HEAgOni8v0YmcW8e5PD+sdWvhwXbz+Bx9O38XsFkq7C+al2SkydbLBB0OP
ulC/juJHFE0plgVmrWGfSD5Ayw/Drv0MPNFUCOxtG4KJ9DiVTE6GJzHZU18fZGi0
Pa+LJiWdqDUOsy7N5MluckiU4voxX3gDGIz4HhkncKOTHOJF+qaPRWLC/wXlfXRf
2JrTVFPRt+BJS/EuYqF+CHyXwEkdiWUHmkItYqedmRyNOBWyGiSL4w5LR6hOZquq
EsLYyvHTLZgpMcZIv31nrlXiQLc+6dQKl5nL2p81pWuXtNIyQfAXvs0cPUBYlHn1
h4ky/rRZA0c8UV1Ys6AR
=fwlA
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
