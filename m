From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] leds: Add support for Palmas LEDs
Date: Thu, 28 Feb 2013 11:14:47 +0530
Message-ID: <512EEECF.5090409@nvidia.com>
References: <1361970800-31460-1-git-send-email-ian@slimlogic.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1361970800-31460-1-git-send-email-ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Ian Lartey <ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
Cc: "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "j-keerthy-l0cyMroinI0@public.gmane.org" <j-keerthy-l0cyMroinI0@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org" <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, "gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 27 February 2013 06:43 PM, Ian Lartey wrote:
> The Palmas familly of chips has LED support. This is not always muxed
> to output pins so depending on the setting of the mux this driver
> will create the appropriate LED class devices.
>
> Signed-off-by: Graeme Gregory <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
> Signed-off-by: Ian Lartey <ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
> ---

Patch 1 and 2 can be merged together as this is makefile, Kconfig and 
driver addition.


> +
> +static int palmas_led_read(struct palmas_leds_data *leds, unsigned int reg,
> +               unsigned int *dest)
> +{
> +       unsigned int addr;
> +
> +       addr = PALMAS_BASE_TO_REG(PALMAS_LED_BASE, reg);
This is not require. Infact doing this will not work.

palmas_read already take care of proper offset.
         unsigned int addr =  PALMAS_BASE_TO_REG(base, reg);
         int slave_id = PALMAS_BASE_TO_SLAVE(base);

         return regmap_read(palmas->regmap[slave_id], addr, val);


same for other places also.


>
> +static void palmas_leds_work(struct work_struct *work)
> +{
> +       struct palmas_led *led = container_of(work, struct palmas_led, work);
> +       unsigned int period, ctrl;
> +       unsigned long flags;
> +
> +       mutex_lock(&led->mutex);
> +
> +       palmas_led_read(led->leds_data, PALMAS_LED_CTRL, &ctrl);
> +       palmas_led_read(led->leds_data, PALMAS_LED_PERIOD_CTRL, &period);
> +
> +       spin_lock_irqsave(&led->value_lock, flags);
> +
> +       switch (led->led_no) {
> +       case 1:
> +               ctrl &= ~PALMAS_LED_CTRL_LED_1_ON_TIME_MASK;
> +               period &= ~PALMAS_LED_PERIOD_CTRL_LED_1_PERIOD_MASK;
> +

case 1,2,3 and 4 looks same, jus shift/mask are changed. I think this 
can be rewritten here to reduce code size.


> +static int palmas_leds_probe(struct platform_device *pdev)
> +{
> +       struct palmas *palmas = dev_get_drvdata(pdev->dev.parent);
> +       struct palmas_leds_platform_data *pdata = pdev->dev.platform_data;
> +       struct palmas_leds_data *leds_data;
> +       struct device_node *node = pdev->dev.of_node;
> +       int ret, i;
> +       int offset = 0;
> +
> +       if (!palmas->led_muxed && !is_palmas_charger(palmas->product_id)) {
> +               dev_err(&pdev->dev, "there are no LEDs muxed\n");
> +               return -EINVAL;
> +       }
> +
> +       /* Palmas charger requires platform data */
> +       if (is_palmas_charger(palmas->product_id) && node && !pdata) {
> +               pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> +
> +               if (!pdata)
> +                       return -ENOMEM;
> +
> +               ret = palmas_dt_to_pdata(&pdev->dev, node, pdata);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       if (is_palmas_charger(palmas->product_id) && !pdata)
> +               return -EINVAL;
> +
> +       leds_data = kzalloc(sizeof(*leds_data), GFP_KERNEL);

Use devm_kzalloc().


> +
> +static int  palmas_leds_init(void)
> +{
> +       return platform_driver_register(&palmas_leds_driver);
> +}
> +module_init(palmas_leds_init);
> +
> +static void palmas_leds_exit(void)
> +{
> +       platform_driver_unregister(&palmas_leds_driver);
> +}
> +module_exit(palmas_leds_exit);

use Module_platform_driver().
