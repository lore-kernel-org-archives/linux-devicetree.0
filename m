From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 1/2] leds/tca6507: Add support for devicetree.
Date: Wed, 07 Nov 2012 18:30:06 +0900
Message-ID: <000b01cdbcca$7925d2b0$6b717810$%han@samsung.com>
References: <1351633534-20817-1-git-send-email-marek.belisko@open-nandra.com>
 <CAK5ve-+fE7T3U9KZ-C5-sZN9PUPq6RybCu+nv9UDb2x0bnarzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAK5ve-+fE7T3U9KZ-C5-sZN9PUPq6RybCu+nv9UDb2x0bnarzw@mail.gmail.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Marek Belisko' <marek.belisko@open-nandra.com>
Cc: 'Bryan Wu' <cooloney@gmail.com>, rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: devicetree@vger.kernel.org

On Wednesday, November 07, 2012 3:25 AM Bryan Wu wrote
> 
> On Tue, Oct 30, 2012 at 2:45 PM, Marek Belisko
> <marek.belisko@open-nandra.com> wrote:
> > Support added only for leds (not for gpio's).
> >
> > Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> > ---
> >  drivers/leds/leds-tca6507.c |   73 +++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 70 insertions(+), 3 deletions(-)
> >
> 
> Overall, this looks good to me. Maybe some question as below,
> 
> -Bryan
> 
> > diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
> > index dabcf7a..496dd98 100644
> > --- a/drivers/leds/leds-tca6507.c
> > +++ b/drivers/leds/leds-tca6507.c
> > @@ -667,6 +667,69 @@ static void tca6507_remove_gpio(struct tca6507_chip *tca)
> >  }
> >  #endif /* CONFIG_GPIOLIB */
> >
> > +#ifdef CONFIG_OF
> > +static struct tca6507_platform_data * __devinit tca6507_led_dt_init(struct i2c_client *client)
> > +{
> > +       struct device_node *np = client->dev.of_node, *child;
> > +       struct tca6507_platform_data *pdata;
> > +       struct led_info *tca_leds;
> > +       int count = 0;
> > +
> > +       for_each_child_of_node(np, child)
> > +               count++;
> > +       if (!count)
> > +               return NULL;
> > +
> 
> I saw many 'return NULL' here, why not return some error code in ERR_PTR?
> 
> > +       if (count > NUM_LEDS)
> > +               return NULL;
> > +
> > +       tca_leds = devm_kzalloc(&client->dev, sizeof(struct led_info) * NUM_LEDS, GFP_KERNEL);
> > +
> 
> useless empty line.
> 
> > +       if (!tca_leds)
> > +               return NULL;
> > +
> > +
> 
> useless empty line.
> 
> > +       for_each_child_of_node(np, child) {
> > +               struct led_info led;
> > +               u32 reg;
> > +               int ret;
> > +
> > +               led.name = of_get_property(child, "label", NULL) ? : child->name;
> > +               led.default_trigger =
> > +                       of_get_property(child, "linux,default-trigger", NULL);
> > +
> > +               ret = of_property_read_u32(child, "reg", &reg);
> > +
> > +               if (ret != 0)
> > +                       continue;
> > +               tca_leds[reg] = led;
> > +       }
> > +       pdata = devm_kzalloc(&client->dev, sizeof(struct tca6507_platform_data), GFP_KERNEL);
> > +       if (!pdata) {
> > +               kfree(tca_leds);
> 
> Do we need to kfree here? I think devm_zalloc() will take care of this
> if the driver failed to register.

If devm_kzalloc() fails, tca6507_probe() will return '-ENODEV'.
In this case, kfree() is unnecessary in this case, when devm_kzalloc()
is used.

Moreover, even if kfree() is necessary, devm_kfree() should be used
instead of kfree().

Marek Belisko, please refer to this document.
: http://www.kernel.org/doc/htmldocs/device-drivers/API-devm-kzalloc.html

Thank you.


Best regards,
Jingoo Han


> 
> > +               return NULL;
> > +       }
> > +
> > +       pdata->leds.leds = tca_leds;
> > +       pdata->leds.num_leds = NUM_LEDS;
> > +
> > +       return pdata;
> > +}
> > +
> > +static const struct of_device_id of_tca6507_leds_match[] = {
> > +       { .compatible = "leds-tca6507", },
> > +       {},
> > +};
> > +
> > +#else
> > +static int __devinit tca6507_led_dt_init(struct i2c_client *client, struct tca6507_platform_data
> *data)
> > +{
> > +       return -1;
> > +}
> > +
> > +#define of_tca6507_leds_match NULL
> > +#endif
> > +
> >  static int __devinit tca6507_probe(struct i2c_client *client,
> >                                    const struct i2c_device_id *id)
> >  {
> > @@ -683,9 +746,12 @@ static int __devinit tca6507_probe(struct i2c_client *client,
> >                 return -EIO;
> >
> >         if (!pdata || pdata->leds.num_leds != NUM_LEDS) {
> > -               dev_err(&client->dev, "Need %d entries in platform-data list\n",
> > -                       NUM_LEDS);
> > -               return -ENODEV;
> > +               pdata = tca6507_led_dt_init(client);
> > +               if (!pdata) {
> > +                       dev_err(&client->dev, "Need %d entries in platform-data list\n",
> > +                               NUM_LEDS);
> > +                       return -ENODEV;
> > +               }
> >         }
> >         tca = devm_kzalloc(&client->dev, sizeof(*tca), GFP_KERNEL);
> >         if (!tca)
> > @@ -750,6 +816,7 @@ static struct i2c_driver tca6507_driver = {
> >         .driver   = {
> >                 .name    = "leds-tca6507",
> >                 .owner   = THIS_MODULE,
> > +               .of_match_table = of_tca6507_leds_match,
> >         },
> >         .probe    = tca6507_probe,
> >         .remove   = __devexit_p(tca6507_remove),
> > --
> > 1.7.9.5
> >
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
