From: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Subject: RE: [PATCH v2 2/8] PCI: Add ACS quirk for Amazon Annapurna Labs root
 ports
Date: Fri, 19 Jul 2019 08:25:52 +0000
Message-ID: <DM6PR12MB40103BEB4F4050FBBDCD7C95DACB0@DM6PR12MB4010.namprd12.prod.outlook.com>
References: <20190718094531.21423-1-jonnyc@amazon.com>
 <20190718094531.21423-3-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718094531.21423-3-jonnyc@amazon.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Chocron <jonnyc@amazon.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "gustavo.pimentel@synopsys.com" <Gustavo.Pimentel@synopsys.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "dwmw@amazon.co.uk" <dwmw@amazon.co.uk>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "alisaidi@amazon.com" <alisaidi@amazon.com>, "ronenk@amazon.com" <ronenk@amazon.com>, "barakw@amazon.com" <barakw@amazon.com>, "talel@amazon.com" <talel@amazon.com>, "hanochu@amazon.com" <hanochu@amazon.com>, "hhhawa@amazon.com" <hhhawa@amazon.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 18, 2019 at 10:45:25, Jonathan Chocron <jonnyc@amazon.com>=20
wrote:

> From: Ali Saidi <alisaidi@amazon.com>
>=20
> The Amazon's Annapurna Labs root ports don't advertise an ACS
> capability, but they don't allow peer-to-peer transactions and do
> validate bus numbers through the SMMU. Additionally, it's not possible
> for one RP to pass traffic to another RP.
>=20
> Signed-off-by: Ali Saidi <alisaidi@amazon.com>
> Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
> ---
>  drivers/pci/quirks.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 208aacf39329..23672680dba7 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -4366,6 +4366,23 @@ static int pci_quirk_qcom_rp_acs(struct pci_dev *d=
ev, u16 acs_flags)
>  	return ret;
>  }
> =20
> +static int pci_quirk_al_acs(struct pci_dev *dev, u16 acs_flags)
> +{
> +	/*
> +	 * Amazon's Annapurna Labs root ports don't include an ACS capability,
> +	 * but do include ACS-like functionality. The hardware doesn't support
> +	 * peer-to-peer transactions via the root port and each has a unique
> +	 * segment number.
> +	 * Additionally, the root ports cannot send traffic to each other.
> +	 */
> +	acs_flags &=3D ~(PCI_ACS_RR | PCI_ACS_CR | PCI_ACS_SV | PCI_ACS_UF);
> +
> +	if (pci_pcie_type(dev) !=3D PCI_EXP_TYPE_ROOT_PORT)
> +		return -ENOTTY;
> +
> +	return acs_flags ? 0 : 1;
> +}
> +
>  /*
>   * Sunrise Point PCH root ports implement ACS, but unfortunately as show=
n in
>   * the datasheet (Intel 100 Series Chipset Family PCH Datasheet, Vol. 2,
> @@ -4559,6 +4576,8 @@ static const struct pci_dev_acs_enabled {
>  	{ PCI_VENDOR_ID_AMPERE, 0xE00A, pci_quirk_xgene_acs },
>  	{ PCI_VENDOR_ID_AMPERE, 0xE00B, pci_quirk_xgene_acs },
>  	{ PCI_VENDOR_ID_AMPERE, 0xE00C, pci_quirk_xgene_acs },
> +	/* Amazon Annapurna Labs */
> +	{ PCI_VENDOR_ID_AMAZON_ANNAPURNA_LABS, 0x0031, pci_quirk_al_acs },
>  	{ 0 }
>  };
> =20
> --=20
> 2.17.1

Seems ok.

Reviewed-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
