From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v2 3/6] ARM: at91/gpio: add DT support
Date: Wed, 4 Jan 2012 22:04:32 +0000
Message-ID: <20120104220432.GJ11810@n2100.arm.linux.org.uk>
References: <876f676ec80d2db927e379654be76171ca496422.1323975517.git.nicolas.ferre@atmel.com>
 <1325615688-16860-1-git-send-email-nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1325615688-16860-1-git-send-email-nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 03, 2012 at 07:34:48PM +0100, Nicolas Ferre wrote:
> +	at91_gpio->clock = clk_get_sys(NULL, at91_gpio->chip.label);
> +	if (!at91_gpio->clock) {
> +		pr_err("at91_gpio.%d, failed to get clock, ignoring.\n",
> +								alias_id);
> +		goto ioremap_err;
> +	}
> +
> +	/* enable PIO controller's clock */
> +	if(clk_enable(at91_gpio->clock)) {
> +		pr_err("at91_gpio.%d, failed to enable clock, ignoring.\n",
> +								alias_id);
> +		goto clk_err;
> +	}

No new code should be added to the kernel which uses clk_enable() without
using clk_prepare() first.  Ditto clk_disable() and clk_unprepare().

> +	at91_gpio->clock = clk_get_sys(NULL, at91_gpio->chip.label);
> +	if (!at91_gpio->clock) {
> +		pr_err("at91_gpio.%d, failed to get clock, ignoring.\n", i);
> +		goto ioremap_err;
> +	}
> +
> +	if(clk_enable(at91_gpio->clock)) {
> +		pr_err("at91_gpio.%d, failed to enable clock, ignoring.\n", i);
> +		goto clk_err;
> +	}

I've seen this code somewhere before...  Couldn't this be separated out into
a helper function?
