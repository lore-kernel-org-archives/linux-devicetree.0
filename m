From: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v3 2/2] RISC-V: sifive_l2_cache: Add L2 cache controller
 driver for SiFive SoCs
Date: Wed, 8 May 2019 11:19:37 +0530
Message-ID: <CAJ2_jOFPqgFzc_q0kq3GZY2w5KAS6wkbvBx4vZSgLXfAeanR7g@mail.gmail.com>
References: <1557139720-12384-1-git-send-email-yash.shah@sifive.com>
 <1557139720-12384-3-git-send-email-yash.shah@sifive.com> <d36b7a74-0d08-0143-b479-45f760c347ba@ti.com>
 <CAJ2_jOFZjTNA3Nf=zNwLT+St21Q2_TPx_XYhggU=yef6LPkLdg@mail.gmail.com> <ba1481d0-f21b-5b0d-e3d5-ecb9faf42407@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ba1481d0-f21b-5b0d-e3d5-ecb9faf42407@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, mark.rutland@arm.com, robh+dt@kernel.org, Sachin Ghadi <sachin.ghadi@sifive.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 7, 2019 at 7:15 PM Andrew F. Davis <afd@ti.com> wrote:
>
> On 5/7/19 2:48 AM, Yash Shah wrote:
> > On Mon, May 6, 2019 at 5:48 PM Andrew F. Davis <afd@ti.com> wrote:
> >>
> >> On 5/6/19 6:48 AM, Yash Shah wrote:
> >>> The driver currently supports only SiFive FU540-C000 platform.
> >>>
> >>> The initial version of L2 cache controller driver includes:
> >>> - Initial configuration reporting at boot up.
> >>> - Support for ECC related functionality.
> >>>
> >>> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> >>> ---
> >>>  arch/riscv/include/asm/sifive_l2_cache.h |  16 +++
> >>>  arch/riscv/mm/Makefile                   |   1 +
> >>>  arch/riscv/mm/sifive_l2_cache.c          | 175 +++++++++++++++++++++++++++++++
> >>>  3 files changed, 192 insertions(+)
> >>>  create mode 100644 arch/riscv/include/asm/sifive_l2_cache.h
> >>>  create mode 100644 arch/riscv/mm/sifive_l2_cache.c
> >>>
> >>> diff --git a/arch/riscv/include/asm/sifive_l2_cache.h b/arch/riscv/include/asm/sifive_l2_cache.h
> >>> new file mode 100644
> >>> index 0000000..04f6748
> >>> --- /dev/null
> >>> +++ b/arch/riscv/include/asm/sifive_l2_cache.h
> >>> @@ -0,0 +1,16 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0 */
> >>> +/*
> >>> + * SiFive L2 Cache Controller header file
> >>> + *
> >>> + */
> >>> +
> >>> +#ifndef _ASM_RISCV_SIFIVE_L2_CACHE_H
> >>> +#define _ASM_RISCV_SIFIVE_L2_CACHE_H
> >>> +
> >>> +extern int register_sifive_l2_error_notifier(struct notifier_block *nb);
> >>> +extern int unregister_sifive_l2_error_notifier(struct notifier_block *nb);
> >>> +
> >>> +#define SIFIVE_L2_ERR_TYPE_CE 0
> >>> +#define SIFIVE_L2_ERR_TYPE_UE 1
> >>> +
> >>> +#endif /* _ASM_RISCV_SIFIVE_L2_CACHE_H */
> >>> diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> >>> index eb22ab4..1523ee5 100644
> >>> --- a/arch/riscv/mm/Makefile
> >>> +++ b/arch/riscv/mm/Makefile
> >>> @@ -3,3 +3,4 @@ obj-y += fault.o
> >>>  obj-y += extable.o
> >>>  obj-y += ioremap.o
> >>>  obj-y += cacheflush.o
> >>> +obj-y += sifive_l2_cache.o
> >>> diff --git a/arch/riscv/mm/sifive_l2_cache.c b/arch/riscv/mm/sifive_l2_cache.c
> >>> new file mode 100644
> >>> index 0000000..4eb6461
> >>> --- /dev/null
> >>> +++ b/arch/riscv/mm/sifive_l2_cache.c
> >>> @@ -0,0 +1,175 @@
> >>> +// SPDX-License-Identifier: GPL-2.0
> >>> +/*
> >>> + * SiFive L2 cache controller Driver
> >>> + *
> >>> + * Copyright (C) 2018-2019 SiFive, Inc.
> >>> + *
> >>> + */
> > [...]
> >>> +
> >>> +#ifdef CONFIG_DEBUG_FS
> >>> +static struct dentry *sifive_test;
> >>> +
> >>> +static ssize_t l2_write(struct file *file, const char __user *data,
> >>> +                     size_t count, loff_t *ppos)
> >>> +{
> >>> +     unsigned int val;
> >>> +
> >>> +     if (kstrtouint_from_user(data, count, 0, &val))
> >>> +             return -EINVAL;
> >>> +     if ((val >= 0 && val < 0xFF) || (val >= 0x10000 && val < 0x100FF))
> >>
> >> I'm guessing bit 16 is the enable and the lower 8 are some kind of
> >> region to enable the error? This is probably a bad interface, it looks
> >> useful for testing but doesn't provide any debugging info useful for
> >> running systems. Do you really want userspace to be able to do this?
> >
> > Bit 16 selects the type of ECC error (0=data or 1=directory error).
> > The lower 8 bits toggles (corrupt) that bit index.
> > Are you suggesting to remove this debug interface altogether or you
> > want me to improve the current interface?
> > Something like providing 2 separate debugfs files for data and
> > directory errors. And create a separate 8-bit debugfs variable to
> > select the bit index to toggle.
> >
>
> I was suggesting to remove the whole thing. I don't see it being all
> that useful, but it is up to you.

Thanks for the suggestion, but I will keep it as we do need it for our testing.

- Yash
