From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH V4 2/2] powerpc/85xx: Add PCIe controller support for
 bsc9132qds
Date: Thu, 19 Nov 2015 21:02:23 -0600
Message-ID: <1447988543.27264.176.camel@freescale.com>
References: <1446693360-1578-1-git-send-email-Zhiqiang.Hou@freescale.com>
	 <1446693360-1578-2-git-send-email-Zhiqiang.Hou@freescale.com>
	 <CY1PR0301MB07806A3A31D76967125054C28B1D0@CY1PR0301MB0780.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CY1PR0301MB07806A3A31D76967125054C28B1D0-YrwGdl+PljnwWZenWrSUgZwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hou Zhiqiang-B48286 <B48286-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Zhiqiang Hou <Zhiqiang.Hou-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org" <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org" <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org" <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, "mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org" <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rai Harninder-B01044 <harninder.rai-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Lian Minghuan-B31939 <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Hu Mingkai-B21284 <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2015-11-16 at 20:31 -0600, Hou Zhiqiang-B48286 wrote:
> Hi,
>=20
> Any response, please comment.

They look OK.

-Scott

>=20
> > -----Original Message-----
> > From: Zhiqiang Hou [mailto:Zhiqiang.Hou-KZfg59tc24xl57MIdRCFDg@public.gmane.org]
> > Sent: 2015=E5=B9=B411=E6=9C=885=E6=97=A5 11:16
> > To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Wood Scott-B07421;
> > galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org; benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org; paulus@samba.o=
rg;
> > mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> > pawel.moll-5wv7dgnIgG8@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org; ijc+devicetree-KcIKpvwj1kXF2uMehF1BdA@public.gmane.org=
g.uk;
> > Rai Harninder-B01044
> > Cc: Lian Minghuan-B31939; Hu Mingkai-B21284; Hou Zhiqiang-B48286
> > Subject: [PATCH V4 2/2] powerpc/85xx: Add PCIe controller support f=
or
> > bsc9132qds
> >=20
> > From: Harninder Rai <harninder.rai-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> >=20
> > 1. Use machine_arch_initcall to hook mpc85xx_common_publish_devices=
 This
> > can ensure before pcibios_init() is called, pci controllers have be=
en
> > probed and added to the hose_list.
> > 2. Add a workaround for errata A-005434
> > For the BSC9132, PEX_PEXIWARn[TRGT] for all windows defaults to 0xF=
,
> > which is mapped to CCSRBAR. However, for other products, 0xF is map=
ped to
> > the local memory. Therefore, for the BSC9132, any default PCI Expre=
ss
> > access to the local memory (DDR) will now access the CCSRBAR. This =
patch
> > changes the mapping of targets of inbound windows PEX_PEXIWARn[TRGT=
] to
> > the Local address space =E2=80=93 0x0 (from 0xF).
> >=20
> > Signed-off-by: Harninder Rai <harninder.rai-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > Signed-off-by: Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > Signed-off-by: Hou Zhiqiang <B48286-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> > V4: V3:
> >  - Remove gerrit stuff.
> >=20
> >  arch/powerpc/platforms/85xx/bsc913x_qds.c |  8 +++++++-
> >  arch/powerpc/sysdev/fsl_pci.c             | 13 +++++++++++++
> >  2 files changed, 20 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/powerpc/platforms/85xx/bsc913x_qds.c
> > b/arch/powerpc/platforms/85xx/bsc913x_qds.c
> > index f0927e5..dcfafd6 100644
> > --- a/arch/powerpc/platforms/85xx/bsc913x_qds.c
> > +++ b/arch/powerpc/platforms/85xx/bsc913x_qds.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/pci.h>
> >  #include <asm/mpic.h>
> >  #include <sysdev/fsl_soc.h>
> > +#include <sysdev/fsl_pci.h>
> >  #include <asm/udbg.h>
> >=20
> >  #include "mpc85xx.h"
> > @@ -46,10 +47,12 @@ static void __init bsc913x_qds_setup_arch(void)
> >  	mpc85xx_smp_init();
> >  #endif
> >=20
> > +	fsl_pci_assign_primary();
> > +
> >  	pr_info("bsc913x board from Freescale Semiconductor\n");  }
> >=20
> > -machine_device_initcall(bsc9132_qds, mpc85xx_common_publish_device=
s);
> > +machine_arch_initcall(bsc9132_qds, mpc85xx_common_publish_devices)=
;
> >=20
> >  /*
> >   * Called very early, device-tree isn't unflattened @@ -67,6 +70,9=
 @@
> > define_machine(bsc9132_qds) {
> >  	.probe			=3D bsc9132_qds_probe,
> >  	.setup_arch		=3D bsc913x_qds_setup_arch,
> >  	.init_IRQ		=3D bsc913x_qds_pic_init,
> > +#ifdef CONFIG_PCI
> > +	.pcibios_fixup_bus	=3D fsl_pcibios_fixup_bus,
> > +#endif
> >  	.get_irq		=3D mpic_get_irq,
> >  	.restart		=3D fsl_rstcr_restart,
> >  	.calibrate_decr		=3D generic_calibrate_decr,
> > diff --git a/arch/powerpc/sysdev/fsl_pci.c
> > b/arch/powerpc/sysdev/fsl_pci.c index ebc1f412..b8607f6 100644
> > --- a/arch/powerpc/sysdev/fsl_pci.c
> > +++ b/arch/powerpc/sysdev/fsl_pci.c
> > @@ -193,6 +193,19 @@ static void setup_pci_atmu(struct pci_controll=
er
> > *hose)
> >  	const u64 *reg;
> >  	int len;
> >=20
> > +	if (of_device_is_compatible(hose->dn, "fsl,bsc9132-pcie")) {
> > +		/*
> > +		 * BSC9132 Rev1.0 has an issue where all the PEX inbound
> > +		 * windows have implemented the default target value as
> > 0xf
> > +		 * for CCSR space.In all Freescale legacy devices the
> > target
> > +		 * of 0xf is reserved for local memory space. 9132 Rev1.0
> > +		 * now has local mempry space mapped to target 0x0
> > instead of
> > +		 * 0xf. Hence adding a workaround to remove the target
> > 0xf
> > +		 * defined for memory space from Inbound window
> > attributes.
> > +		 */
> > +		piwar &=3D ~PIWAR_TGI_LOCAL;
> > +	}
> > +
> >  	if (early_find_capability(hose, 0, 0, PCI_CAP_ID_EXP)) {
> >  		if (in_be32(&pci->block_rev1) >=3D PCIE_IP_REV_2_2) {
> >  			win_idx =3D 2;
> > --
> > 2.1.0.27.g96db324
>=20
> Thanks,
> Zhiqiang
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
