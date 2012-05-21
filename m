From: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/gpio: add declaration of struct gpio_chip to silence
 warning if CONFIG_OF_GPIO=n && CONFIG_GPIOLIB=n
Date: Mon, 21 May 2012 03:32:58 -0700
Message-ID: <20120521103257.GA9328@lizard>
References: <201205201639.21378.sfking@fdwdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201205201639.21378.sfking-xS0NTnu2YfYAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Steven King <sfking-xS0NTnu2YfYAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, May 20, 2012 at 04:39:21PM -0700, Steven King wrote:
> The stubs for when CONFIG_OF_GPIO =n reference struct gpio_chip.  If
> CONFIG_GPIOLIB=n, the warning 'include/linux/of_gpio.h:83: warning: 'struct
> gpio_chip' declared inside parameter list' is given.  Make it go away.
> 
> Signed-off-by: Steven King <sfking-xS0NTnu2YfYAvxtiuMwx3w@public.gmane.org>
> ---

Hm. We have linux/gpio.h, it should provide 'struct gpio_chip'
stub, so that the code that tries to use generic GPIO would
always work (like of_gpio.h). So, no, this forward-declration
should be provided by linux/gpio.h.

And we do provide it, for GENERIC_GPIO=n case. And it
seems that you have GPIOLIB=n, but GENERIC_GPIO=y? That's
strage. What archictecure is this? Can you tell the exact
kernel version and may be give a config file that you
used to reproduce the warning?

Thanks!

>  include/linux/of_gpio.h |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
> index 81733d1..5b37613 100644
> --- a/include/linux/of_gpio.h
> +++ b/include/linux/of_gpio.h
> @@ -65,6 +65,8 @@ extern int of_gpio_simple_xlate(struct gpio_chip *gc,
>  
>  #else /* CONFIG_OF_GPIO */
>  
> +struct gpio_chip;
> +
>  /* Drivers may not strictly depend on the GPIO support, so let them link. */
>  static inline int of_get_named_gpio_flags(struct device_node *np,
>  		const char *list_name, int index, enum of_gpio_flags *flags)

-- 
Anton Vorontsov
Email: cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
