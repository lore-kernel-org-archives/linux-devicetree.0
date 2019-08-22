Return-Path: <SRS0=wUgT=WS=gmail.com=thierry.reding@kernel.org>
Date: Thu, 22 Aug 2019 11:12:48 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V6 7/8] usb: gadget: Add UDC driver for tegra XUSB device
 mode controller
Message-ID: <20190822091248.GD23873@ulmo>
References: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
 <1565257046-9890-8-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k4f25fnPtRuIRUb3"
Content-Disposition: inline
In-Reply-To: <1565257046-9890-8-git-send-email-nkristam@nvidia.com>
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--k4f25fnPtRuIRUb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 03:07:25PM +0530, Nagarjuna Kristam wrote:
> This patch adds UDC driver for tegra XUSB 3.0 device mode controller.
> XUSB device mode controller supports SS, HS and FS modes
>=20
> Based on work by:
>   Mark Kuo <mkuo@nvidia.com>
>   Hui Fu <hfu@nvidia.com>
>   Andrew Bresticker <abrestic@chromium.org>
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/usb/gadget/udc/Kconfig      |   11 +
>  drivers/usb/gadget/udc/Makefile     |    1 +
>  drivers/usb/gadget/udc/tegra_xudc.c | 3808 +++++++++++++++++++++++++++++=
++++++
>  3 files changed, 3820 insertions(+)
>  create mode 100644 drivers/usb/gadget/udc/tegra_xudc.c
>=20
> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kcon=
fig
> index ef0259a..fe6028e 100644
> --- a/drivers/usb/gadget/udc/Kconfig
> +++ b/drivers/usb/gadget/udc/Kconfig
> @@ -440,6 +440,17 @@ config USB_GADGET_XILINX
>  	  dynamically linked module called "udc-xilinx" and force all
>  	  gadget drivers to also be dynamically linked.
> =20
> +config USB_TEGRA_XUDC
> +	tristate "NVIDIA Tegra Superspeed USB 3.0 Device Controller"
> +	depends on ARCH_TEGRA
> +	select USB_ROLE_SWITCH
> +	help
> +	 Enables NVIDIA Tegra USB 3.0 device mode controller driver.
> +
> +	 Say "y" to link the driver statically, or "m" to build a
> +	 dynamically linked module called "tegra_xudc" and force all
> +	 gadget drivers to also be dynamically linked.
> +
>  source "drivers/usb/gadget/udc/aspeed-vhub/Kconfig"
> =20
>  #
> diff --git a/drivers/usb/gadget/udc/Makefile b/drivers/usb/gadget/udc/Mak=
efile
> index 897f648..1c55c96 100644
> --- a/drivers/usb/gadget/udc/Makefile
> +++ b/drivers/usb/gadget/udc/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_USB_BCM63XX_UDC)	+=3D bcm63xx_udc.o
>  obj-$(CONFIG_USB_FSL_USB2)	+=3D fsl_usb2_udc.o
>  fsl_usb2_udc-y			:=3D fsl_udc_core.o
>  fsl_usb2_udc-$(CONFIG_ARCH_MXC)	+=3D fsl_mxc_udc.o
> +obj-$(CONFIG_USB_TEGRA_XUDC)	+=3D tegra_xudc.o

Nit: I have a slight preference for tegra-xudc.o over tegra_xudc.o. We
use dashes rather than underscores pretty consistently on Tegra, so it
would be good to keep the same pattern here, unless somebody feels
strongly about the underscore.

It doesn't matter that much because module utilities treat them the same
way I think, so the Acked-by remains valid either way.

Thierry

--k4f25fnPtRuIRUb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1eXJAACgkQ3SOs138+
s6Fo0A/+PcXssvrJYWWYKpxgFdlOkAIIxEyJ/AS4fYY2prFqg02XnHeXAB5qviis
7sifgfXRt7WIrD+7k4FlNZuIMG8+MlzyyJoL7OHACrNnsszL+8d38ex+IF3+jqie
DbR4HafAU+yGeRzGApZV1eADlFYws6VpKHLHYq5cCpei6OEajBYl+fjJNKixbg44
qdC/Sekg1gZs4cpezwZmmD6Z6bK+l0qIkmWWFpf1N+l7Sqj3lJXZnnxjEEpfkAVB
awHvYSzBlcnl2aGLNQbFHxh5IuU8gpFmeK5TAmywpcVZ1ZgYlIC6RzXs0E/avCCJ
RrvKNkx2BI3eowo4cWVDQEOsZu5BH3HA62P2VEahJDzOB2D92nJ5lcIPQO+e/dge
PmMUbnMRAR0K/OaPzwgiaUeswH68ZcM5HHzGF01etp4chGgcvScFTXgPpbwgO/si
+w6yDW517EiQ/cWleUssClqC+RRkEeSgOQxVHMMYLCFoO472N1RUrKxFgIzgxnHW
MJ7miFhoBO3VAz5puIxfdpVNEKxVD0GUQ3d0b4TIwTUReCIFsSWYkTxw80CmgQc6
2lbtcgkCGLWvXfmkcI4sHrAHLNnaHx4aFrH8QWtfqktvZuYAoxS0n46LVLto5NiV
wSUsu0tRK8hrfy5FpWU0vWyPhXbKr5lqXqTlEtcOpBuR/RTvPLc=
=xJFJ
-----END PGP SIGNATURE-----

--k4f25fnPtRuIRUb3--
