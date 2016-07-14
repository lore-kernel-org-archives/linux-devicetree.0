From: Wan Zongshun <vw@iommu.org>
Subject: Re: [PATCH v2 02/10] irqchip: add irqchip driver for nuc900
Date: Thu, 14 Jul 2016 16:52:29 +0800
Message-ID: <578752CD.3010408@iommu.org>
References: <1468135649-19980-1-git-send-email-vw@iommu.org>
 <1761342.TGgYi16yul@wuerfel> <5784968A.7080007@iommu.org>
 <5434334.4rKzx80y6W@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5434334.4rKzx80y6W@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, Wan Zongshun <mcuos.com@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, p.zabel@pengutronix.de, Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 2016=E5=B9=B407=E6=9C=8812=E6=97=A5 16:26, Arnd Bergmann wrote:
> On Tuesday, July 12, 2016 3:04:42 PM CEST Wan Zongshun wrote:
>>>
>>> Ideally, this should just go away once we use SPARSE_IRQ.
>>
>> This platform also can use SPARSE_IRQ? this just a simple irq map an=
d no
>> more irq number in this Soc.
>>
>
> SPARSE_IRQ is implied by ARCH_MULTIPLATFORM, so we will have to
> use it once that gets enabled.
>
> Your new irqchip driver already handles IRQ domains, so it will
> work out of the box with SPARSE_IRQ, but you have to change the
> reference to "NR_IRQS" into something else.
>
> I've prototyped a patch series to enable ARCH_MULTIPLATFORM,
> I hope you can start working from what I have and get it to run.

I go through the ARCH_MULTIPLATFORM and SPARSE_IRQ related codes, but I=
=20
find I also have to define the NUC900_NR_IRQS firstly like below, so=20
that I can init the .nr_irq.

+#if !defined(CONFIG_SOC_NUC970)
  #define NUC900_NR_IRQS		(IRQ_ADC+1)
+#else
+#define NUC900_NR_IRQS		62
+#endif

  DT_MACHINE_START(nuc900_dt, "Nuvoton NUC900 (Device Tree Support)")
         .dt_compat      =3D nuc900_dt_compat,
+       .nr_irqs        =3D NUC900_NR_IRQS,
  MACHINE_END

and then in my irqchip driver, I will use the NUC900_NR_IRQS:

+aic_domain =3D irq_domain_add_linear(node, NUC900_NR_IRQS,
+				    &aic_irq_domain_ops, NULL);


Is that a right usage?

>
> 	Arnd
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
>
