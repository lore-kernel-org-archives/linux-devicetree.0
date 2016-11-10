From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Subject: Re: [PATCH] of/irq: improve error message on irq discovery process
 failure
Date: Fri, 11 Nov 2016 08:28:32 +1100
Message-ID: <1478813312.2592.0.camel@au1.ibm.com>
References: <1478700308-25481-1-git-send-email-gpiccoli@linux.vnet.ibm.com>
Reply-To: benh@au1.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1478700308-25481-1-git-send-email-gpiccoli@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>, devicetree@vger.kernel.org
Cc: linux-pci@vger.kernel.org, robh+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, 2016-11-09 at 12:05 -0200, Guilherme G. Piccoli wrote:
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 393fea8..1ad6882 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -275,7 +275,10 @@ int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq)
>         of_node_put(ipar);
>         of_node_put(newpar);
>  
> -       return -EINVAL;
> +       /* Positive non-zero return means no Level-triggered Interrupts
> +        * capability was found.
> +        */
> +       return ENOENT;
>  }
>  EXPORT_SYMBOL_GPL(of_irq_parse_raw);

I'm not fan. I'd rather it's -ENOENT and the callers can check for that
specific code rather than playing with the sign.

Cheers,
Ben.
