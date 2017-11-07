From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: next/master build: 214 builds: 26 failed, 188 passed, 28 errors,
 6333 warnings (next-20171107)
Date: Tue, 7 Nov 2017 13:15:22 +0100
Message-ID: <CAK8P3a3QKkGv6eSjX7wH6LpOY0-1XUPFoX0ntog5-ZSHPab6iA@mail.gmail.com>
References: <5a0159b6.08bc500a.ebe4b.25c6@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5a0159b6.08bc500a.ebe4b.25c6-ATjtLOhZ0NVl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "kernelci.org bot" <bot-ssFOTAMYnuFg9hUCZPvPmw@public.gmane.org>
Cc: Kernel Build Reports Mailman List <kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "open list:RALINK MIPS ARCHITECTURE" <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 7, 2017 at 7:59 AM, kernelci.org bot <bot-ssFOTAMYnuFg9hUCZPvPmw@public.gmane.org> wrote:

> Errors summary:
> 20 arch/mips/include/asm/smp.h:32:29: error: 'CONFIG_MIPS_NR_CPU_NR_MAP' =
undeclared here (not in a function)

I have reported this before, as did 0day, but I don't know if anyone
is fixing this:

https://lists.01.org/pipermail/kbuild-all/2017-October/038694.html

This is caused by commit 43b97bf59c69 ("MIPS: Allow __cpu_number_map
to be larger than NR_CPUS")

> 2 arch/arm/mach-footbridge/dc21285.c:145:2: error: expected ';' before 'e=
lse'

A harmless rework that Linus Walleij did apparently uncovered an
ancient bug. I'm
waiting for Linus to suggest a fix.

> 1 timekeeping.c:(.text+0x1628): undefined reference to `__lshrti3'
> 1 fair.c:(.text+0x35c): undefined reference to `__lshrti3'

Caused by the new 128-bit arithmetic in ARM64, a fix has been submitted by =
the
original author.

> 1 net/dsa/dsa2.c:678:7: error: implicit declaration of function 'of_prope=
rty_read_variable_u32_array' [-Werror=3Dimplicit-function-declaration]

I sent a fix

> Warnings summary:
> 16 fs/xfs/libxfs/xfs_bmap.c:4777:20: warning: unused variable 'ifp' [-Wun=
used-variable]
> 16 fs/xfs/libxfs/xfs_bmap.c:4649:20: warning: unused variable 'ifp' [-Wun=
used-variable]

I sent a fix

> 12 arch/arm/boot/dts/spear1340-evb.dtb: Warning (dmas_property): Property=
 'dmas', cell 4 is not a phandle reference in /ahb/apb/serial@b4100000
> 12 arch/arm/boot/dts/spear1340-evb.dtb: Warning (dmas_property): Missing =
property '#dma-cells' in node /interrupt-controller@ec801000 or bad phandle=
 (referred from /ahb/apb/serial@b4100000:dmas[4])
> 12 arch/arm/boot/dts/spear1310-evb.dtb: Warning (gpios_property): Propert=
y 'cs-gpios', cell 6 is not a phandle reference in /ahb/apb/spi@e0100000
> 12 arch/arm/boot/dts/spear1310-evb.dtb: Warning (gpios_property): Missing=
 property '#gpio-cells' in node /interrupt-controller@ec801000 or bad phand=
le (referred from /ahb/apb/spi@e0100000:cs-gpios[6])
...

endless stream of new dtc warnings, mostly valid. I have started
fixing them but at some point
gave up. Looking for help here.

> Warnings:
> warning: objtool: x86 instruction decoder differs from kernel
> net/dccp/probe.c:166:2: warning: 'register_jprobe' is deprecated [-Wdepre=
cated-declarations]
> net/dccp/probe.c:170:4: warning: 'register_jprobe' is deprecated [-Wdepre=
cated-declarations]
> net/dccp/probe.c:190:2: warning: 'unregister_jprobe' is deprecated [-Wdep=
recated-declarations]
> net/ipv4/tcp_probe.c:280:2: warning: 'register_jprobe' is deprecated [-Wd=
eprecated-declarations]
> net/ipv4/tcp_probe.c:298:2: warning: 'unregister_jprobe' is deprecated [-=
Wdeprecated-declarations]
> net/sctp/probe.c:189:2: warning: 'register_jprobe' is deprecated [-Wdepre=
cated-declarations]
> net/sctp/probe.c:194:3: warning: 'register_jprobe' is deprecated [-Wdepre=
cated-declarations]
> net/sctp/probe.c:240:2: warning: 'unregister_jprobe' is deprecated [-Wdep=
recated-declarations]

Not sure, we discussed possible alternatives, but it looks like this
is not getting addressed before
4.15, so we may end up removing the deprecation warning to get a clean
4.15 build instead.

> drivers/soc/qcom/rmtfs_mem.c:211:1: warning: label 'remove_cdev' defined =
but not used [-Wunused-label]

I sent a patch

> x86_64_defconfig (x86) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches
>
> Warnings:
> warning: objtool: x86 instruction decoder differs from kernel

Josh Poimboeuf sent a patch

> net/netfilter/nf_conntrack_netlink.c:536:15: warning: 'ctnetlink_proto_si=
ze' defined but not used [-Wunused-function]

I have a patch, will send after some more testing.

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
