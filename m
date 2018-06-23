From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 3/3] irqchip: RISC-V Local Interrupt Controller Driver
Date: Fri, 22 Jun 2018 17:08:58 -0700
Message-ID: <1d55b6ee-2fa4-269b-4166-ffd36646f61f@infradead.org>
References: <20180622232006.12158-1-palmer@sifive.com>
 <20180622232006.12158-4-palmer@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180622232006.12158-4-palmer@sifive.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Palmer Dabbelt <palmer@sifive.com>, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, Michael Clark <mjc@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, shorne@gmail.com, linux-riscv@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 06/22/2018 04:20 PM, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@dabbelt.com>
> 
> This patch adds a driver that manages the local interrupts on each
> RISC-V hart, as specifiec by the RISC-V supervisor level ISA manual.
> The local interrupt controller manages software interrupts, timer
> interrupts, and hardware interrupts (which are routed via the
> platform level interrupt controller).  Per-hart local interrupt
> controllers are found on all RISC-V systems.
> 
> CC: Michael Clark <mjc@sifive.com>
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  drivers/irqchip/Kconfig          |  13 +++
>  drivers/irqchip/Makefile         |   1 +
>  drivers/irqchip/irq-riscv-intc.c | 215 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 229 insertions(+)
>  create mode 100644 drivers/irqchip/irq-riscv-intc.c
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index e9233db16e03..bf7fc86673b1 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -372,3 +372,16 @@ config QCOM_PDC
>  	  IRQs for Qualcomm Technologies Inc (QTI) mobile chips.
>  
>  endmenu
> +
> +config RISCV_INTC
> +	#bool "RISC-V Interrupt Controller"

Hi,
What does the leading '#' do?


> +	depends on RISCV
> +	default y
> +	help
> +	   This enables support for the local interrupt controller found in
> +	   standard RISC-V systems.  The local interrupt controller handles
> +	   timer interrupts, software interrupts, and hardware interrupts.
> +	   Without a local interrupt controller the system will be unable to
> +	   handle any interrupts, including those passed via the PLIC.
> +
> +	   If you don't know what to do here, say Y.
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 15f268f646bf..74e333cc274c 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -87,3 +87,4 @@ obj-$(CONFIG_MESON_IRQ_GPIO)		+= irq-meson-gpio.o
>  obj-$(CONFIG_GOLDFISH_PIC) 		+= irq-goldfish-pic.o
>  obj-$(CONFIG_NDS32)			+= irq-ativic32.o
>  obj-$(CONFIG_QCOM_PDC)			+= qcom-pdc.o
> +obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o


-- 
~Randy
