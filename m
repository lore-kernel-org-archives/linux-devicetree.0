From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] mfd: cottula: add cottula board
Date: Mon, 15 Dec 2014 17:01:14 +0100
Message-ID: <2126713.SdhEsThCG0@wuerfel>
References: <1418598606-21352-1-git-send-email-robert.jarzmik@free.fr> <4307800.p21Sk5E3dV@wuerfel> <877fxsapds.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <877fxsapds.fsf@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday 15 December 2014 16:45:03 Robert Jarzmik wrote:
> Arnd Bergmann <arnd@arndb.de> writes:
> 
> > On Monday 15 December 2014 00:10:06 Robert Jarzmik wrote:
> >> +
> >> +       platform_set_drvdata(pdev, cot);
> >> +       cot->gpio0 = gpiod_get(&pdev->dev, "lubbock_irq", 0);
> >> +       if (IS_ERR(cot->gpio0)) {
> >> +               dev_err(&pdev->dev, "Couldn't request GPIO : ret = %d\n", ret);
> >> +               return PTR_ERR(cot->gpio0);
> >> +       }
> >> +       cot->irq = gpiod_to_irq(cot->gpio0);
> >> +       if (cot->irq < 0)
> >> +               return cot->irq;
> >> +
> >> +       cot->irqdomain =
> >> +               irq_domain_add_linear(pdev->dev.of_node, COTTULA_NB_IRQ,
> >> +                                     &cottula_irq_domain_ops, cot);
> >> +       if (!cot->irqdomain)
> >> +               return -ENODEV;
> >> +
> >> +       ret = 0;
> >> +       if (base_irq)
> >> +               ret = irq_create_strict_mappings(cot->irqdomain, base_irq, 0,
> >> +                                                COTTULA_NB_IRQ);
> >> 
> >
> > This looks a bit ambiguous: You get a GPIO line for the purpose of the
> > IRQ nesting but don't use the GPIO otherwise, and you pass the device's
> > own irq domain start as an IORESOURCE_IRQ resource.
> >
> > For consistency between DT and ATAGS based uses, and with similar DT
> > based drivers, I would instead recommend passing the parent irq (from
> > the GPIO) as an IORESOURCE_IRQ resource instead of a gpio lookup,
> > and passing the base_irq as platform_data for the ATAGS case.
> 
> I understand Arnd, yet I wanted to avoid any platform data if possible, as this
> is a motherboard, it will not be plugged anywhere else with different
> parameters.
> 
> What would you say if I did this :
>  - remove the gpio
>  - use IORESOURCE_IRQ(0) as the parent irq (as you suggested)
>  - use IORESOURCE_IRQ(1) as the base_irq
>    => this resource would be optional
>         - if exists, use it as base_irq
>         - if doesn't exist, let base_irq = 0
> 
> Will that look correct ?

I'd still prefer the platform data, but this seems good enough and I
see no serious problems with it.

	Arnd
