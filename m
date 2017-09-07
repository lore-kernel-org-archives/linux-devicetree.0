From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v4 3/6] irqdomain: move IRQ_DOMAIN_NAME_ALLOCATED define
 to the original position
Date: Thu, 7 Sep 2017 13:04:41 +0100
Message-ID: <92500143-814b-b255-bb7b-c36d5eca5457@arm.com>
References: <1504784522-26841-1-git-send-email-yamada.masahiro@socionext.com>
 <1504784522-26841-4-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1504784522-26841-4-git-send-email-yamada.masahiro@socionext.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Masami Hiramatsu <mhiramat@kernel.org>, David Daney <david.daney@cavium.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/09/17 12:41, Masahiro Yamada wrote:
> Commit 6a6544e520ab ("genirq/irqdomain: Remove auto-recursive hierarchy
> support") not only deleted IRQ_DOMAIN_FLAG_AUTO_RECURSIVE, but also
> moved IRQ_DOMAIN_NAME_ALLOCATED up.
> 
> Get it back to the original position to sort the enum by the bit shift.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v4:
>   - Newly added
> 
> 
>  include/linux/irqdomain.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
> index 81e4889..31be32d 100644
> --- a/include/linux/irqdomain.h
> +++ b/include/linux/irqdomain.h
> @@ -180,9 +180,6 @@ enum {
>  	/* Irq domain is hierarchical */
>  	IRQ_DOMAIN_FLAG_HIERARCHY	= (1 << 0),
>  
> -	/* Irq domain name was allocated in __irq_domain_add() */
> -	IRQ_DOMAIN_NAME_ALLOCATED	= (1 << 6),
> -
>  	/* Irq domain is an IPI domain with virq per cpu */
>  	IRQ_DOMAIN_FLAG_IPI_PER_CPU	= (1 << 2),
>  
> @@ -195,6 +192,9 @@ enum {
>  	/* Irq domain implements MSI remapping */
>  	IRQ_DOMAIN_FLAG_MSI_REMAP	= (1 << 5),
>  
> +	/* Irq domain name was allocated in __irq_domain_add() */
> +	IRQ_DOMAIN_NAME_ALLOCATED	= (1 << 6),
> +

The right fix would be to leave it where it is, but to actually fix the
shift, which is what I should have done the first place.

	M.
-- 
Jazz is not dead. It just smells funny...
