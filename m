Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EDDCA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 09:25:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C1E2222C9
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 09:25:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XQJD/OPC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409694AbfJRJZL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 05:25:11 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41835 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394889AbfJRJZL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 18 Oct 2019 05:25:11 -0400
Received: by mail-ed1-f68.google.com with SMTP id f20so4031224edv.8
        for <devicetree@vger.kernel.org>; Fri, 18 Oct 2019 02:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d1d0I+Sa70cn+8mQ1G8l7AN+mNQ5hKpQ0njF6HkJuBQ=;
        b=XQJD/OPC52X5Bu3jCEHejPAvjQUHTIpYcX/DiQOe9NBPR/MLrpup6jsP8p3L63iZQQ
         Cr9KJcu693vsHx45SjnoC47Qv7WZr2SlsLk9+tOY1M1+x0M5wXEkwhBr6vlJEUDi7Wz9
         iu6PuZ97KUzO9cq1VSanpsbPgSM1iqch+da/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d1d0I+Sa70cn+8mQ1G8l7AN+mNQ5hKpQ0njF6HkJuBQ=;
        b=cmjaY3l09Uy8q3TPc71BEJOlp3WzK5edeGGJOPUeIQK7s6TGJ/7qSgvaGxILKimyaf
         CdPBnsCyzKMMDZa7ygeNXxb53biMBYs2RC5HXYjp8FXfB3Vt8kiEgAhfuxk6hbc583yq
         JeHm88ZNyJL6niHlOrLagXCr9tPZRkfgZ8IWV9aBX4d2+OC8jCn88+yE97+MbhPH5yWL
         fdkUm5U9XocEXT2LWtQO2kZvsfOmdZ4w8336llhOPMm0NBJVPPWEXBkeWJt+N7WIigAw
         3Ioi/cIjXpD6StHkvIYdNhuyWjEg5+bd9uRFnJaD5bvgXv+6lpTSlIRdopCIv/6lRLbl
         Pe3w==
X-Gm-Message-State: APjAAAUbhbjjCKj79WMTtFi27jMGQgaAbAee7BRToJx8M3jluta0gxbZ
        aJLnScbCxPU+2avyrLK9TBZ/HkUK59PVfA==
X-Google-Smtp-Source: APXvYqw/lTnq7lyYpxxTce4EtpydzHENNvKsTZZqIoOSd9yZ04IuWEJf+vT1R9vrktg396STjKExBg==
X-Received: by 2002:a50:935d:: with SMTP id n29mr8410069eda.167.1571390708648;
        Fri, 18 Oct 2019 02:25:08 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id h58sm221762edb.43.2019.10.18.02.25.07
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2019 02:25:07 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id t16so301619wrr.1
        for <devicetree@vger.kernel.org>; Fri, 18 Oct 2019 02:25:07 -0700 (PDT)
X-Received: by 2002:a5d:5386:: with SMTP id d6mr6700506wrv.155.1571390707294;
 Fri, 18 Oct 2019 02:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
In-Reply-To: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 18 Oct 2019 18:24:55 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DuETr-N8efWYz7F-qrw1R-gL6fss2Ag1XezapojiakhQ@mail.gmail.com>
Message-ID: <CAAFQd5DuETr-N8efWYz7F-qrw1R-gL6fss2Ag1XezapojiakhQ@mail.gmail.com>
Subject: Re: [PATCH v4] misc: eeprom: at24: support pm_runtime control
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Bibby,

On Fri, Oct 18, 2019 at 5:26 PM Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:
>
> Although in the most platforms, the power of eeprom and i2c
> are alway on, some platforms disable the eeprom and i2c power
> in order to meet low power request.
> This patch add the pm_runtime ops to control power to support
> all platforms.
>
> Changes since v3:
>  - remove redundant calling function
>  - change SIMPLE_DEV_PM_OPS to SET_RUNTIME_PM_OPS
>  - change supply name
>
> Changes since v2:
>  - rebase onto v5.4-rc1
>  - pm_runtime_disable and regulator_bulk_disable at
>    err return in probe function
>
> Changes since v1:
>  - remove redundant code
>  - fixup coding style
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/misc/eeprom/at24.c | 64 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 2cccd82a3106..68ced4f25916 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -22,6 +22,7 @@
>  #include <linux/nvmem-provider.h>
>  #include <linux/regmap.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/gpio/consumer.h>
>
>  /* Address pointer is 16 bit. */
> @@ -67,6 +68,12 @@
>   * which won't work on pure SMBus systems.
>   */
>
> +static const char * const at24_supply_names[] = {
> +       "vcc", "i2c",
> +};
> +
> +#define AT24_NUM_SUPPLIES ARRAY_SIZE(at24_supply_names)
> +
>  struct at24_client {
>         struct i2c_client *client;
>         struct regmap *regmap;
> @@ -91,6 +98,8 @@ struct at24_data {
>
>         struct gpio_desc *wp_gpio;
>
> +       bool has_supplies;
> +       struct regulator_bulk_data supplies[AT24_NUM_SUPPLIES];
>         /*
>          * Some chips tie up multiple I2C addresses; dummy devices reserve
>          * them for us, and we'll use them with SMBus calls.
> @@ -662,6 +671,17 @@ static int at24_probe(struct i2c_client *client)
>         at24->client[0].client = client;
>         at24->client[0].regmap = regmap;
>
> +       regulator_bulk_set_supply_names(at24->supplies,
> +                                       at24_supply_names, AT24_NUM_SUPPLIES);
> +       err =  devm_regulator_bulk_get(&at24->client[0].client->dev,
> +                                      AT24_NUM_SUPPLIES, at24->supplies);
> +       if (err == -ENODEV)
> +               at24->has_supplies = NULL;

has_supplies is a bool, so the right value would be false.

> +       else if (err == 0)

nit: One would typically use !err here as the condition.

> +               at24->has_supplies = !err;

In this branch, err is always 0, so !err is always true and we can
just directly assign true to the field.

> +       else
> +               return err;
> +
>         at24->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_HIGH);
>         if (IS_ERR(at24->wp_gpio))
>                 return PTR_ERR(at24->wp_gpio);
> @@ -701,6 +721,14 @@ static int at24_probe(struct i2c_client *client)
>
>         i2c_set_clientdata(client, at24);
>
> +       if (at24->has_supplies) {
> +               err = regulator_bulk_enable(AT24_NUM_SUPPLIES, at24->supplies);
> +               if (err) {
> +                       dev_err(dev, "Failed to enable power regulators\n");
> +                       return err;
> +               }
> +       }
> +
>         /* enable runtime pm */
>         pm_runtime_set_active(dev);
>         pm_runtime_enable(dev);
> @@ -713,6 +741,9 @@ static int at24_probe(struct i2c_client *client)
>         pm_runtime_idle(dev);
>         if (err) {
>                 pm_runtime_disable(dev);
> +               if (at24->has_supplies)
> +                       regulator_bulk_disable(AT24_NUM_SUPPLIES,
> +                                              at24->supplies);
>                 return -ENODEV;
>         }
>
> @@ -725,15 +756,48 @@ static int at24_probe(struct i2c_client *client)
>
>  static int at24_remove(struct i2c_client *client)
>  {
> +       struct at24_data *at24 = i2c_get_clientdata(client);
> +
>         pm_runtime_disable(&client->dev);
>         pm_runtime_set_suspended(&client->dev);
> +       if (at24->has_supplies)
> +               regulator_bulk_disable(AT24_NUM_SUPPLIES, at24->supplies);

It's a weird behavior, but pm_runtime_disable() doesn't guarantee that
the device is actually resumed after the call returns. See [1].
We should move the regulator disable before we call
pm_runtime_set_suspended() and add !pm_runtime_status_suspended() as
an additional condition to the if.

By the way, that behavior is actually contradicting other parts of the
runtime PM core. For example pm_runtime_active() returns true if
dev->power.disable_depth is non-zero, but as per the above, the device
could as well be suspended. Rafael, is this expected?

[1] https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/base/power/runtime.c#L1316

> +
> +       return 0;
> +}
> +
> +static int __maybe_unused at24_suspend(struct device *dev)
> +{
> +       struct i2c_client *client = to_i2c_client(dev);
> +       struct at24_data *at24 = i2c_get_clientdata(client);
> +
> +       if (at24->has_supplies)
> +               return regulator_bulk_disable(AT24_NUM_SUPPLIES,
> +                                             at24->supplies);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused at24_resume(struct device *dev)
> +{
> +       struct i2c_client *client = to_i2c_client(dev);
> +       struct at24_data *at24 = i2c_get_clientdata(client);
> +
> +       if (at24->has_supplies)
> +               return regulator_bulk_enable(AT24_NUM_SUPPLIES,
> +                                            at24->supplies);
>
>         return 0;
>  }
>
> +static const struct dev_pm_ops at24_pm_ops = {
> +       SET_RUNTIME_PM_OPS(at24_suspend, at24_resume, NULL)

Do we also need pm_runtime_force_suspend() and
pm_runtime_force_resume() as system sleep PM ops or it isn't possible
for the device to be runtime active when entering the system suspend?

Best regards,
Tomasz
