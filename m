From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] irqchip/imx-gpcv2: Add power domain support
Date: Wed, 1 Feb 2017 07:29:57 -0600
Message-ID: <20170201132957.z6caikzuh2ai4wcl@rob-hp-laptop>
References: <20170126220504.4796-1-andrew.smirnov@gmail.com>
 <20170126220504.4796-4-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170126220504.4796-4-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 26, 2017 at 02:05:04PM -0800, Andrey Smirnov wrote:
> Add code allowing for control of various power domains managed by GPCv2
> IP block found in i.MX7 series of SoCs. Power domains covered by this
> patch are:
> 
>       - PCIE PHY
>       - MIPI PHY
>       - USB HSIC PHY
>       - USB OTG1/2 PHY
> 
> Support for any other power domain controlled by GPC is not present, and
> can be added at some later point.
> 
> Testing of this code was done against a PCIe driver.
> 
> Cc: yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/power/fsl,imx-gpcv2.txt    |  63 +++++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/irqchip/irq-imx-gpcv2.c                    | 263 ++++++++++++++++++++-
>  include/dt-bindings/power/imx7-power.h             |  18 ++
>  3 files changed, 343 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt
>  create mode 100644 include/dt-bindings/power/imx7-power.h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
