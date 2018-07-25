From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 2/6] RISC-V: remove INTERRUPT_CAUSE_* defines from asm/irq.h
Date: Wed, 25 Jul 2018 14:44:35 -0700 (PDT)
Message-ID: <mhng-a0410fc4-7f2e-4818-acf0-6a7616ba0010@palmer-si-x1c4>
References: <20180725093649.32332-3-hch@lst.de>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180725093649.32332-3-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, 25 Jul 2018 02:36:45 PDT (-0700), Christoph Hellwig wrote:
> These are only of use to the local irq controller driver, so add them in
> that driver implementation instead, which will be submitted soon.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/include/asm/irq.h | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
> index 4dee9d4c13c0..93eb75eac4ff 100644
> --- a/arch/riscv/include/asm/irq.h
> +++ b/arch/riscv/include/asm/irq.h
> @@ -17,10 +17,6 @@
>
>  #define NR_IRQS         0
>
> -#define INTERRUPT_CAUSE_SOFTWARE    1
> -#define INTERRUPT_CAUSE_TIMER       5
> -#define INTERRUPT_CAUSE_EXTERNAL    9
> -
>  void riscv_timer_interrupt(void);
>
>  #include <asm-generic/irq.h>

Acked-by: Palmer Dabbelt <palmer@sifive.com>
