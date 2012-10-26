From: Lucas Stach <dev@lynxeye.de>
Subject: Re: [PATCH 09/14] fdt: Add polarity-aware gpio functions
 to fdtdec
Date: Fri, 26 Oct 2012 09:17:22 +0200
Message-ID: <1351235842.20572.10.camel@tellur>
References: <1351218671-15228-1-git-send-email-sjg@chromium.org>
	<1351218671-15228-10-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1351218671-15228-10-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: Tom Rini <trini@ti.com>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Sean Paul <seanpaul@chromium.org>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 25.10.2012, 19:31 -0700 schrieb Simon Glass:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Add get and set gpio functions to fdtdec that take into account the
> polarity field in fdtdec_gpio_state.flags.
> 
In another thread Stephen Warren and I came to the conclusion that we
most likely should remove this polarity flag from the GPIO bindings.

Currently it is only for the USB VBUS GPIO which should move over to
regulators once they land in U-Boot. Do you have any other applications
for this flag, so we might reconsider removing it?

> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>  include/fdtdec.h |   16 ++++++++++++++++
>  lib/fdtdec.c     |   20 ++++++++++++++++++++
>  2 files changed, 36 insertions(+), 0 deletions(-)
> 
> diff --git a/include/fdtdec.h b/include/fdtdec.h
> index 12f73a7..17daa99 100644
> --- a/include/fdtdec.h
> +++ b/include/fdtdec.h
> @@ -90,6 +90,22 @@ struct fdt_gpio_state {
>  #define fdt_gpio_isvalid(x) ((x)->gpio != FDT_GPIO_NONE)
>  
>  /**
> + * Read the GPIO taking into account the polarity of the pin.
> + *
> + * @param gpio		pointer to the decoded gpio
> + * @return value of the gpio if successful, < 0 if unsuccessful
> + */
> +int fdtdec_get_gpio(struct fdt_gpio_state *gpio);
> +
> +/**
> + * Write the GPIO taking into account the polarity of the pin.
> + *
> + * @param gpio		pointer to the decoded gpio
> + * @return 0 if successful
> + */
> +int fdtdec_set_gpio(struct fdt_gpio_state *gpio, int val);
> +
> +/**
>   * Find the next numbered alias for a peripheral. This is used to enumerate
>   * all the peripherals of a certain type.
>   *
> diff --git a/lib/fdtdec.c b/lib/fdtdec.c
> index 6c417d2..91ba558 100644
> --- a/lib/fdtdec.c
> +++ b/lib/fdtdec.c
> @@ -487,6 +487,26 @@ int fdtdec_decode_gpio(const void *blob, int node, const char *prop_name,
>  	return err == 1 ? 0 : err;
>  }
>  
> +int fdtdec_get_gpio(struct fdt_gpio_state *gpio)
> +{
> +	int val;
> +
> +	if (!fdt_gpio_isvalid(gpio))
> +		return -1;
> +
> +	val = gpio_get_value(gpio->gpio);
> +	return gpio->flags & FDT_GPIO_ACTIVE_LOW ? val ^ 1 : val;
> +}
> +
> +int fdtdec_set_gpio(struct fdt_gpio_state *gpio, int val)
> +{
> +	if (!fdt_gpio_isvalid(gpio))
> +		return -1;
> +
> +	val = gpio->flags & FDT_GPIO_ACTIVE_LOW ? val ^ 1 : val;
> +	return gpio_set_value(gpio->gpio, val);
> +}
> +
>  int fdtdec_setup_gpio(struct fdt_gpio_state *gpio)
>  {
>  	/*
