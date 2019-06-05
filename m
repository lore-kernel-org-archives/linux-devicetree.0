From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/3] irqchip: al-fic: Introduce Amazon's Annapurna Labs
 Fabric Interrupt Controller Driver
Date: Wed, 5 Jun 2019 09:59:27 +0200
Message-ID: <20190605075927.GA9693@kroah.com>
References: <1559717653-11258-1-git-send-email-talel@amazon.com>
 <1559717653-11258-3-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559717653-11258-3-git-send-email-talel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Talel Shenhar <talel@amazon.com>
Cc: nicolas.ferre@microchip.com, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, mchehab+samsung@kernel.org, robh+dt@kernel.org, davem@davemloft.net, shawn.lin@rock-chips.com, tglx@linutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, benh@kernel.crashing.org, jonnyc@amazon.com, hhhawa@amazon.com, ronenk@amazon.com, hanochu@amazon.com, barakw@amazon.com
List-Id: devicetree@vger.kernel.org

On Wed, Jun 05, 2019 at 09:54:12AM +0300, Talel Shenhar wrote:
> --- /dev/null
> +++ b/include/linux/irqchip/al-fic.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/**
> + * Copyright 2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
> + */
> +
> +#ifndef _AL_FIC_H_
> +#define _AL_FIC_H_
> +
> +#include <linux/irqdomain.h>
> +
> +struct al_fic;
> +
> +struct irq_domain *al_fic_wire_get_domain(struct al_fic *fic);
> +
> +struct al_fic *al_fic_wire_init(struct device_node *node,
> +				void __iomem *base,
> +				const char *name,
> +				unsigned int parent_irq);
> +int al_fic_cleanup(struct al_fic *fic);

Who is using these new functions?  We don't add new apis that no one
uses :(

thanks,

greg k-h
