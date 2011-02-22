From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: Device tree on x86, part v4
Date: Tue, 22 Feb 2011 14:16:31 -0700
Message-ID: <AANLkTi=rvMEbu6ZqHMrin5wRcbO4024Ub93NmfKru+iQ@mail.gmail.com>
References: <1298405266-1624-1-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1298405266-1624-1-git-send-email-bigeasy@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, sodaville@linutronix.de, devicetree-discuss@lists.ozlabs.org, x86@kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 22, 2011 at 1:07 PM, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
> This patchset introduces device tree support on x86. The device tree =
is
> passed by the bootloader via setup_data. It is used as an additional
> source of information and does not replace the "traditional" x86 boot
> page.
> Right now we get the the following information from it:
> - hpet location
> - apic & ioapic location
> - ioapic's interrupt routing
> - legacy devices which are not initialized by bios
> - devices which are behind a bus which does not support enumeration l=
ike
> =A0i2c

Looks good; ship it!

g.

>
> History:
> - v1 initial post
> - v2: Benh took my device tree apart so once this got fixed I refacto=
r a
> =A0 =A0 =A0lot of code. Here are the changes:
> =A0 =A0 =A0- device tree is unflattenend before kmalloc() is working,
> =A0 =A0 =A0 =A0alloc_bootmem() is used for that.
> =A0 =A0 =A0- irq_host got renamed to irq_domain. This custom implemen=
tation
> =A0 =A0 =A0 =A0will leave once the powerpc implementation is in gener=
ic shape
> =A0 =A0 =A0- of_irq_map_pci() is moved from ppc & microblaze into dri=
vers/of
> =A0 =A0 =A0 =A0and used also by x86 instead of a tiny subset of it. B=
ridges are
> =A0 =A0 =A0 =A0not handled at all on x86 (I don't have any so for so =
I worry
> =A0 =A0 =A0 =A0later)
> =A0 =A0 =A0- the device tree is relocated from its initial location. =
That
> =A0 =A0 =A0 =A0means that the boot loader does not need to know anyth=
ing about
> =A0 =A0 =A0 =A0kernel's memory layout.
> - v3: - rebase on top of current tip. The OLPC merged some OF defines
> =A0 =A0 =A0 =A0which are mostly nops so I replaced them with the code=
 I have.
> =A0 =A0 =A0 =A0irq_create_of_mapping() requires now an irq chip to wo=
rk. Those
> =A0 =A0 =A0 =A0things are moved into prom.c which is enabled by CONFI=
G_X86_OF.
> =A0 =A0 =A0 =A0This probably breaks OLPC but I don't know what they n=
eed in the
> =A0 =A0 =A0 =A0end.
> =A0 =A0 =A0- Fixed up Grant's review comments. The most noticeable is=
 the i2c
> =A0 =A0 =A0 =A0controller node which has now three child nodes, repre=
senting the
> =A0 =A0 =A0 =A0three controllers indentified by the bar number. Each =
pci bar
> =A0 =A0 =A0 =A0matches via address translation the correct device tre=
e node.
> - v4: - rebased on top of tip's x86/platform branch.
> =A0 =A0 =A0- added some documentation about the new compatible proper=
ties.
> =A0 =A0 =A0- merged the two rtc commits.
> =A0 =A0 =A0- renamed prom.c to devicetree.c
> =A0 =A0 =A0- renamed CONFIG_X86_OF to CONFIG_USE_OF
> =A0 =A0 =A0- intel,ce4100-immr become intel,ce4100-cp
> =A0 =A0 =A0- "standard" hardware like hpet has "ce4100" in its proper=
ty. If
> =A0 =A0 =A0 =A0further HW is compatible with it, can reuse the proper=
ty string.
> =A0 =A0 =A0- converted interrupt map to device nodes with an interrup=
t property.
>
> The series is based on the tip tree and is also available at
> =A0git://git.linutronix.de/users/bigeasy/soda.git ce_of_v4
>
> Sebastian Andrzej Siewior (11):
> =A0 =A0 =A0x86/e820: remove conditional early mapping in parse_e820_e=
xt
> =A0 =A0 =A0x86: Add device tree support
> =A0 =A0 =A0x86/dtb: Add a device tree for CE4100
> =A0 =A0 =A0x86/dtb: add irq domain abstraction
> =A0 =A0 =A0x86/dtb: add early parsing of IO APIC
> =A0 =A0 =A0x86/dtb: add support hpet
> =A0 =A0 =A0x86/dtb: add support for PCI devices backed by dtb nodes
> =A0 =A0 =A0x86/dtb: Add generic bus probe
> =A0 =A0 =A0x86/ioapic: Add OF bindings for IO-APIC
> =A0 =A0 =A0x86/ce4100: use OF for ioapic
> =A0 =A0 =A0rtc/cmos: add OF bindings
>
> .../devicetree/bindings/i2c/ce4100-i2c.txt =A0 =A0 =A0 =A0 | =A0 93 +=
++++
> Documentation/devicetree/bindings/rtc/rtc-cmos.txt | =A0 28 ++
> Documentation/devicetree/bindings/x86/ce4100.txt =A0 | =A0 38 ++
> .../devicetree/bindings/x86/interrupt.txt =A0 =A0 =A0 =A0 =A0| =A0 29=
 ++
> Documentation/devicetree/bindings/x86/timer.txt =A0 =A0| =A0 =A06 +
> Documentation/devicetree/booting-without-of.txt =A0 =A0| =A0 20 +
> arch/x86/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 | =A0 =A07 +
> arch/x86/include/asm/bootparam.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 =A01 +
> arch/x86/include/asm/e820.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 =A02 +-
> arch/x86/include/asm/io_apic.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A07 +
> arch/x86/include/asm/irq.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A03 -
> arch/x86/include/asm/irq_controller.h =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 12 +
> arch/x86/include/asm/prom.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 72 ++++-
> arch/x86/kernel/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 =A01 +
> arch/x86/kernel/apic/io_apic.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 99 +++++
> arch/x86/kernel/devicetree.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0337 +++++++++++++++
> arch/x86/kernel/e820.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 =A08 +-
> arch/x86/kernel/irq.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| =A0 =A09 -
> arch/x86/kernel/irqinit.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A09 +-
> arch/x86/kernel/rtc.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| =A0 =A03 +
> arch/x86/kernel/setup.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 22 +-
> arch/x86/platform/ce4100/ce4100.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 24 +-
> arch/x86/platform/ce4100/falconfalls.dts =A0 =A0 =A0 =A0 =A0 | =A0430=
 ++++++++++++++++++++
> drivers/of/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 | =A0 =A02 +-
> drivers/of/of_pci.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| =A0 =A01 +
> drivers/rtc/rtc-cmos.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 45 ++
> include/linux/of.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 | =A0 12 +
> 27 files changed, 1287 insertions(+), 33 deletions(-)
> create mode 100644 Documentation/devicetree/bindings/i2c/ce4100-i2c.t=
xt
> create mode 100644 Documentation/devicetree/bindings/rtc/rtc-cmos.txt
> create mode 100644 Documentation/devicetree/bindings/x86/ce4100.txt
> create mode 100644 Documentation/devicetree/bindings/x86/interrupt.tx=
t
> create mode 100644 Documentation/devicetree/bindings/x86/timer.txt
> create mode 100644 arch/x86/include/asm/irq_controller.h
> create mode 100644 arch/x86/kernel/devicetree.c
> create mode 100644 arch/x86/platform/ce4100/falconfalls.dts
>
> Sebastian
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
