From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/2] leds/tca6507: Add support for devicetree.
Date: Mon, 3 Dec 2012 17:19:34 -0800
Message-ID: <CAK5ve-Jx=_gq+teFRRjDYqt+dceo9YoNGwRXNcopDr93mCE6dQ@mail.gmail.com>
References: <1354312850-29264-1-git-send-email-marek.belisko@open-nandra.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1354312850-29264-1-git-send-email-marek.belisko-e6Ot0yJZRx5zTq7rFmK8cA@public.gmane.org>
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
To: Marek Belisko <marek.belisko-e6Ot0yJZRx5zTq7rFmK8cA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Looks like this patch is based on linux-next tree, I fixed this. And I
will solve the conflict when we do actually merge in next cycle.

-Bryan

On Fri, Nov 30, 2012 at 2:00 PM, Marek Belisko
<marek.belisko-e6Ot0yJZRx5zTq7rFmK8cA@public.gmane.org> wrote:
> Support added only for leds (not for gpio's).
>
> Signed-off-by: Marek Belisko <marek.belisko-e6Ot0yJZRx5zTq7rFmK8cA@public.gmane.org>
> ---
> Changes from v3:
> - fix code according Bryan suggestions
> - use common leds binding description instead copy'n'paste
> - use "-" instead "_" in bindings example for leds names
>
> Changes from v2:
> - change compatible property to "ti,tca6507"
> - add documentation for linux,default-trigger
>
> Changes from v1:
> - return proper error value not NULL from tca6507_led_dt_init()
>         - remove empty lines
>         - remove kfree()
>  drivers/leds/leds-tca6507.c |   74 +++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 71 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
> index b26a63b..3ad46fb 100644
> --- a/drivers/leds/leds-tca6507.c
> +++ b/drivers/leds/leds-tca6507.c
> @@ -667,6 +667,70 @@ static void tca6507_remove_gpio(struct tca6507_chip *tca)
>  }
>  #endif /* CONFIG_GPIOLIB */
>
> +#ifdef CONFIG_OF
> +static struct tca6507_platform_data *
> +tca6507_led_dt_init(struct i2c_client *client)
> +{
> +       struct device_node *np = client->dev.of_node, *child;
> +       struct tca6507_platform_data *pdata;
> +       struct led_info *tca_leds;
> +       int count = 0;
> +
> +       for_each_child_of_node(np, child)
> +               count++;
> +       if (!count)
> +               return ERR_PTR(-ENODEV);
> +
> +       if (count > NUM_LEDS)
> +               return ERR_PTR(-ENODEV);
> +
> +       tca_leds = devm_kzalloc(&client->dev,
> +                               sizeof(struct led_info) * count, GFP_KERNEL);
> +       if (!tca_leds)
> +               return ERR_PTR(-ENOMEM);
> +
> +       for_each_child_of_node(np, child) {
> +               struct led_info led;
> +               u32 reg;
> +               int ret;
> +
> +               led.name =
> +                       of_get_property(child, "label", NULL) ? : child->name;
> +               led.default_trigger =
> +                       of_get_property(child, "linux,default-trigger", NULL);
> +
> +               ret = of_property_read_u32(child, "reg", &reg);
> +               if (ret != 0)
> +                       continue;
> +
> +               tca_leds[reg] = led;
> +       }
> +       pdata = devm_kzalloc(&client->dev,
> +                       sizeof(struct tca6507_platform_data), GFP_KERNEL);
> +       if (!pdata)
> +               return ERR_PTR(-ENOMEM);
> +
> +       pdata->leds.leds = tca_leds;
> +       pdata->leds.num_leds = count;
> +
> +       return pdata;
> +}
> +
> +static const struct of_device_id of_tca6507_leds_match[] = {
> +       { .compatible = "ti,tca6507", },
> +       {},
> +};
> +
> +#else
> +static tca6507_platform_data *
> +tca6507_led_dt_init(struct i2c_client *client)
> +{
> +       return ERR_PRT(-ENODEV);
> +}
> +
> +#define of_tca6507_leds_match NULL
> +#endif
> +
>  static int tca6507_probe(struct i2c_client *client,
>                                    const struct i2c_device_id *id)
>  {
> @@ -683,9 +747,12 @@ static int tca6507_probe(struct i2c_client *client,
>                 return -EIO;
>
>         if (!pdata || pdata->leds.num_leds != NUM_LEDS) {
> -               dev_err(&client->dev, "Need %d entries in platform-data list\n",
> -                       NUM_LEDS);
> -               return -ENODEV;
> +               pdata = tca6507_led_dt_init(client);
> +               if (IS_ERR(pdata)) {
> +                       dev_err(&client->dev, "Need %d entries in platform-data list\n",
> +                               NUM_LEDS);
> +                       return PTR_ERR(pdata);
> +               }
>         }
>         tca = devm_kzalloc(&client->dev, sizeof(*tca), GFP_KERNEL);
>         if (!tca)
> @@ -750,6 +817,7 @@ static struct i2c_driver tca6507_driver = {
>         .driver   = {
>                 .name    = "leds-tca6507",
>                 .owner   = THIS_MODULE,
> +               .of_match_table = of_tca6507_leds_match,
>         },
>         .probe    = tca6507_probe,
>         .remove   = tca6507_remove,
> --
> 1.7.10.4
>
