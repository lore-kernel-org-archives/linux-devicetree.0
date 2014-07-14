From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/4 V3] irqchip: gic: Add binding probe for ARM GIC400
Date: Mon, 14 Jul 2014 16:03:15 +0200
Message-ID: <2932284.F1eaAf8ArJ@diego>
References: <1404947104-21345-1-git-send-email-suravee.suthikulpanit@amd.com> <1404947104-21345-2-git-send-email-suravee.suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1404947104-21345-2-git-send-email-suravee.suthikulpanit@amd.com>
Sender: linux-doc-owner@vger.kernel.org
To: suravee.suthikulpanit@amd.com, jason@lakedaemon.net
Cc: linux-arm-kernel@lists.infradead.org, marc.zyngier@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, linux-doc@vger.kernel.org, Catalin.Marinas@arm.com, Harish.Kasiviswanathan@amd.com, linux-kernel@vger.kernel.org, Will.Deacon@arm.com, Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>, linux-pci@vger.kernel.org, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 9. Juli 2014, 18:05:01 schrieb suravee.suthikulpanit@amd.com:
> From: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
> 
> Add new Irqchip declaration for GIC400. This was mentioned in
> gic binding documentation, but there is not code to support it.
> 
> Signed-off-by: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>

The Rockchip RK3288 also contains a GIC400, so I would be very happy if 
someone could pick up this one patch independently of the rest.

But in light of Matthias' cortex-a7-gic patch from last week, this one might 
need an update.


> ---
>  drivers/irqchip/irq-gic.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
> index 508b815..ac8f7ea 100644
> --- a/drivers/irqchip/irq-gic.c
> +++ b/drivers/irqchip/irq-gic.c
> @@ -1020,6 +1020,8 @@ gic_of_init(struct device_node *node, struct
> device_node *parent) gic_cnt++;
>  	return 0;
>  }
> +

also it looks like the omission of the blank line in the original file is 
intentional, so I'd guess it shouldn't be added here.


> +IRQCHIP_DECLARE(arm_gic_400, "arm,gic-400", gic_of_init);
>  IRQCHIP_DECLARE(cortex_a15_gic, "arm,cortex-a15-gic", gic_of_init);
>  IRQCHIP_DECLARE(cortex_a9_gic, "arm,cortex-a9-gic", gic_of_init);
>  IRQCHIP_DECLARE(msm_8660_qgic, "qcom,msm-8660-qgic", gic_of_init);


Thanks
Heiko

