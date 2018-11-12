Return-Path: <robherring2@gmail.com>
Message-ID: <5bea0e9c.1c69fb81.1f3c8.be5a@mx.google.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH fbdev-for-next 2/2] video: ssd1307fb: Add support for the
 reset-active-low property
References: <1541170556-75032-1-git-send-email-michal.vokac@ysoft.com>
 <1541170556-75032-2-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1541170556-75032-2-git-send-email-michal.vokac@ysoft.com>
Date: Mon, 12 Nov 2018 10:55:53 -0600
To: =?utf-8?B?Vm9rw6HEjQ==?= Michal <Michal.Vokac@ysoft.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Nov 02, 2018 at 02:56:35PM +0000, Vokáč Michal wrote:
> The SSD130x OLED display reset signal is active low. Now the reset
> sequence is implemented in such a way that DTS authors are forced to
> define the reset-gpios property with GPIO_ACTIVE_HIGH to make the reset
> work.
> 
> Add the reset-active-low property so the signal is inverted once again
> and the GPIO_ACTIVE_LOW work as expected.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> ---
>  drivers/video/fbdev/ssd1307fb.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
> index e7ae135..790f1c4 100644
> --- a/drivers/video/fbdev/ssd1307fb.c
> +++ b/drivers/video/fbdev/ssd1307fb.c
> @@ -608,6 +608,7 @@ static int ssd1307fb_probe(struct i2c_client *client,
>  	struct fb_deferred_io *ssd1307fb_defio;
>  	u32 vmem_size;
>  	struct ssd1307fb_par *par;
> +	bool reset_active_low;
>  	u8 *vmem;
>  	int ret;
>  
> @@ -671,6 +672,7 @@ static int ssd1307fb_probe(struct i2c_client *client,
>  	par->com_seq = of_property_read_bool(node, "solomon,com-seq");
>  	par->com_lrremap = of_property_read_bool(node, "solomon,com-lrremap");
>  	par->com_invdir = of_property_read_bool(node, "solomon,com-invdir");
> +	reset_active_low = of_property_read_bool(node, "reset-active-low");
>  
>  	par->contrast = 127;
>  	par->vcomh = par->device_info->default_vcomh;
> @@ -728,9 +730,9 @@ static int ssd1307fb_probe(struct i2c_client *client,
>  
>  	if (par->reset) {
>  		/* Reset the screen */
> -		gpiod_set_value_cansleep(par->reset, 0);
> +		gpiod_set_value_cansleep(par->reset, reset_active_low);
>  		udelay(4);
> -		gpiod_set_value_cansleep(par->reset, 1);
> +		gpiod_set_value_cansleep(par->reset, !reset_active_low);

I think you and whomever wrote the original code are misinterpretting 
how the gpiod API works. 1 means make the signal active and this case 
active is low.

It is strange, but does mean a reset sequence should always be set to a 
1 and then a 0 and it will work with either polarity in the DT.

Rob
