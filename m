From: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Subject: RE: [PATCH v2 4/8] PCI: Add quirk to disable MSI-X support for
 Amazon's Annapurna Labs Root Port
Date: Fri, 19 Jul 2019 09:17:21 +0000
Message-ID: <DM6PR12MB401060B62453CA171166FE64DACB0@DM6PR12MB4010.namprd12.prod.outlook.com>
References: <20190718094531.21423-1-jonnyc@amazon.com>
 <20190718094531.21423-5-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718094531.21423-5-jonnyc@amazon.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Chocron <jonnyc@amazon.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "gustavo.pimentel@synopsys.com" <Gustavo.Pimentel@synopsys.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "dwmw@amazon.co.uk" <dwmw@amazon.co.uk>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "alisaidi@amazon.com" <alisaidi@amazon.com>, "ronenk@amazon.com" <ronenk@amazon.com>, "barakw@amazon.com" <barakw@amazon.com>, "talel@amazon.com" <talel@amazon.com>, "hanochu@amazon.com" <hanochu@amazon.com>, "hhhawa@amazon.com" <hhhawa@amazon.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 18, 2019 at 10:45:27, Jonathan Chocron <jonnyc@amazon.com>=20
wrote:

> The Root Port (identified by [1c36:0032]) doesn't support MSI-X. On some
> platforms it is configured to not advertise the capability at all, while
> on others it (mistakenly) does. This causes a panic during
> initialization by the pcieport driver, since it tries to configure the
> MSI-X capability. Specifically, when trying to access the MSI-X table
> a "non-existing addr" exception occurs.
>=20
> Example stacktrace snippet:
>=20
> [    1.632363] SError Interrupt on CPU2, code 0xbf000000 -- SError
> [    1.632364] CPU: 2 PID: 1 Comm: swapper/0 Not tainted 5.2.0-rc1-Jonny-=
14847-ge76f1d4a1828-dirty #33
> [    1.632365] Hardware name: Annapurna Labs Alpine V3 EVP (DT)
> [    1.632365] pstate: 80000005 (Nzcv daif -PAN -UAO)
> [    1.632366] pc : __pci_enable_msix_range+0x4e4/0x608
> [    1.632367] lr : __pci_enable_msix_range+0x498/0x608
> [    1.632367] sp : ffffff80117db700
> [    1.632368] x29: ffffff80117db700 x28: 0000000000000001
> [    1.632370] x27: 0000000000000001 x26: 0000000000000000
> [    1.632372] x25: ffffffd3e9d8c0b0 x24: 0000000000000000
> [    1.632373] x23: 0000000000000000 x22: 0000000000000000
> [    1.632375] x21: 0000000000000001 x20: 0000000000000000
> [    1.632376] x19: ffffffd3e9d8c000 x18: ffffffffffffffff
> [    1.632378] x17: 0000000000000000 x16: 0000000000000000
> [    1.632379] x15: ffffff80116496c8 x14: ffffffd3e9844503
> [    1.632380] x13: ffffffd3e9844502 x12: 0000000000000038
> [    1.632382] x11: ffffffffffffff00 x10: 0000000000000040
> [    1.632384] x9 : ffffff801165e270 x8 : ffffff801165e268
> [    1.632385] x7 : 0000000000000002 x6 : 00000000000000b2
> [    1.632387] x5 : ffffffd3e9d8c2c0 x4 : 0000000000000000
> [    1.632388] x3 : 0000000000000000 x2 : 0000000000000000
> [    1.632390] x1 : 0000000000000000 x0 : ffffffd3e9844680
> [    1.632392] Kernel panic - not syncing: Asynchronous SError Interrupt
> [    1.632393] CPU: 2 PID: 1 Comm: swapper/0 Not tainted 5.2.0-rc1-Jonny-=
14847-ge76f1d4a1828-dirty #33
> [    1.632394] Hardware name: Annapurna Labs Alpine V3 EVP (DT)
> [    1.632394] Call trace:
> [    1.632395]  dump_backtrace+0x0/0x140
> [    1.632395]  show_stack+0x14/0x20
> [    1.632396]  dump_stack+0xa8/0xcc
> [    1.632396]  panic+0x140/0x334
> [    1.632397]  nmi_panic+0x6c/0x70
> [    1.632398]  arm64_serror_panic+0x74/0x88
> [    1.632398]  __pte_error+0x0/0x28
> [    1.632399]  el1_error+0x84/0xf8
> [    1.632400]  __pci_enable_msix_range+0x4e4/0x608
> [    1.632400]  pci_alloc_irq_vectors_affinity+0xdc/0x150
> [    1.632401]  pcie_port_device_register+0x2b8/0x4e0
> [    1.632402]  pcie_portdrv_probe+0x34/0xf0
>=20
> Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
> ---
>  drivers/pci/quirks.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 23672680dba7..11f843aa96b3 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -2925,6 +2925,21 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATTANSIC, 0x=
10a1,
>  			quirk_msi_intx_disable_qca_bug);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATTANSIC, 0xe091,
>  			quirk_msi_intx_disable_qca_bug);
> +
> +/*
> + * Amazon's Annapurna Labs 1c36:0031 Root Ports don't support MSI-X, so =
it
> + * should be disabled on platforms where the device (mistakenly) adverti=
ses it.
> + *
> + * The 0031 device id is reused for other non Root Port device types,
> + * therefore the quirk is registered for the PCI_CLASS_BRIDGE_PCI class.
> + */
> +static void quirk_al_msi_disable(struct pci_dev *dev)
> +{
> +	dev->no_msi =3D 1;
> +	pci_warn(dev, "Disabling MSI-X\n");
> +}
> +DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_AMAZON_ANNAPURNA_LABS, 0x003=
1,
> +			      PCI_CLASS_BRIDGE_PCI, 8, quirk_al_msi_disable);
>  #endif /* CONFIG_PCI_MSI */
> =20
>  /*
> --=20
> 2.17.1


Reviewed-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
