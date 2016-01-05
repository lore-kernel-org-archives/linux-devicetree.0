From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 3/3] ARM64 LPC: update binding doc
Date: Tue, 05 Jan 2016 13:19:48 +0100
Message-ID: <2550495.K9prJVsVEi@wuerfel>
References: <1451396032-23708-1-git-send-email-zourongrong@gmail.com> <6384244.Uhpjfgly6O@wuerfel> <568BB035.1050801@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <568BB035.1050801@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rongrong Zou <zourongrong@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, Rongrong Zou <zourongrong@gmail.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Corey Minyard <minyard@acm.org>, gregkh@linuxfoundation.org, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, linuxarm@huawei.com, benh@kernel.crashing.org, liviu.dudau@arm.com
List-Id: devicetree@vger.kernel.org

On Tuesday 05 January 2016 19:59:49 Rongrong Zou wrote:
> =E5=9C=A8 2016/1/5 0:34, Arnd Bergmann =E5=86=99=E9=81=93:
> > On Tuesday 05 January 2016 00:04:19 Rongrong Zou wrote:
> >> =E5=9C=A8 2016/1/4 19:13, Arnd Bergmann =E5=86=99=E9=81=93:
> >>> On Sunday 03 January 2016 20:24:14 Rongrong Zou wrote:
> >>>> =E5=9C=A8 2015/12/31 23:00, Rongrong Zou =E5=86=99=E9=81=93:
> >> Ranges property can set empty, but this means 1:1 translation. the=
 I/O
> >> port range is translated to MMIO address 0x00000001 00000000 to
> >> 0x00000001 00000004, it looks wrong else. I wonder if anyone get l=
egacy
> >> I/O port resource from dts.
> >
> > As I said, nothing should really require the ranges property here, =
unless
> > you have a valid IORESOURCE_MEM translation. The code that requires
> > the ranges to be present is wrong.
> >
>=20
> I think the openfirmware(DT) do not support for those unmapped I/O po=
rts, because I
> must get resource by calling of_address_to_resource(), which have to =
call
> pci_address_to_pio() when resource type is IORESOURCE_IO. I'm sorry I=
 have no
> better idea for this now. Maybe liviu can give me some opinions.

I think on x86 it works (or used to work, few people use open firmware =
on
x86 these days, and it may be broken), and the pci_address_to_pio() cal=
l
behaves differently when PCI_IOBASE is set. x86 never maps I/O ports in=
to
memory mapped I/O addresses, they have their own way of accessing them
just like your platform.

> /**
>   * of_address_to_resource - Translate device tree address and return=
 as resource
>   *
>   * Note that if your address is a PIO address, the conversion will f=
ail if
>   * the physical address can't be internally converted to an IO token=
 with
>   * pci_address_to_pio(), that is because it's either called to early=
 or it
>   * can't be matched to any host bridge IO space
>   */
> int of_address_to_resource(struct device_node *dev, int index,
> 			   struct resource *r)

The problem here seems to be that the code assumes that either the I/O =
ports
are always mapped or they are never mapped (no PCI_IOBASE). We need to =
extend
it because now we can have the combination of the two.

> >> For ipmi driver, I can get I/O port resource by DMI rather than dt=
s.
> >
> > No, the ipmi driver uses the resource that belongs to the platform
> > device already, you can't rely on DMI data to be present there.
>=20
> Ipmi has a lot of way to be discovered(ACPI, DMI, hardcoded, hot-add,
> openfirmware and a few other), I think we just use one of them, not a=
ll of them.
> It depend on vendor's hardware solution actually.

I don't think we should mix multiple methods here: if the bus is descri=
bed
in DT, all its children should be there as well. Otherwise you get into=
 problems
e.g. if you have multiple instances of the LPC bus and the Linux I/O ad=
dresses
for one or more of them have an offset to the bus specific addresses.

The bus probe code decides what the Linux I/O port numbers are, but DMI
and other methods have no idea of the mapping. As long as there is only
one instance, using the first 0x1000 addresses with a 1:1 mapping saves
us a bit of trouble, but I'd be worried about relying on that assumptio=
n
too much.

	Arnd
