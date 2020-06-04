Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B3AC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 20:40:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5552520870
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 20:40:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="VXGVn3ck"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730034AbgFDUkY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Jun 2020 16:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730014AbgFDUkW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jun 2020 16:40:22 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67564C08C5C1
        for <devicetree@vger.kernel.org>; Thu,  4 Jun 2020 13:40:21 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id n9so2692570plk.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2020 13:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=dXU50/vf3BdT0KhuAX1AE6U0lathyuxAlinPdoFQsDA=;
        b=VXGVn3cka4wtLtWRU2vH5LpOwdIleHAejoNzjnxvaqIVf/dhlVR6FkJRzxO5ZpWCe0
         9nZJ9jNeqEqzYEci4etGJoLP2shWMbqXlNvMaE1uoXddVCer2efqgnk4IxQ4Hwp1SsUt
         R2wLWab5ymO7lccIXz5aWfv1oz6BNQcRh6apur0MDjE4t0v8HxB4UNLC/2UjGkpRscJw
         zB+vo9IOAlNYR3/i6dd85DkJrZnmr+O0rqtghr6vuZ3z3Uq4o2k0+xWd28RUT4QbvDmb
         owGlzpA0GcSRJHuVu+KXRaAX4hZA57rR5qgWUFOXhfMoM5YlhQGgqQVL02q80NBQp2CP
         pxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=dXU50/vf3BdT0KhuAX1AE6U0lathyuxAlinPdoFQsDA=;
        b=un+gffFOAM3CyjDuXCENlKdJ1JfE5X4o0dqP1dc56lT470tC0EqkF0CbyunOD+SZ2G
         em1mDRyu3M/bODpmFnlnXiZfga6yuIEJnhJ8KNt+AEQVrbsZWnp5eCe9G9h0jiJjuJQF
         kv+vlJylb+jQWxx9CxA7PyIaYXj9giw6x9N18ormTLH1/skS7iJBFbz+qazryLpc2N6G
         WTN4wz/YERjw87nwyD8JVQGeiRIxKl9SG/f/0wQKIjxGe5DpWSqIlSaxB2elVpBu358I
         y9V65gsu64N7Cc24bt0+aQP01d8cHax8YYqcf/804NEJS682r33nVTun3IzckaFiUxfZ
         JDDA==
X-Gm-Message-State: AOAM532odPkcAlJIegISzj2VqF2JYG/u1AAMlNdyoRJZJuvhrcwDMGQq
        269OHb4ibB6o9lo5bB6Bfj9vTg==
X-Google-Smtp-Source: ABdhPJw5fiXrYg6XFsz6ecwEgxwq7z/esROLzrbzW4lT5S5U/hicJMRrC2ul4ToyRSFemZY81zVUdw==
X-Received: by 2002:a17:902:eb13:: with SMTP id l19mr4435618plb.213.1591303220772;
        Thu, 04 Jun 2020 13:40:20 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id nk15sm5068526pjb.57.2020.06.04.13.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 13:40:20 -0700 (PDT)
Date:   Thu, 04 Jun 2020 13:40:20 -0700 (PDT)
X-Google-Original-Date: Thu, 04 Jun 2020 13:28:33 PDT (-0700)
Subject:     Re: [PATCH 3/5] clocksource/drivers/timer-riscv: Remove MMIO related stuff
In-Reply-To: <20200521134544.816918-4-anup.patel@wdc.com>
CC:     Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
        robh+dt@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
        Damien Le Moal <Damien.LeMoal@wdc.com>,
        Atish Patra <Atish.Patra@wdc.com>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        anup@brainfault.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Anup Patel <Anup.Patel@wdc.com>
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-c95851de-d021-4272-aa99-6e9b492091ea@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 21 May 2020 06:45:42 PDT (-0700), Anup Patel wrote:
> Right now the RISC-V timer is convoluted to support:
> 1. Linux RISC-V S-mode (with MMU) where it will use TIME CSR
>    for clocksource and SBI timer calls for clockevent device.
> 2. Linux RISC-V M-mode (without MMU) where it will use CLINT
>    MMIO counter register for clocksource and CLINT MMIO compare
>    register for clockevent device.
>
> This patch removes MMIO related stuff from RISC-V timer driver
> so that we can have a separate CLINT timer driver.

This one will also break bisecting for the K210.

>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/Kconfig                |  2 +-
>  arch/riscv/include/asm/timex.h    | 28 +++++++---------------------
>  drivers/clocksource/Kconfig       |  2 +-
>  drivers/clocksource/timer-riscv.c | 17 ++---------------
>  4 files changed, 11 insertions(+), 38 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 2cf0c83c1a47..bbdc37a78f7b 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -52,7 +52,7 @@ config RISCV
>  	select PCI_DOMAINS_GENERIC if PCI
>  	select PCI_MSI if PCI
>  	select RISCV_INTC
> -	select RISCV_TIMER
> +	select RISCV_TIMER if RISCV_SBI
>  	select GENERIC_IRQ_MULTI_HANDLER
>  	select GENERIC_ARCH_TOPOLOGY if SMP
>  	select ARCH_HAS_PTE_SPECIAL
> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> index bad2a7c2cda5..a3fb85d505d4 100644
> --- a/arch/riscv/include/asm/timex.h
> +++ b/arch/riscv/include/asm/timex.h
> @@ -7,41 +7,27 @@
>  #define _ASM_RISCV_TIMEX_H
>
>  #include <asm/csr.h>
> -#include <asm/mmio.h>
>
>  typedef unsigned long cycles_t;
>
> -extern u64 __iomem *riscv_time_val;
> -extern u64 __iomem *riscv_time_cmp;
> -
> -#ifdef CONFIG_64BIT
> -#define mmio_get_cycles()	readq_relaxed(riscv_time_val)
> -#else
> -#define mmio_get_cycles()	readl_relaxed(riscv_time_val)
> -#define mmio_get_cycles_hi()	readl_relaxed(((u32 *)riscv_time_val) + 1)
> -#endif
> -
>  static inline cycles_t get_cycles(void)
>  {
> -	if (IS_ENABLED(CONFIG_RISCV_SBI))
> -		return csr_read(CSR_TIME);
> -	return mmio_get_cycles();
> +	return csr_read(CSR_TIME);
>  }
>  #define get_cycles get_cycles
>
> +static inline u32 get_cycles_hi(void)
> +{
> +	return csr_read(CSR_TIMEH);
> +}
> +#define get_cycles_hi get_cycles_hi
> +
>  #ifdef CONFIG_64BIT
>  static inline u64 get_cycles64(void)
>  {
>  	return get_cycles();
>  }
>  #else /* CONFIG_64BIT */
> -static inline u32 get_cycles_hi(void)
> -{
> -	if (IS_ENABLED(CONFIG_RISCV_SBI))
> -		return csr_read(CSR_TIMEH);
> -	return mmio_get_cycles_hi();
> -}
> -
>  static inline u64 get_cycles64(void)
>  {
>  	u32 hi, lo;
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index f2142e6bbea3..21950d9e3e9d 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -650,7 +650,7 @@ config ATCPIT100_TIMER
>
>  config RISCV_TIMER
>  	bool "Timer for the RISC-V platform"
> -	depends on GENERIC_SCHED_CLOCK && RISCV
> +	depends on GENERIC_SCHED_CLOCK && RISCV_SBI
>  	default y
>  	select TIMER_PROBE
>  	select TIMER_OF
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index 5fb7c5ba5c91..3e7e0cf5b899 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -19,26 +19,13 @@
>  #include <linux/of_irq.h>
>  #include <asm/smp.h>
>  #include <asm/sbi.h>
> -
> -u64 __iomem *riscv_time_cmp;
> -u64 __iomem *riscv_time_val;
> -
> -static inline void mmio_set_timer(u64 val)
> -{
> -	void __iomem *r;
> -
> -	r = riscv_time_cmp + cpuid_to_hartid_map(smp_processor_id());
> -	writeq_relaxed(val, r);
> -}
> +#include <asm/timex.h>
>
>  static int riscv_clock_next_event(unsigned long delta,
>  		struct clock_event_device *ce)
>  {
>  	csr_set(CSR_IE, IE_TIE);
> -	if (IS_ENABLED(CONFIG_RISCV_SBI))
> -		sbi_set_timer(get_cycles64() + delta);
> -	else
> -		mmio_set_timer(get_cycles64() + delta);
> +	sbi_set_timer(get_cycles64() + delta);
>  	return 0;
>  }
