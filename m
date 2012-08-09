From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 1/8] of/irq: Create stub for of_irq_find_parent when !CONFIG_OF
Date: Thu, 09 Aug 2012 11:20:54 -0500
Message-ID: <5023E366.9010603@gmail.com>
References: <1344527635-6163-1-git-send-email-lee.jones@linaro.org> <1344527635-6163-2-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1344527635-6163-2-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@stericsson.com, arnd@arndb.de, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, STEricsson_nomadik_linux@list.st.com
List-Id: devicetree@vger.kernel.org

On 08/09/2012 10:53 AM, Lee Jones wrote:
> of_irq_find_parent is a handy function to use outside the confines of
> the Open Firmware subsystem. One such use-case is when the IRQ Domain
> wishes to find an IRQ domain for a given device node. Currently it can
> not take any notice of the 'interrupt-parent' property. Instead it
> just uses the first IRQ controller as it climbs the Device Tree. If
> we were to use this as a precursor the resultant controller is more
> likely to be correct.

Where are you using this? I don't have all the patches in the series.

Rob

> 
> CC: Rob Herring <rob.herring@calxeda.com>
> CC: devicetree-discuss@lists.ozlabs.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  include/linux/of_irq.h |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
> index 1717cd9..b8e2411 100644
> --- a/include/linux/of_irq.h
> +++ b/include/linux/of_irq.h
> @@ -83,6 +83,11 @@ static inline unsigned int irq_of_parse_and_map(struct device_node *dev,
>  {
>  	return 0;
>  }
> +
> +static inline void *of_irq_find_parent(struct device_node *child)
> +{
> +	return NULL;
> +}
>  #endif /* !CONFIG_OF */
>  
>  #endif /* __OF_IRQ_H */
> 
