From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC PATCH 2/5] mcu_mpc8349emitx: port to new of gpio interface
Date: Wed, 9 Dec 2009 15:16:37 -0600
Message-ID: <6C061449-ACBE-4C51-9101-007DFD285F55@kernel.crashing.org>
References: <1258472546-31343-1-git-send-email-dbaryshkov@gmail.com>
	<1258472546-31343-3-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1077)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1258472546-31343-3-git-send-email-dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linuxppc-dev Development <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Nov 17, 2009, at 9:42 AM, Dmitry Eremin-Solenikov wrote:

> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c |   11 +++++------
> 1 files changed, 5 insertions(+), 6 deletions(-)

Minding reviewing for me.

- k

> 
> diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> index 82a9bcb..4ba8b16 100644
> --- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> +++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> @@ -36,7 +36,7 @@ struct mcu {
> 	struct mutex lock;
> 	struct device_node *np;
> 	struct i2c_client *client;
> -	struct of_gpio_chip of_gc;
> +	struct gpio_chip gc;
> 	u8 reg_ctrl;
> };
> 
> @@ -55,8 +55,7 @@ static void mcu_power_off(void)
> 
> static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> {
> -	struct of_gpio_chip *of_gc = to_of_gpio_chip(gc);
> -	struct mcu *mcu = container_of(of_gc, struct mcu, of_gc);
> +	struct mcu *mcu = container_of(gc, struct mcu, gc);
> 	u8 bit = 1 << (4 + gpio);
> 
> 	mutex_lock(&mcu->lock);
> @@ -78,8 +77,8 @@ static int mcu_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
> static int mcu_gpiochip_add(struct mcu *mcu)
> {
> 	struct device_node *np;
> -	struct of_gpio_chip *of_gc = &mcu->of_gc;
> -	struct gpio_chip *gc = &of_gc->gc;
> +	struct gpio_chip *gc = &mcu->gc;
> +	struct of_gpio_chip *of_gc = &gc->of_gc;
> 	int ret;
> 
> 	np = of_find_compatible_node(NULL, NULL, "fsl,mcu-mpc8349emitx");
> @@ -113,7 +112,7 @@ static int mcu_gpiochip_remove(struct mcu *mcu)
> {
> 	int ret;
> 
> -	ret = gpiochip_remove(&mcu->of_gc.gc);
> +	ret = gpiochip_remove(&mcu->gc);
> 	if (ret)
> 		return ret;
> 	of_node_put(mcu->np);
> -- 
> 1.6.5
> 
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/linuxppc-dev
