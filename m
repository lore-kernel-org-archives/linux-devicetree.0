From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: new platform for Energy Micro's EFM32 Cortex-M3
 SoCs
Date: Sat, 28 Sep 2013 21:15:11 +0200
Message-ID: <20130928191511.GA2548@pengutronix.de>
References: <1379447884-14025-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <201309172245.25367.arnd@arndb.de>
 <20130926094251.GK16106@pengutronix.de>
 <201309272344.01386.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201309272344.01386.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jonathan Austin <jonathan.austin-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Fri, Sep 27, 2013 at 11:44:01PM +0200, Arnd Bergmann wrote:
> On Thursday 26 September 2013, Uwe Kleine-K=F6nig wrote:
> > I made that work now and can prepare a patch. I had to drop "depend=
s on
> > !ARCH_MULTIPLATFORM" from XIP_KERNEL. That's because my machine onl=
y
> > works with XIP_KERNEL as it only has 4 MiB of RAM.
>=20
> Ok, cool. We might run into a few problems with 'make randconfig' and
> 'make allyesconfig' when it becomes possible to enable XIP_KERNEL the=
n.
> IIRC, there is no fundamental reason to disallow XIP_KERNEL with
> ARCH_MULTIPLATFORM, but I added the dependency because it causes
> build errors in combination with other options.
ah, OK. Do you have an idea to fix both?
=20
> A few questions from my side, out of curiosity:
>=20
> * Do you need any other patches (unrelated to EFM32) to run NOMMU on =
a
> recent kernel? When I last tried, I could not get any NOMMU build to =
work
> at all.
no, there isn't much needed on top of current mainline. My current wip =
is at

	git://git.pengutronix.de/git/ukl/linux.git efm32

I don't even rely on all the HACK-patches that are included there. (The
multi-arch stuff isn't there yet.)
=20
> * Do you think 4MB is now a strict lower bound for running a modern
> kernel? It would be a good data point if we could show that any targe=
t
> with less than that is by definition broken and could get removed
> from the kernel. What is the size of your kernel and user space?
$ objdump -p vmlinux

vmlinux:     file format elf32-littlearm

Program Header:
    LOAD off    0x00000000 vaddr 0x88020000 paddr 0x88020000 align 2**1=
5
         filesz 0x00000094 memsz 0x0000a9f4 flags rw-
    LOAD off    0x00008000 vaddr 0x8c000000 paddr 0x8c000000 align 2**1=
5
         filesz 0x001679b0 memsz 0x001679b0 flags rwx
    LOAD off    0x00170000 vaddr 0x88008000 paddr 0x8c1679b0 align 2**1=
5
         filesz 0x00018d2c memsz 0x00018d2c flags rw-
private flags =3D 5000002: [Version5 EABI] [has entry point]

my rootfs (busybox, no init) is 153600 bytes big.

After booting I get:

	/ # free
		     total         used         free       shared      buffers
	Mem:          3892         1428         2464            0            0
	-/+ buffers:               1428         2464

but it doesn't run anything but a busybox shell ATM. Assuming the next
smaller configuration is 2 MiB of RAM I'd say that machine can maybe
boot, but cannot do anything sensible after that.

> * What user space are you running? Anything that's easy to build
> for testing? Should that run with a mach-virt kernel built for
> ARMv7-A NOMMU?
There is a BSP publically available at

	http://git-public.pengutronix.de/?p=3DOSELAS.BSP-EnergyMicro-Gecko.git=
;a=3Dsummary

which also includes a README file. For troubleshooting /join #efm32 on
freenode.
=20
> * An ARMv7-M kernel cannot run on either ARMv4/v5 nor ARMv6/v7-A, rig=
ht?
The entry convention is different (ARMv7-M doesn't support the ARM
instruction set but you need to jump into the kernel in ARM mode for
v4-v7). Other that that I don't know if there is a problem. Maybe
Jonathan can say anything here? Or alternatively if you want an efm32
devboard, just tell me.

> Do you prevent building such a kernel in Kconfig?
I'm sure my Kconfig magic isn't waterproof. It took me a few tries to
expand the multiarch architecture selection to make v7-m selectable at
all.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
