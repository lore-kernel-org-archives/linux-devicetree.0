From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v7 3/3] arm64: Add architecture support for PCI
Date: Thu, 20 Mar 2014 09:46:54 +0000
Message-ID: <20140320094654.GZ6457@e106497-lin.cambridge.arm.com>
References: <1394811258-1500-1-git-send-email-Liviu.Dudau@arm.com>
 <20140319135619.GC6231@localhost>
 <20140319172140.GA16328@e106497-lin.cambridge.arm.com>
 <8312584.jdZZuHGAjg@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8312584.jdZZuHGAjg@wuerfel>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Catalin Marinas <Catalin.Marinas@arm.com>, linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 19, 2014 at 06:37:51PM +0000, Arnd Bergmann wrote:
> On Wednesday 19 March 2014 17:21:41 Liviu Dudau wrote:
> >=20
> > My ultimate point is that no matter how long we argue about the sha=
pe of the functions that
> > I've added into arch/arm64/kernel/pci.c I don't think we can get aw=
ay without having that
> > file, or at least not in the first phase if we want speedy integrat=
ion into mainline.
>=20
> Let me simplify the discussion here:
>=20
> NAK to adding yet another architecture specific implementation.

So what would be your approach for handling pci_address_to_pio() in a n=
on-arch specific way?

unsigned long __weak pci_address_to_pio(phys_addr_t address)
{
#ifdef ARCH_HAS_IOSPACE
	if (address > IO_SPACE_LIMIT)
		return (unsigned long)-1;

	return (unsigned long) address;
#else
	struct ioresource *res;

	list_for_each_entry(res, &io_list, list) {
		if (address >=3D res->start &&
			address < res->start + res->size) {
			return res->start - address;
		}
	}

	return (unsigned long)-1;
#endif
}


Either that, or you have more magic rabbits than me.

Best regards,
Liviu

>=20
> 	Arnd
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
