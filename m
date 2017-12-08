From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v1 2/2] drm/tinydrm: add driver for ST7735R panels
Date: Fri, 8 Dec 2017 15:11:05 +0100
Message-ID: <523fd532-3302-4a43-c28d-89fbe75de599@tronnes.org>
References: <1511924469-11448-1-git-send-email-david@lechnology.com>
 <1511924469-11448-3-git-send-email-david@lechnology.com>
 <455f5c7a-9f3c-c019-9418-94f0c2015afd@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <455f5c7a-9f3c-c019-9418-94f0c2015afd-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, limor-6aDhHjTmHzzR7s880joybQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Den 06.12.2017 19.27, skrev Noralf Trønnes:
>
> Den 29.11.2017 04.01, skrev David Lechner:
>> This adds a new driver for Sitronix ST7735R display panels.
>>
>> This has been tested using an Adafruit 1.8" TFT.
>>
>> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>> ---

<snip>

>> diff --git a/drivers/gpu/drm/tinydrm/st7735r.c 
>> b/drivers/gpu/drm/tinydrm/st7735r.c

<snip>

>> +static struct drm_driver st7735r_driver = {
>> +    .driver_features    = DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME |
>> +                  DRIVER_ATOMIC,
>> +    .fops            = &st7735r_fops,
>> +    TINYDRM_GEM_DRIVER_OPS,
>> +    .lastclose        = tinydrm_lastclose,

tinydrm_lastclose() is going away, please use:

     .lastclose        = drm_fb_helper_lastclose,

Noralf.

>> +    .name            = "st7735r",
>> +    .desc            = "Sitronix ST7735R",
>> +    .date            = "20171128",
>> +    .major            = 1,
>> +    .minor            = 0,
>> +};
>> +
>> +static const struct of_device_id st7735r_of_match[] = {
>> +    { .compatible = "sitronix,st7735r-jd-t18003-t01" },
>> +    {},
>> +};
>> +MODULE_DEVICE_TABLE(of, st7735r_of_match);
>> +
>> +static const struct spi_device_id st7735r_id[] = {
>> +    { "st7735r-jd-t18003-t01", 0 },
>> +    { },
>> +};
>> +MODULE_DEVICE_TABLE(spi, st7735r_id);
>> +
>> +static int st7735r_probe(struct spi_device *spi)
>> +{
>> +    struct device *dev = &spi->dev;
>> +    struct mipi_dbi *mipi;
>> +    struct gpio_desc *dc;
>> +    u32 rotation = 0;
>> +    int ret;
>> +
>> +    mipi = devm_kzalloc(dev, sizeof(*mipi), GFP_KERNEL);
>> +    if (!mipi)
>> +        return -ENOMEM;
>> +
>> +    mipi->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>> +    if (IS_ERR(mipi->reset)) {
>> +        DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
>> +        return PTR_ERR(mipi->reset);
>> +    }
>> +
>> +    dc = devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
>> +    if (IS_ERR(dc)) {
>> +        DRM_DEV_ERROR(dev, "Failed to get gpio 'dc'\n");
>> +        return PTR_ERR(dc);
>> +    }
>> +
>> +    mipi->backlight = tinydrm_of_find_backlight(dev);
>> +    if (IS_ERR(mipi->backlight))
>> +        return PTR_ERR(mipi->backlight);
>> +
>> +    device_property_read_u32(dev, "rotation", &rotation);
>> +
>> +    ret = mipi_dbi_spi_init(spi, mipi, dc);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = mipi_dbi_init(&spi->dev, mipi, &st7735r_pipe_funcs,
>> +                &st7735r_driver, &st7735r_mode, rotation);
>> +    if (ret)
>> +        return ret;
>> +
>> +    spi_set_drvdata(spi, mipi);
>> +
>> +    return devm_tinydrm_register(&mipi->tinydrm);
>> +}
>> +
>> +static void st7735r_shutdown(struct spi_device *spi)
>> +{
>> +    struct mipi_dbi *mipi = spi_get_drvdata(spi);
>> +
>> +    tinydrm_shutdown(&mipi->tinydrm);
>> +}
>> +
>> +static struct spi_driver st7735r_spi_driver = {
>> +    .driver = {
>> +        .name = "st7735r",
>> +        .owner = THIS_MODULE,
>> +        .of_match_table = st7735r_of_match,
>> +    },
>> +    .id_table = st7735r_id,
>> +    .probe = st7735r_probe,
>> +    .shutdown = st7735r_shutdown,
>> +};
>> +module_spi_driver(st7735r_spi_driver);
>> +
>> +MODULE_DESCRIPTION("Sitronix ST7735R DRM driver");
>> +MODULE_AUTHOR("David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>");
>> +MODULE_LICENSE("GPL");
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
