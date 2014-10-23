From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [RFC 2/4] PCI: generic: Add support for ARM64 and MSI(x)
Date: Thu, 23 Oct 2014 10:13:09 +0100
Message-ID: <20141023091309.GF25302@e106497-lin.cambridge.arm.com>
References: <1411937610-22125-1-git-send-email-suravee.suthikulpanit@amd.com>
 <3256560.C0cZnIlnAv@wuerfel>
 <20141022155914.GB25939@e102568-lin.cambridge.arm.com>
 <2148776.X8NPqiYA6S@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <2148776.X8NPqiYA6S@wuerfel>
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Marc Zyngier <Marc.Zyngier@arm.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>, Catalin Marinas <Catalin.Marinas@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "tglx@linutronix.de" <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 22, 2014 at 09:52:19PM +0100, Arnd Bergmann wrote:
> On Wednesday 22 October 2014 16:59:14 Lorenzo Pieralisi wrote:
> > On Wed, Oct 01, 2014 at 10:38:45AM +0100, Arnd Bergmann wrote:
> >=20
> > [...]
> >=20
> > > The arm32 implementations of pci_domain_nr/pci_proc_domain can pr=
obably be
> > > removed if we change the arm32 pcibios_init_hw function to call t=
he new
> > > interfaces that set the domain number.
> >=20
> > I wished, but it is a bit more complicated than I thought unfortuna=
tely,
> > mostly because some drivers, eg cns3xxx set the domain numbers
> > statically in pci_sys_data and this sets a chain of dependency that=
 is
> > not easy to untangle. I think cns3xxx is the only legacy driver tha=
t "uses"
> > the domain number (in pci_sys_data) in a way that clashes with the
> > generic domain_nr implementation, I need to give it more thought.
>=20
> Just had a look at that driver, shouldn't be too hard to change, see =
below.

I like this!

One thing though ...

>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>=20
> diff --git a/arch/arm/mach-cns3xxx/pcie.c b/arch/arm/mach-cns3xxx/pci=
e.c
> index 45d6bd09e6ef..aa4b9d7c52fd 100644
> --- a/arch/arm/mach-cns3xxx/pcie.c
> +++ b/arch/arm/mach-cns3xxx/pcie.c
> @@ -30,18 +30,15 @@ struct cns3xxx_pcie {
>  	unsigned int irqs[2];
>  	struct resource res_io;
>  	struct resource res_mem;
> -	struct hw_pci hw_pci;
> -
> +	int port;
>  	bool linked;
>  };
> =20
> -static struct cns3xxx_pcie cns3xxx_pcie[]; /* forward decl. */
> -
>  static struct cns3xxx_pcie *sysdata_to_cnspci(void *sysdata)
>  {
>  	struct pci_sys_data *root =3D sysdata;
> =20
> -	return &cns3xxx_pcie[root->domain];
> +	return root->private_data;
>  }
> =20
>  static struct cns3xxx_pcie *pdev_to_cnspci(const struct pci_dev *dev=
)
> @@ -192,13 +189,7 @@ static struct cns3xxx_pcie cns3xxx_pcie[] =3D {
>  			.flags =3D IORESOURCE_MEM,
>  		},
>  		.irqs =3D { IRQ_CNS3XXX_PCIE0_RC, IRQ_CNS3XXX_PCIE0_DEVICE, },
> -		.hw_pci =3D {
> -			.domain =3D 0,
> -			.nr_controllers =3D 1,
> -			.ops =3D &cns3xxx_pcie_ops,
> -			.setup =3D cns3xxx_pci_setup,
> -			.map_irq =3D cns3xxx_pcie_map_irq,
> -		},
> +		.port =3D 0,
>  	},
>  	[1] =3D {
>  		.host_regs =3D (void __iomem *)CNS3XXX_PCIE1_HOST_BASE_VIRT,
> @@ -217,19 +208,13 @@ static struct cns3xxx_pcie cns3xxx_pcie[] =3D {
>  			.flags =3D IORESOURCE_MEM,
>  		},
>  		.irqs =3D { IRQ_CNS3XXX_PCIE1_RC, IRQ_CNS3XXX_PCIE1_DEVICE, },
> -		.hw_pci =3D {
> -			.domain =3D 1,
> -			.nr_controllers =3D 1,
> -			.ops =3D &cns3xxx_pcie_ops,
> -			.setup =3D cns3xxx_pci_setup,
> -			.map_irq =3D cns3xxx_pcie_map_irq,
> -		},
> +		.port =3D 1,
>  	},
>  };
> =20
>  static void __init cns3xxx_pcie_check_link(struct cns3xxx_pcie *cnsp=
ci)
>  {
> -	int port =3D cnspci->hw_pci.domain;
> +	int port =3D cnspci->port;
>  	u32 reg;
>  	unsigned long time;
> =20
> @@ -260,9 +245,10 @@ static void __init cns3xxx_pcie_check_link(struc=
t cns3xxx_pcie *cnspci)
> =20
>  static void __init cns3xxx_pcie_hw_init(struct cns3xxx_pcie *cnspci)
>  {
> -	int port =3D cnspci->hw_pci.domain;
> +	int port =3D cnspci->port;
>  	struct pci_sys_data sd =3D {
>  		.domain =3D port,
> +		.private_data =3D cnspci,
>  	};
>  	struct pci_bus bus =3D {
>  		.number =3D 0,
> @@ -323,6 +309,14 @@ static int cns3xxx_pcie_abort_handler(unsigned l=
ong addr, unsigned int fsr,
>  void __init cns3xxx_pcie_init_late(void)
>  {
>  	int i;
> +	void *private_data;
> +	struct hw_pci hw_pci =3D {
> +		.nr_controllers =3D 1,
> +		.ops =3D &cns3xxx_pcie_ops,
> +		.setup =3D cns3xxx_pci_setup,
> +		.map_irq =3D cns3xxx_pcie_map_irq,
> +		.private_data =3D &private_data,
> +	};
> =20
>  	pcibios_min_io =3D 0;
>  	pcibios_min_mem =3D 0;
> @@ -335,7 +329,9 @@ void __init cns3xxx_pcie_init_late(void)
>  		cns3xxx_pwr_soft_rst(0x1 << PM_SOFT_RST_REG_OFFST_PCIE(i));
>  		cns3xxx_pcie_check_link(&cns3xxx_pcie[i]);
>  		cns3xxx_pcie_hw_init(&cns3xxx_pcie[i]);
> -		pci_common_init(&cns3xxx_pcie[i].hw_pci);
> +		hw_pci->domain =3D i;
> +		private_data =3D &cns3xxx_pcie[i];

Is this dance with pointers absolutely necessary? Does gcc though dishe=
s at you
for doing hw_pci->private_data =3D &cns3xxx_pcie[i] directly?

Best regards,
Liviu

> +		pci_common_init(&hw_pci);
>  	}
> =20
>  	pci_assign_unassigned_resources();
>=20
>=20
>=20
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF

