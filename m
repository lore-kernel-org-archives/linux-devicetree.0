From: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Subject: RE: [PATCH v2 3/8] PCI/VPD: Add VPD release quirk for Amazon's
 Annapurna Labs Root Port
Date: Fri, 19 Jul 2019 08:24:30 +0000
Message-ID: <DM6PR12MB4010BDFACD5974E310435D8BDACB0@DM6PR12MB4010.namprd12.prod.outlook.com>
References: <20190718094531.21423-1-jonnyc@amazon.com>
 <20190718094531.21423-4-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718094531.21423-4-jonnyc@amazon.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Chocron <jonnyc@amazon.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "gustavo.pimentel@synopsys.com" <Gustavo.Pimentel@synopsys.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "dwmw@amazon.co.uk" <dwmw@amazon.co.uk>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "alisaidi@amazon.com" <alisaidi@amazon.com>, "ronenk@amazon.com" <ronenk@amazon.com>, "barakw@amazon.com" <barakw@amazon.com>, "talel@amazon.com" <talel@amazon.com>, "hanochu@amazon.com" <hanochu@amazon.com>, "hhhawa@amazon.com" <hhhawa@amazon.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 18, 2019 at 10:45:26, Jonathan Chocron <jonnyc@amazon.com>=20
wrote:

> The Amazon Annapurna Labs PCIe Root Port exposes the VPD capability,
> but there is no actual support for it.
>=20
> The reason for not using the already existing quirk_blacklist_vpd()
> is that, although this fails pci_vpd_read/write, the 'vpd' sysfs
> entry still exists. When running lspci -vv, for example, this
> results in the following error:
>=20
> pcilib: sysfs_read_vpd: read failed: Input/output error
>=20
> This quirk removes the sysfs entry, which avoids the error print.
>=20
> Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
> ---
>  drivers/pci/vpd.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/pci/vpd.c b/drivers/pci/vpd.c
> index 4963c2e2bd4c..c23a8ec08db9 100644
> --- a/drivers/pci/vpd.c
> +++ b/drivers/pci/vpd.c
> @@ -644,4 +644,20 @@ static void quirk_chelsio_extend_vpd(struct pci_dev =
*dev)
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_CHELSIO, PCI_ANY_ID,
>  			quirk_chelsio_extend_vpd);
> =20
> +static void quirk_al_vpd_release(struct pci_dev *dev)
> +{
> +	if (dev->vpd) {
> +		pci_vpd_release(dev);
> +		dev->vpd =3D NULL;
> +		pci_warn(dev, FW_BUG "Releasing VPD capability (No support for VPD rea=
d/write transactions)\n");
> +	}
> +}
> +
> +/*
> + * The 0031 device id is reused for other non Root Port device types,
> + * therefore the quirk is registered for the PCI_CLASS_BRIDGE_PCI class.
> + */
> +DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_AMAZON_ANNAPURNA_LABS, 0x003=
1,
> +			      PCI_CLASS_BRIDGE_PCI, 8, quirk_al_vpd_release);
> +
>  #endif
> --=20
> 2.17.1

Seems ok.

Reviewed-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
