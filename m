From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2 2/5] RISC-V: Add riscv_isa reprensenting ISA features
 common across CPUs
Date: Tue, 30 Jul 2019 21:23:18 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1907302117420.15340@viisi.sifive.com>
References: <20190731012418.24565-1-atish.patra@wdc.com> <20190731012418.24565-3-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731012418.24565-3-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexios Zavras <alexios.zavras@intel.com>, Allison Randal <allison@lohutok.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, Enrico Weigelt <info@metux.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, 30 Jul 2019, Atish Patra wrote:

> From: Anup Patel <anup.patel@wdc.com>
> 
> This patch adds riscv_isa integer to represent ISA features common
> across all CPUs. The riscv_isa is not same as elf_hwcap because
> elf_hwcap will only have ISA features relevant for user-space apps
> whereas riscv_isa will have ISA features relevant to both kernel
> and user-space apps.
> 
> One of the use case is KVM hypervisor where riscv_isa will be used
> to do following operations:
> 
> 1. Check whether hypervisor extension is available
> 2. Find ISA features that need to be virtualized (e.g. floating
>    point support, vector extension, etc.)
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 25 +++++++++++++++++++++
>  arch/riscv/kernel/cpufeature.c | 41 +++++++++++++++++++++++++++++++---
>  2 files changed, 63 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 7ecb7c6a57b1..e069f60ad5d2 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -22,5 +22,30 @@ enum {
>  };
>  
>  extern unsigned long elf_hwcap;
> +
> +#define RISCV_ISA_EXT_A		(1UL << ('A' - 'A'))

Are these uppercase variants still needed if we define the ISA string to 
be all lowercase, per our recent discussion?

> +#define RISCV_ISA_EXT_a		RISCV_ISA_EXT_A
> +#define RISCV_ISA_EXT_C		(1UL << ('C' - 'A'))
> +#define RISCV_ISA_EXT_c		RISCV_ISA_EXT_C
> +#define RISCV_ISA_EXT_D		(1UL << ('D' - 'A'))
> +#define RISCV_ISA_EXT_d		RISCV_ISA_EXT_D
> +#define RISCV_ISA_EXT_F		(1UL << ('F' - 'A'))
> +#define RISCV_ISA_EXT_f		RISCV_ISA_EXT_F
> +#define RISCV_ISA_EXT_H		(1UL << ('H' - 'A'))
> +#define RISCV_ISA_EXT_h		RISCV_ISA_EXT_H
> +#define RISCV_ISA_EXT_I		(1UL << ('I' - 'A'))
> +#define RISCV_ISA_EXT_i		RISCV_ISA_EXT_I
> +#define RISCV_ISA_EXT_M		(1UL << ('M' - 'A'))
> +#define RISCV_ISA_EXT_m		RISCV_ISA_EXT_M
> +#define RISCV_ISA_EXT_S		(1UL << ('S' - 'A'))
> +#define RISCV_ISA_EXT_s		RISCV_ISA_EXT_S
> +#define RISCV_ISA_EXT_U		(1UL << ('U' - 'A'))
> +#define RISCV_ISA_EXT_u		RISCV_ISA_EXT_U
> +
> +extern unsigned long riscv_isa;
> +
> +#define riscv_isa_extension_available(ext_char)	\
> +		(riscv_isa & RISCV_ISA_EXT_##ext_char)
> +
>  #endif
>  #endif
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index b1ade9a49347..177529d48d87 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c

[ ... ]

> @@ -43,8 +49,22 @@ void riscv_fill_hwcap(void)
>  			continue;
>  		}
>  
> -		for (i = 0; i < strlen(isa); ++i)
> +		i = 0;
> +		isa_len = strlen(isa);
> +#if defined(CONFIG_32BIT)
> +		if (strncasecmp(isa, "rv32", 4) != 0)

strcmp()?

> +			i += 4;
> +#elif defined(CONFIG_64BIT)
> +		if (strncasecmp(isa, "rv64", 4) != 0)

And again here?

> +			i += 4;
> +#endif
> +		for (; i < isa_len; ++i) {
>  			this_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
> +			if ('a' <= isa[i] && isa[i] <= 'z')
> +				this_isa |= (1UL << (isa[i] - 'a'));
> +			if ('A' <= isa[i] && isa[i] <= 'Z')
> +				this_isa |= (1UL << (isa[i] - 'A'));

Are these uppercase variants still needed?


- Paul
