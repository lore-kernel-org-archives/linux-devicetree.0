From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2] ARM: new platform for Energy Micro's EFM32 Cortex-M3 SoCs
Date: Sun, 29 Sep 2013 21:00:41 +0200
Message-ID: <201309292100.41701.arnd@arndb.de>
References: <1379447884-14025-1-git-send-email-u.kleine-koenig@pengutronix.de> <201309272344.01386.arnd@arndb.de> <20130928191511.GA2548@pengutronix.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130928191511.GA2548-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jonathan Austin <jonathan.austin-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Saturday 28 September 2013, Uwe Kleine-K=F6nig wrote:
> Hi Arnd,
>=20
> On Fri, Sep 27, 2013 at 11:44:01PM +0200, Arnd Bergmann wrote:
> > On Thursday 26 September 2013, Uwe Kleine-K=F6nig wrote:
> > > I made that work now and can prepare a patch. I had to drop "depe=
nds on
> > > !ARCH_MULTIPLATFORM" from XIP_KERNEL. That's because my machine o=
nly
> > > works with XIP_KERNEL as it only has 4 MiB of RAM.
> >=20
> > Ok, cool. We might run into a few problems with 'make randconfig' a=
nd
> > 'make allyesconfig' when it becomes possible to enable XIP_KERNEL t=
hen.
> > IIRC, there is no fundamental reason to disallow XIP_KERNEL with
> > ARCH_MULTIPLATFORM, but I added the dependency because it causes
> > build errors in combination with other options.
> ah, OK. Do you have an idea to fix both?

No, I don't actually remember what problems I ran into. It may be anywh=
ere
from trivial to impossible to fix.

> > * Do you think 4MB is now a strict lower bound for running a modern
> > kernel? It would be a good data point if we could show that any tar=
get
> > with less than that is by definition broken and could get removed
> > from the kernel. What is the size of your kernel and user space?
> $ objdump -p vmlinux
>=20
> vmlinux:     file format elf32-littlearm
>=20
> Program Header:
>     LOAD off    0x00000000 vaddr 0x88020000 paddr 0x88020000 align 2*=
*15
>          filesz 0x00000094 memsz 0x0000a9f4 flags rw-
>     LOAD off    0x00008000 vaddr 0x8c000000 paddr 0x8c000000 align 2*=
*15
>          filesz 0x001679b0 memsz 0x001679b0 flags rwx
>     LOAD off    0x00170000 vaddr 0x88008000 paddr 0x8c1679b0 align 2*=
*15
>          filesz 0x00018d2c memsz 0x00018d2c flags rw-
> private flags =3D 5000002: [Version5 EABI] [has entry point]
>=20
> my rootfs (busybox, no init) is 153600 bytes big.
>=20
> After booting I get:
>=20
> 	/ # free
> 		     total         used         free       shared      buffers
> 	Mem:          3892         1428         2464            0           =
 0
> 	-/+ buffers:               1428         2464
>=20
> but it doesn't run anything but a busybox shell ATM. Assuming the nex=
t
> smaller configuration is 2 MiB of RAM I'd say that machine can maybe
> boot, but cannot do anything sensible after that.

Ok, thanks for that data! I can still imagine embedded applications whe=
re
you have a custom /sbin/init that does just one thing even with 2MB, bu=
t
it's good to know that a 4MB system is still basically usable with some
free memory left for workloads.

> > * What user space are you running? Anything that's easy to build
> > for testing? Should that run with a mach-virt kernel built for
> > ARMv7-A NOMMU?
> There is a BSP publically available at
>=20
> 	http://git-public.pengutronix.de/?p=3DOSELAS.BSP-EnergyMicro-Gecko.g=
it;a=3Dsummary
>=20
> which also includes a README file. For troubleshooting /join #efm32 o=
n
> freenode.

I've never tried ptxdist, but if that is known to work fine with NOMMU,
I might just try building the base distro and running it on mach-virt.

Does this work with ELF FDPIC or do you need binfmt-flat?

> > * An ARMv7-M kernel cannot run on either ARMv4/v5 nor ARMv6/v7-A, r=
ight?
> The entry convention is different (ARMv7-M doesn't support the ARM
> instruction set but you need to jump into the kernel in ARM mode for
> v4-v7). Other that that I don't know if there is a problem. Maybe
> Jonathan can say anything here? Or alternatively if you want an efm32
> devboard, just tell me.

I haven't started a test farm like Olof has yet. I'll have to think abo=
ut
whether I want to have my own, but he might also be interested in addin=
g
a NOMMU target to his collection.

> > Do you prevent building such a kernel in Kconfig?
> I'm sure my Kconfig magic isn't waterproof. It took me a few tries to
> expand the multiarch architecture selection to make v7-m selectable a=
t
> all.

Ok, I can have a look and give you suggestions for how it needs to be
phrased if it currently allows broken (non-building) combinations.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
