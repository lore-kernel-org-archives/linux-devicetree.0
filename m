From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [RFC PATCH 1/4] pinctrl: at91: fix typos
Date: Sat, 14 Sep 2013 18:45:23 +0200
Message-ID: <20130914164523.GC11420@ns203013.ovh.net>
References: <1379058213-3245-1-git-send-email-b.brezillon@overkiz.com>
 <1379058333-3286-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1379058333-3286-1-git-send-email-b.brezillon@overkiz.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Boris BREZILLON <b.brezillon@overkiz.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Richard Genoud <richard.genoud@gmail.com>, Jiri Kosina <jkosina@suse.cz>, Linus Walleij <linus.walleij@linaro.org>, linux-doc@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 09:45 Fri 13 Sep     , Boris BREZILLON wrote:
> Fix AT91_PINCTRL_DEBOUNCE_VAL dt macro typo.
> Fix at91_pinctrl_mux_ops callback typos.
> 
Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
> ---
>  drivers/pinctrl/pinctrl-at91.c     |    6 +++---
>  include/dt-bindings/pinctrl/at91.h |    2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
> index 19afb9a..50b555a 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -144,11 +144,11 @@ struct at91_pinctrl_mux_ops {
>  	void (*mux_C_periph)(void __iomem *pio, unsigned mask);
>  	void (*mux_D_periph)(void __iomem *pio, unsigned mask);
>  	bool (*get_deglitch)(void __iomem *pio, unsigned pin);
> -	void (*set_deglitch)(void __iomem *pio, unsigned mask, bool in_on);
> +	void (*set_deglitch)(void __iomem *pio, unsigned mask, bool is_on);
>  	bool (*get_debounce)(void __iomem *pio, unsigned pin, u32 *div);
> -	void (*set_debounce)(void __iomem *pio, unsigned mask, bool in_on, u32 div);
> +	void (*set_debounce)(void __iomem *pio, unsigned mask, bool is_on, u32 div);
>  	bool (*get_pulldown)(void __iomem *pio, unsigned pin);
> -	void (*set_pulldown)(void __iomem *pio, unsigned mask, bool in_on);
> +	void (*set_pulldown)(void __iomem *pio, unsigned mask, bool is_on);
>  	bool (*get_schmitt_trig)(void __iomem *pio, unsigned pin);
>  	void (*disable_schmitt_trig)(void __iomem *pio, unsigned mask);
>  	/* irq */
> diff --git a/include/dt-bindings/pinctrl/at91.h b/include/dt-bindings/pinctrl/at91.h
> index d7988b4..0fee6ff 100644
> --- a/include/dt-bindings/pinctrl/at91.h
> +++ b/include/dt-bindings/pinctrl/at91.h
> @@ -16,7 +16,7 @@
>  #define AT91_PINCTRL_PULL_DOWN		(1 << 3)
>  #define AT91_PINCTRL_DIS_SCHMIT		(1 << 4)
>  #define AT91_PINCTRL_DEBOUNCE		(1 << 16)
> -#define AT91_PINCTRL_DEBOUNCE_VA(x)	(x << 17)
> +#define AT91_PINCTRL_DEBOUNCE_VAL(x)	(x << 17)
>  
>  #define AT91_PINCTRL_PULL_UP_DEGLITCH	(AT91_PINCTRL_PULL_UP | AT91_PINCTRL_DEGLITCH)
>  
> -- 
> 1.7.9.5
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
