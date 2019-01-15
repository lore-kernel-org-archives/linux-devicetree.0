From: Nishanth Menon <nm@ti.com>
Subject: Re: [RFC PATCH v4 13/13] soc: ti: am6: Enable interrupt controller
 drivers
Date: Tue, 15 Jan 2019 07:54:57 -0600
Message-ID: <20190115135457.2x6huvgtth2yjhhq@kahuna>
References: <20181227060829.5080-1-lokeshvutla@ti.com>
 <20181227061313.5451-1-lokeshvutla@ti.com>
 <20181227061313.5451-13-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181227061313.5451-13-lokeshvutla@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>
Cc: marc.zyngier@arm.com, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-Id: devicetree@vger.kernel.org

On 11:43-20181227, Lokesh Vutla wrote:
> Select all the TISCI dependent interrupt controller drivers
> for AM6 SoC.
> 
> Suggested-by: Marc Zyngier <marc.zyngier@arm.com>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>  drivers/soc/ti/Kconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
> index 7640490c2a6a..145b701a3d96 100644
> --- a/drivers/soc/ti/Kconfig
> +++ b/drivers/soc/ti/Kconfig
> @@ -5,6 +5,11 @@ if ARCH_K3
>  
>  config ARCH_K3_AM6_SOC
>  	bool "K3 AM6 SoC"
> +	select MAILBOX
> +	select TI_MESSAGE_MANAGER
> +	select TI_SCI_PROTOCOL
> +	select TI_SCI_INTR_IRQCHIP
> +	select TI_SCI_INTA_IRQCHIP

Sorry for joining the party late.. but just 2 cents for thought..

Is'nt imply better than select here? for a very tiny kernel, it is
possible to boot kernel up and TISCI and mailbox could be modules as
well.. I know it is a theoretical concept, but it may be helpful (esp
during pre-silicon time frame, at least during start, I usually start
with almost everything other than the CPU cores and PSCI disabled).
there is not much you can do with it ofcourse, but it helps me with a
clean start.


>  	help
>  	  Enable support for TI's AM6 SoC Family support
>  
> -- 
> 2.19.2
> 

-- 
Regards,
Nishanth Menon
