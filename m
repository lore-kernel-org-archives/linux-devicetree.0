From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 6/6] fixup! irqchip/irq-bcm7038-l1: Add PM support
Date: Fri, 13 Sep 2019 12:13:33 -0700
Message-ID: <307f1531-8960-ce6d-c980-4951479db36d@gmail.com>
References: <20190913191026.8801-1-f.fainelli@gmail.com>
 <20190913191026.8801-7-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190913191026.8801-7-f.fainelli@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <linux-mips@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 9/13/19 12:10 PM, Florian Fainelli wrote:
> ---
>  drivers/irqchip/irq-bcm7038-l1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
> index 5e8f0fbc5f20..811a34201dd4 100644
> --- a/drivers/irqchip/irq-bcm7038-l1.c
> +++ b/drivers/irqchip/irq-bcm7038-l1.c
> @@ -397,7 +397,7 @@ static struct irq_chip bcm7038_l1_irq_chip = {
>  #ifdef CONFIG_SMP
>  	.irq_cpu_offline	= bcm7038_l1_cpu_offline,
>  #endif
> -#if CONFIG_PM_SLEEP
> +#ifdef CONFIG_PM_SLEEP
>  	.irq_set_wake		= bcm7038_l1_set_wake,
>  #endif
>  };
> 

This should have been part of patch #1, I will resubmit this series,
sorry about that.
-- 
Florian
