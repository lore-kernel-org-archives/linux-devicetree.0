From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] of/pci: add pci_pio_to_address dummy for !CONFIG_OF
Date: Wed, 1 Oct 2014 09:54:36 +0100
Message-ID: <20141001085436.GA841@e106497-lin.cambridge.arm.com>
References: <706416181.hbVGLDA3o6@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <706416181.hbVGLDA3o6@wuerfel>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Rob Herring <robh@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 30, 2014 at 02:19:05PM +0100, Arnd Bergmann wrote:
> The pci_register_io_range() and pci_pio_to_address() were recently
> introduced to generalize the handling of memory mapped PCI I/O space,
> but they are only valid when CONFIG_OF is set, leading to a possible
> build error:
>=20
> drivers/pci/host/pcie-rcar.c: In function 'rcar_pcie_setup_window':
> drivers/pci/host/pcie-rcar.c:340:3: error: implicit declaration of fu=
nction 'pci_pio_to_address' [-Werror=3Dimplicit-function-declaration]
>    res_start =3D pci_pio_to_address(res->start);
>    ^
> drivers/pci/host/pcie-rcar.c: In function 'rcar_pcie_probe':
> drivers/pci/host/pcie-rcar.c:945:3: error: implicit declaration of fu=
nction 'of_pci_range_to_resource' [-Werror=3Dimplicit-function-declarat=
ion]
>    err =3D of_pci_range_to_resource(&range, pdev->dev.of_node,
>    ^
> cc1: some warnings being treated as errors
>=20
> This provides inline dummy implementations for the case that
> CONFIG_OF is disabled, to allow better build testing.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 279c5dd046 ("of/pci: Add pci_register_io_range() and pci_pio_t=
o_address()")
>=20
> diff --git a/include/linux/of_address.h b/include/linux/of_address.h
> index 7ebb877b07c2..851097aab115 100644
> --- a/include/linux/of_address.h
> +++ b/include/linux/of_address.h
> @@ -71,6 +71,11 @@ static inline const __be32 *of_get_address(struct =
device_node *dev, int index,
>  	return NULL;
>  }
> =20
> +static inline phys_addr_t pci_pio_to_address(unsigned long pio)
> +{
> +	return 0;
> +}
> +
>  static inline int of_pci_range_parser_init(struct of_pci_range_parse=
r *parser,
>  			struct device_node *node)
>  {
> @@ -144,6 +149,12 @@ static inline const __be32 *of_get_pci_address(s=
truct device_node *dev,
>  {
>  	return NULL;
>  }
> +static inline int of_pci_range_to_resource(struct of_pci_range *rang=
e,
> +					   struct device_node *np,
> +					   struct resource *res)
> +{
> +	return -ENOSYS;
> +}
>  #endif /* CONFIG_OF_ADDRESS && CONFIG_PCI */
> =20
>  #endif /* __OF_ADDRESS_H */
>=20

Arnd,

I have a more general question that is related only vaguely to this pat=
ch but it was prompted by it:
given that this pcie-rcar.c driver is so dependent on the OF functional=
ity, why the fix(es) (in
general) tend to prefer creating these dummy functions for !CONFIG_OF r=
ather than making
CONFIG_PCI_RCAR_GEN2_PCIE dependent on CONFIG_OF? We are basically comp=
iling a driver that we can
guarantee it will fail when used without OF support and contribute to t=
he overall size of the kernel.
Given the presentation you have done at Linaro Connect last month on th=
is topic, I started to wonder
if there is a deeper API style agreement that is not apparent to me?

Thanks for your time,
Liviu

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
