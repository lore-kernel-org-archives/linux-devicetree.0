Return-Path: <SRS0=Te14=7U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9254DC433E0
	for <linux-devicetree@archiver.kernel.org>; Sun,  7 Jun 2020 04:31:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5ADEF2067B
	for <linux-devicetree@archiver.kernel.org>; Sun,  7 Jun 2020 04:31:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="0dnVgKVX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgFGEbw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 7 Jun 2020 00:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbgFGEbw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 7 Jun 2020 00:31:52 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE5CBC08C5C3
        for <devicetree@vger.kernel.org>; Sat,  6 Jun 2020 21:31:51 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x6so13816740wrm.13
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2020 21:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VyNLD0j+tnzf2M3FBuh45mIoPsUs+mXZDXgfBassdbg=;
        b=0dnVgKVXr2OGN0RiL5Q3LNUBAoOehM9ejkv/hGkZowwOowUjxR5cBpF9q9YDqLRZtz
         W/T7vvIsflGTbaKeJpExluyj4QITSPyuxXcm3dUGdQhXnGntYR5S6yhlm9exN7CYTPoO
         PhJkTIFhMbiihX2NECOo/CKM0ZE7bCrfbHTTehgQUBvFEYP7wN4jkaK1CMseGsKlasM3
         khhcUdhLzEGjyhiyCDbbvbkCDkX5dblWGlBIMdh/cWL3w4MYzrjTbVi8qhTt61nEkRqE
         LreVyZWvgpV9nnpNaiqsPcRw2uVjEUdskAvVkglQqbI2k//7WHBtpwwBZ1TqGyYm+aak
         heCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VyNLD0j+tnzf2M3FBuh45mIoPsUs+mXZDXgfBassdbg=;
        b=cF2SU6QjUvJ7gho53EPhbkbM8G35M9rUz/fpfJDwqzPe6zkEI7HFtjZXccA3DBK+x2
         4H1H3ZD2BedGO6i3ks3unki7rV3k0J7cTJJnKa0Uk+z2uRNXuggSG6B2BJl23H8mOiU+
         ZFJB9bi744fbpgT7RZ0nWvnVvAoBnfkc3FD9xnuO7gY2wbWicd/bYsZxLe4VVeJLGtZe
         KWeHsirEtkVjc724inA+w3ZbJvCfa9p/qoylvInapMioHjFIxAu+ZyRwsQ/UEtic9658
         +OMDQp+ALCJmjpZnk+33h80Gk0hSvSzm0EgDCmOE4qoR+avJ8UoHdfV0OPbaP3W4gDOW
         ZkNQ==
X-Gm-Message-State: AOAM530f8A+df63+9EmWuyemIenQ7P+XdzF8JV26c0FY3iLfqHGIN9oD
        APll2X3osSra66C+thiChVLBW7bLdoL8bku5/BHSqA==
X-Google-Smtp-Source: ABdhPJxp1a1ocgsIfMmX025/VEhbEKi29wp+HyxE/XS+cqOjJ7U09UlG62QjVDSEd/4+78NsyJ9Lgb67dAJGErgylLE=
X-Received: by 2002:a5d:6cc1:: with SMTP id c1mr17819454wrc.144.1591504310119;
 Sat, 06 Jun 2020 21:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200521134544.816918-2-anup.patel@wdc.com> <mhng-b031fd3d-c966-4973-a94d-3307d11b44d5@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-b031fd3d-c966-4973-a94d-3307d11b44d5@palmerdabbelt-glaptop1>
From:   Anup Patel <anup@brainfault.org>
Date:   Sun, 7 Jun 2020 10:01:38 +0530
Message-ID: <CAAhSdy1mS3XQF=m8b0qug_8WL6hZUupUOcqPuHTKqK7fbxWuEg@mail.gmail.com>
Subject: Re: [PATCH 1/5] RISC-V: Add mechanism to provide custom IPI operations
To:     Palmer Dabbelt <palmer@dabbelt.com>
Cc:     Anup Patel <Anup.Patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Damien Le Moal <Damien.LeMoal@wdc.com>,
        Atish Patra <Atish.Patra@wdc.com>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 5, 2020 at 2:10 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Thu, 21 May 2020 06:45:40 PDT (-0700), Anup Patel wrote:
> > We add mechanism to set custom IPI operations so that CLINT driver
> > from drivers directory can provide custom IPI operations.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  arch/riscv/include/asm/smp.h | 11 ++++++++
> >  arch/riscv/kernel/smp.c      | 52 ++++++++++++++++++++++++------------
> >  arch/riscv/kernel/smpboot.c  |  3 +--
> >  3 files changed, 47 insertions(+), 19 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
> > index 40bb1c15a731..ad0601260cb1 100644
> > --- a/arch/riscv/include/asm/smp.h
> > +++ b/arch/riscv/include/asm/smp.h
> > @@ -40,6 +40,17 @@ void arch_send_call_function_single_ipi(int cpu);
> >  int riscv_hartid_to_cpuid(int hartid);
> >  void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out);
> >
> > +struct riscv_ipi_ops {
> > +     void (*ipi_inject)(const unsigned long *hart_mask);
> > +     void (*ipi_clear)(void);
> > +};
> > +
> > +/* Set custom IPI operations */
> > +void riscv_set_ipi_ops(struct riscv_ipi_ops *ops);
> > +
> > +/* Clear IPI for current CPU */
> > +void riscv_clear_ipi(void);
> > +
> >  /*
> >   * Obtains the hart ID of the currently executing task.  This relies on
> >   * THREAD_INFO_IN_TASK, but we define that unconditionally.
> > diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> > index b1d4f452f843..8375cc5970f6 100644
> > --- a/arch/riscv/kernel/smp.c
> > +++ b/arch/riscv/kernel/smp.c
> > @@ -84,6 +84,35 @@ static void ipi_stop(void)
> >               wait_for_interrupt();
> >  }
> >
> > +#if IS_ENABLED(CONFIG_RISCV_SBI)
> > +static void clear_ipi(void)
> > +{
> > +     csr_clear(CSR_IP, IE_SIE);
> > +}
> > +
> > +static struct riscv_ipi_ops sbi_ipi_ops = {
> > +     .ipi_inject = sbi_send_ipi,
> > +     .ipi_clear = clear_ipi,
> > +};
> > +
> > +static struct riscv_ipi_ops *ipi_ops = &sbi_ipi_ops;
> > +#else
> > +static struct riscv_ipi_ops *ipi_ops;
> > +#endif
> > +
> > +void riscv_set_ipi_ops(struct riscv_ipi_ops *ops)
> > +{
> > +     ipi_ops = ops;
> > +}
> > +EXPORT_SYMBOL_GPL(riscv_set_ipi_ops);
> > +
> > +void riscv_clear_ipi(void)
> > +{
> > +     if (ipi_ops)
> > +             ipi_ops->ipi_clear();
> > +}
> > +EXPORT_SYMBOL_GPL(riscv_clear_ipi);
>
> There should at least be a warning on SMP systems when an ipi_ops hasn't been
> set, as otherwise the system will just hang.

Sure, I will add pr_warn() here.

>
> > +
> >  static void send_ipi_mask(const struct cpumask *mask, enum ipi_message_type op)
> >  {
> >       struct cpumask hartid_mask;
> > @@ -95,10 +124,9 @@ static void send_ipi_mask(const struct cpumask *mask, enum ipi_message_type op)
> >       smp_mb__after_atomic();
> >
> >       riscv_cpuid_to_hartid_mask(mask, &hartid_mask);
> > -     if (IS_ENABLED(CONFIG_RISCV_SBI))
> > -             sbi_send_ipi(cpumask_bits(&hartid_mask));
> > -     else
> > -             clint_send_ipi_mask(mask);
> > +
> > +     if (ipi_ops)
> > +             ipi_ops->ipi_inject(cpumask_bits(&hartid_mask));
> >  }
> >
> >  static void send_ipi_single(int cpu, enum ipi_message_type op)
> > @@ -109,18 +137,8 @@ static void send_ipi_single(int cpu, enum ipi_message_type op)
> >       set_bit(op, &ipi_data[cpu].bits);
> >       smp_mb__after_atomic();
> >
> > -     if (IS_ENABLED(CONFIG_RISCV_SBI))
> > -             sbi_send_ipi(cpumask_bits(cpumask_of(hartid)));
> > -     else
> > -             clint_send_ipi_single(hartid);
> > -}
> > -
> > -static inline void clear_ipi(void)
> > -{
> > -     if (IS_ENABLED(CONFIG_RISCV_SBI))
> > -             csr_clear(CSR_IP, IE_SIE);
> > -     else
> > -             clint_clear_ipi(cpuid_to_hartid_map(smp_processor_id()));
> > +     if (ipi_ops)
> > +             ipi_ops->ipi_inject(cpumask_bits(cpumask_of(hartid)));
> >  }
> >
> >  void handle_IPI(struct pt_regs *regs)
> > @@ -131,7 +149,7 @@ void handle_IPI(struct pt_regs *regs)
> >
> >       irq_enter();
> >
> > -     clear_ipi();
> > +     riscv_clear_ipi();
> >
> >       while (true) {
> >               unsigned long ops;
> > diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> > index 4e9922790f6e..5fe849791bf0 100644
> > --- a/arch/riscv/kernel/smpboot.c
> > +++ b/arch/riscv/kernel/smpboot.c
> > @@ -147,8 +147,7 @@ asmlinkage __visible void smp_callin(void)
> >  {
> >       struct mm_struct *mm = &init_mm;
> >
> > -     if (!IS_ENABLED(CONFIG_RISCV_SBI))
> > -             clint_clear_ipi(cpuid_to_hartid_map(smp_processor_id()));
> > +     riscv_clear_ipi();
> >
> >       /* All kernel threads share the same mm context.  */
> >       mmgrab(mm);

Regards,
Anup
