From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH v2 02/19] MIPS: Loongson64: separate
 loongson2ef/loongson64 code
Date: Tue, 10 Sep 2019 00:12:49 +0000
Message-ID: <20190910001248.few7zmxsrg72mdum@pburton-laptop>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
 <20190905144316.12527-3-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905144316.12527-3-jiaxun.yang@flygoat.com>
Content-Language: en-US
Content-ID: <9954A55BAF02BB4E8DCD3606A05CE45B@namprd22.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, "chenhc@lemote.com" <chenhc@lemote.com>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "maz@kernel.org" <maz@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.co" <mark.rutland@arm.co>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jiaxun & Huacai,

On Thu, Sep 05, 2019 at 10:42:59PM +0800, Jiaxun Yang wrote:
> As later model of GSx64 family processors including 2-series-soc have
> similar design with initial loongson3a while loongson2e/f seems less
> identical, we separate loongson2e/f support code out of mach-loongson64
> to make our life easier.
>=20
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

I looked at applying the first 3 patches of this series to mips-next &
squashed in the relevant defconfig updates, then was looking at applying
Huacai's recent 3 patch series.

One issue is that they conflict, but beyond that it showed me that this
patch deletes kernel-entry-init.h entirely. Was that intentional? If so
it should be a separate patch & it needs an explanation.

Please could the two of you make it clear what branch & commit your
patches are based upon? Ideally it should be the current head of the
mips-next branch.

Also Jiaxun, it's really hard to see whether this patch is making any
functional changes in addition to the duplication & renaming. I think it
would be much better to split this into a few steps across multiple
commits, something like this:

1) Copy the loongson64 directory to loongson2ef, and keep the copy as-is
   *except* for the removal of the loongson2ef/loongon-3 subdirectory.
   Delete loongson64/fuloong-2e & loongson64/lemote-2f.

2) Now clean up the loongson64 directory by moving files up from the
   loongson-3 subdirectory.

3) Now clean up code, removing #ifdef's etc that no longer make sense.

Provide the -M & -C flags to git format-patch when generating your
patches. --find-copies-harder might help with the first step, if it's
practical to run.

That way each commit will be easier to review, and issues like the
deletion of kernel-entry-init.h will be easier to spot.

For now I undid the whole thing. It's getting late in the cycle anyway,
so this will probably be v5.5 material.

Thanks,
    Paul

> ---
>  arch/mips/Kbuild.platforms                    |   1 +
>  arch/mips/Kconfig                             |  51 +++++--
>  arch/mips/include/asm/bootinfo.h              |   1 -
>  .../mach-loongson2ef/cpu-feature-overrides.h  |  45 +++++++
>  .../cs5536/cs5536.h                           |   0
>  .../cs5536/cs5536_mfgpt.h                     |   0
>  .../cs5536/cs5536_pci.h                       |   0
>  .../cs5536/cs5536_vsm.h                       |   0
>  .../loongson2ef.h}                            |  29 +---
>  .../machine.h                                 |   6 -
>  .../mc146818rtc.h                             |   5 +-
>  .../mem.h                                     |   6 +-
>  arch/mips/include/asm/mach-loongson2ef/pci.h  |  43 ++++++
>  .../include/asm/mach-loongson2ef/spaces.h     |  10 ++
>  .../mach-loongson64/cpu-feature-overrides.h   |   8 +-
>  arch/mips/include/asm/mach-loongson64/irq.h   |   7 +-
>  .../asm/mach-loongson64/kernel-entry-init.h   |  74 ----------
>  .../include/asm/mach-loongson64/loongson64.h  |  48 +++++++
>  .../mips/include/asm/mach-loongson64/mmzone.h |  16 ---
>  arch/mips/include/asm/mach-loongson64/pci.h   |  41 +-----
>  .../include/asm/mach-loongson64/workarounds.h |   4 +-
>  arch/mips/loongson2ef/Kconfig                 |  93 +++++++++++++
>  arch/mips/loongson2ef/Makefile                |  18 +++
>  arch/mips/loongson2ef/Platform                |  32 +++++
>  .../common/Makefile                           |   0
>  .../common/bonito-irq.c                       |   2 +-
>  .../common/cmdline.c                          |   2 +-
>  .../common/cs5536/Makefile                    |   0
>  .../common/cs5536/cs5536_acc.c                |   0
>  .../common/cs5536/cs5536_ehci.c               |   0
>  .../common/cs5536/cs5536_ide.c                |   0
>  .../common/cs5536/cs5536_isa.c                |   0
>  .../common/cs5536/cs5536_mfgpt.c              |   0
>  .../common/cs5536/cs5536_ohci.c               |   0
>  .../common/cs5536/cs5536_pci.c                |   0
>  .../common/early_printk.c                     |   2 +-
>  arch/mips/loongson2ef/common/env.c            |  71 ++++++++++
>  .../{loongson64 =3D> loongson2ef}/common/init.c |   7 +-
>  .../{loongson64 =3D> loongson2ef}/common/irq.c  |   2 +-
>  .../common/machtype.c                         |   3 +-
>  .../{loongson64 =3D> loongson2ef}/common/mem.c  |  40 +-----
>  .../{loongson64 =3D> loongson2ef}/common/pci.c  |  11 +-
>  .../common/platform.c                         |   0
>  .../{loongson64 =3D> loongson2ef}/common/pm.c   |   2 +-
>  .../common/reset.c                            |  23 +---
>  .../{loongson64 =3D> loongson2ef}/common/rtc.c  |   0
>  .../common/serial.c                           |  37 +----
>  .../common/setup.c                            |   2 +-
>  .../{loongson64 =3D> loongson2ef}/common/time.c |   2 +-
>  .../common/uart_base.c                        |  10 +-
>  .../fuloong-2e/Makefile                       |   0
>  .../fuloong-2e/dma.c                          |   0
>  .../fuloong-2e/irq.c                          |   2 +-
>  .../fuloong-2e/reset.c                        |   2 +-
>  .../lemote-2f/Makefile                        |   0
>  .../lemote-2f/clock.c                         |   2 +-
>  .../lemote-2f/dma.c                           |   0
>  .../lemote-2f/ec_kb3310b.c                    |   0
>  .../lemote-2f/ec_kb3310b.h                    |   0
>  .../lemote-2f/irq.c                           |   2 +-
>  .../lemote-2f/machtype.c                      |   2 +-
>  .../lemote-2f/pm.c                            |   2 +-
>  .../lemote-2f/reset.c                         |   2 +-
>  arch/mips/loongson64/Kconfig                  | 126 +-----------------
>  arch/mips/loongson64/Makefile                 |  23 +---
>  arch/mips/loongson64/Platform                 |  26 +---
>  .../loongson64/{loongson-3 =3D> }/acpi_init.c   |   3 +-
>  .../loongson64/{loongson-3 =3D> }/cop2-ex.c     |   5 +-
>  arch/mips/loongson64/{loongson-3 =3D> }/dma.c   |   6 +-
>  arch/mips/loongson64/{common =3D> }/env.c       |  72 +++-------
>  arch/mips/loongson64/{loongson-3 =3D> }/hpet.c  |   0
>  arch/mips/loongson64/{loongson-3 =3D> }/irq.c   |  40 +++++-
>  arch/mips/loongson64/loongson-3/Makefile      |  11 --
>  arch/mips/loongson64/{loongson-3 =3D> }/numa.c  |   4 +-
>  arch/mips/loongson64/pci.c                    |  45 +++++++
>  .../loongson64/{loongson-3 =3D> }/platform.c    |   0
>  arch/mips/loongson64/reset.c                  |  58 ++++++++
>  arch/mips/loongson64/setup.c                  |  91 +++++++++++++
>  arch/mips/loongson64/{loongson-3 =3D> }/smp.c   |   4 +-
>  arch/mips/loongson64/{loongson-3 =3D> }/smp.h   |   0
>  arch/mips/oprofile/op_model_loongson2.c       |   2 +-
>  arch/mips/oprofile/op_model_loongson3.c       |   2 +-
>  arch/mips/pci/Makefile                        |   2 +-
>  arch/mips/pci/fixup-fuloong2e.c               |   2 +-
>  arch/mips/pci/fixup-lemote2f.c                |   2 +-
>  arch/mips/pci/ops-loongson2.c                 |   2 +-
>  arch/mips/pci/ops-loongson3.c                 |   2 +-
>  drivers/cpufreq/loongson2_cpufreq.c           |   2 +-
>  drivers/gpio/gpio-loongson.c                  |   2 +-
>  drivers/platform/mips/cpu_hwmon.c             |   2 +-
>  90 files changed, 720 insertions(+), 582 deletions(-)
>  create mode 100644 arch/mips/include/asm/mach-loongson2ef/cpu-feature-ov=
errides.h
>  rename arch/mips/include/asm/{mach-loongson64 =3D> mach-loongson2ef}/cs5=
536/cs5536.h (100%)
>  rename arch/mips/include/asm/{mach-loongson64 =3D> mach-loongson2ef}/cs5=
536/cs5536_mfgpt.h (100%)
>  rename arch/mips/include/asm/{mach-loongson64 =3D> mach-loongson2ef}/cs5=
536/cs5536_pci.h (100%)
>  rename arch/mips/include/asm/{mach-loongson64 =3D> mach-loongson2ef}/cs5=
536/cs5536_vsm.h (100%)
>  rename arch/mips/include/asm/{mach-loongson64/loongson.h =3D> mach-loong=
son2ef/loongson2ef.h} (91%)
>  rename arch/mips/include/asm/{mach-loongson64 =3D> mach-loongson2ef}/mac=
hine.h (80%)
>  rename arch/mips/include/asm/{mach-loongson64 =3D> mach-loongson2ef}/mc1=
46818rtc.h (80%)
>  rename arch/mips/include/asm/{mach-loongson64 =3D> mach-loongson2ef}/mem=
.h (86%)
>  create mode 100644 arch/mips/include/asm/mach-loongson2ef/pci.h
>  create mode 100644 arch/mips/include/asm/mach-loongson2ef/spaces.h
>  delete mode 100644 arch/mips/include/asm/mach-loongson64/kernel-entry-in=
it.h
>  create mode 100644 arch/mips/include/asm/mach-loongson64/loongson64.h
>  create mode 100644 arch/mips/loongson2ef/Kconfig
>  create mode 100644 arch/mips/loongson2ef/Makefile
>  create mode 100644 arch/mips/loongson2ef/Platform
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/Makefile (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/bonito-irq.c (97%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/cmdline.c (97%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/Makefile (1=
00%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_acc.=
c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_ehci=
.c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_ide.=
c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_isa.=
c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_mfgp=
t.c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_ohci=
.c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_pci.=
c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/early_printk.c (97=
%)
>  create mode 100644 arch/mips/loongson2ef/common/env.c
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/init.c (90%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/irq.c (98%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/machtype.c (94%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/mem.c (72%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/pci.c (89%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/platform.c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/pm.c (99%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/reset.c (77%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/rtc.c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/serial.c (63%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/setup.c (97%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/time.c (96%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/uart_base.c (77%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/fuloong-2e/Makefile (100%=
)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/fuloong-2e/dma.c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/fuloong-2e/irq.c (98%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/fuloong-2e/reset.c (93%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/Makefile (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/clock.c (98%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/dma.c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/ec_kb3310b.c (1=
00%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/ec_kb3310b.h (1=
00%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/irq.c (99%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/machtype.c (98%=
)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/pm.c (99%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/reset.c (99%)
>  rename arch/mips/loongson64/{loongson-3 =3D> }/acpi_init.c (99%)
>  rename arch/mips/loongson64/{loongson-3 =3D> }/cop2-ex.c (88%)
>  rename arch/mips/loongson64/{loongson-3 =3D> }/dma.c (82%)
>  rename arch/mips/loongson64/{common =3D> }/env.c (79%)
>  rename arch/mips/loongson64/{loongson-3 =3D> }/hpet.c (100%)
>  rename arch/mips/loongson64/{loongson-3 =3D> }/irq.c (77%)
>  delete mode 100644 arch/mips/loongson64/loongson-3/Makefile
>  rename arch/mips/loongson64/{loongson-3 =3D> }/numa.c (98%)
>  create mode 100644 arch/mips/loongson64/pci.c
>  rename arch/mips/loongson64/{loongson-3 =3D> }/platform.c (100%)
>  create mode 100644 arch/mips/loongson64/reset.c
>  create mode 100644 arch/mips/loongson64/setup.c
>  rename arch/mips/loongson64/{loongson-3 =3D> }/smp.c (99%)
>  rename arch/mips/loongson64/{loongson-3 =3D> }/smp.h (100%)
