From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v2 0/2] irqchip: Broadcom BCM7120-style Level 2
 interrupt controller
Date: Sun, 14 Sep 2014 02:22:52 -0400
Message-ID: <20140914062252.GL21986@titan.lakedaemon.net>
References: <1410309862-27784-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410309862-27784-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 09, 2014 at 05:44:20PM -0700, Florian Fainelli wrote:
> Hi Jason, Thomas, Mark,
> 
> This patch set adds support for the second type of Level-2 interrupt controller
> found on Broadcom Set Top Box hardware.
> 
> Version 2 should address your previous comments made on the initial submission.
> 
> Thanks!
> 
> Florian Fainelli (2):
>   irqchip: add Broadcom BCM7120-style Level 2 interrupt controller
>   Documentation: bcm7120-l2: Add Broadcom BCM7120-style L2 binding
> 
>  .../interrupt-controller/brcm,bcm7120-l2-intc.txt  |  86 ++++++++
>  drivers/irqchip/Makefile                           |   3 +-
>  drivers/irqchip/irq-bcm7120-l2.c                   | 220 +++++++++++++++++++++
>  3 files changed, 308 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.txt
>  create mode 100644 drivers/irqchip/irq-bcm7120-l2.c

Fixed up one unused variable warning and applied to irqchip/broadcom

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
