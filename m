Return-Path: <SRS0=5/ta=3R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5150C35240
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jan 2020 03:57:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 790542173E
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jan 2020 03:57:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R7Z/E3ab"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgA1D52 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 22:57:28 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:36911 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbgA1D51 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 22:57:27 -0500
Received: by mail-ed1-f68.google.com with SMTP id cy15so13210445edb.4
        for <devicetree@vger.kernel.org>; Mon, 27 Jan 2020 19:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gw24Y2AQXIAfbTJfxFOxt3WeUj63ebRND7ycY8ejxCQ=;
        b=R7Z/E3abAEUwwpbYiKYcQGPTfvcGSf47GTGyW+G4yf3i5N/EPO5xeU7GfKro5nxI5k
         SA0/U1TWwkcK/MnzK+WEBMELYof/bKNmsfsqZz3n9SMbT7aF4WzTjqhtappz+axMR8Ml
         HTa1xzNFGfbaCGJqDWOtSmLzqpbhiMOmnJvlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gw24Y2AQXIAfbTJfxFOxt3WeUj63ebRND7ycY8ejxCQ=;
        b=X8Fi9SkIhp2W5LiW//1I1xmoqZsXtkvN33v4qZj3Qvun+nQM32LBrdtDavR6gXRnYw
         HKsxwJAV7P+DAtHfukaNSS7kfGEercwaqwHLNCCpsDQbPeE0U3um/8vKnSaTBY6FZ0C8
         RnWweu29AodTA5igJfqvqdVXvpYjXPWmZjZU6jkdU9/jNBC5xcUvqMe5g4qI8pDWLIE9
         otq/ijkmfdvsR13qvU/beA0Y6h0QVjq6l+q1YZEgIvEFqGiva7t9OW6BX0g3VKaBYv2A
         CEEad/wieKfursNx+7u7VhFn5YJcdQE7DsQ6/tpiLzAmEAZxOM2/FUic1o/bqQB6sqVG
         2sgg==
X-Gm-Message-State: APjAAAVuRY4n6aIOh3ApsEmSPxaLLdXNdp6A6tIXEyUmdZuM6BASd59o
        XvpROwyLiKzZPFVHO+CHeJYqD0q57B2YJQ==
X-Google-Smtp-Source: APXvYqxnYStk1Nd5ECeSqQDlGEtxAlqidxW0WlOzwcjEMj0tPA1rHsPGm1TE62KvDJw/KP5sXTu6Aw==
X-Received: by 2002:a17:906:a3d5:: with SMTP id ca21mr1365548ejb.159.1580183844759;
        Mon, 27 Jan 2020 19:57:24 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id i9sm377421edb.55.2020.01.27.19.57.23
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 19:57:24 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id b6so14381110wrq.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jan 2020 19:57:23 -0800 (PST)
X-Received: by 2002:adf:ee52:: with SMTP id w18mr25816371wro.415.1580183843131;
 Mon, 27 Jan 2020 19:57:23 -0800 (PST)
MIME-Version: 1.0
References: <20200116025637.3524-1-bibby.hsieh@mediatek.com> <20200116025637.3524-5-bibby.hsieh@mediatek.com>
In-Reply-To: <20200116025637.3524-5-bibby.hsieh@mediatek.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 28 Jan 2020 12:57:12 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DS0p8iyqfFuHQWnpX+WGd1bUEdFMHF_1inKMuSY_j_zA@mail.gmail.com>
Message-ID: <CAAFQd5DS0p8iyqfFuHQWnpX+WGd1bUEdFMHF_1inKMuSY_j_zA@mail.gmail.com>
Subject: Re: [PATCH v10 4/4] i2c: core: support bus regulator controlling in adapter
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jan 16, 2020 at 11:56 AM Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:
>
> Although in the most platforms, the bus power of i2c
> are alway on, some platforms disable the i2c bus power
> in order to meet low power request.
>
> We get and enable bulk regulator in i2c adapter device.
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/i2c/i2c-core-base.c | 81 +++++++++++++++++++++++++++++++++++++
>  include/linux/i2c.h         |  3 ++
>  2 files changed, 84 insertions(+)
>

Hi Bibby,

Please see my comments inline.

Hi Wolfram,

Would you have some time to take a look and comment on the general
approach? Thanks.

> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 9333c865d4a9..9b9e96b094ca 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -306,6 +306,7 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
>  static int i2c_device_probe(struct device *dev)
>  {
>         struct i2c_client       *client = i2c_verify_client(dev);
> +       struct i2c_adapter      *adap = client->adapter;
>         struct i2c_driver       *driver;
>         int status;
>
> @@ -371,6 +372,12 @@ static int i2c_device_probe(struct device *dev)
>
>         dev_dbg(dev, "probe\n");
>
> +       status = regulator_enable(adap->bus_reg);
> +       if (status != 0) {
> +               dev_err(&adap->dev, "Failed to enable power regulator\n");
> +               goto err_clear_wakeup_irq;
> +       }
> +
>         status = of_clk_set_defaults(dev->of_node, false);
>         if (status < 0)
>                 goto err_clear_wakeup_irq;
> @@ -407,6 +414,7 @@ static int i2c_device_probe(struct device *dev)
>  static int i2c_device_remove(struct device *dev)
>  {
>         struct i2c_client       *client = i2c_verify_client(dev);
> +       struct i2c_adapter      *adap = client->adapter;
>         struct i2c_driver       *driver;
>         int status = 0;
>
> @@ -420,6 +428,8 @@ static int i2c_device_remove(struct device *dev)
>         }
>
>         dev_pm_domain_detach(&client->dev, true);
> +       if (!pm_runtime_status_suspended(&adap->dev))

Why adap->dev? We control the regulator in bus-level runtime PM
callbacks of the client->dev, right?

> +               regulator_disable(adap->bus_reg);
>
>         dev_pm_clear_wake_irq(&client->dev);
>         device_init_wakeup(&client->dev, false);
> @@ -431,6 +441,71 @@ static int i2c_device_remove(struct device *dev)
>         return status;
>  }
>
> +#ifdef CONFIG_PM_SLEEP
> +static int i2c_resume(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       struct i2c_adapter *adap = client->adapter;
> +       int err;
> +
> +       if (pm_runtime_status_suspended(&adap->dev)) {

Ditto.

> +               err = regulator_enable(adap->bus_reg);
> +               if (err)
> +                       return err;
> +       }
> +
> +       return pm_generic_resume(dev);
> +}
> +
> +static int i2c_suspend(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       struct i2c_adapter *adap = client->adapter;
> +       int err;
> +
> +       if (!pm_runtime_status_suspended(&adap->dev)) {

Ditto.

> +               err = regulator_disable(adap->bus_reg);
> +               if (err)
> +                       return err;
> +       }
> +
> +       return pm_generic_suspend(dev);
> +}
> +#endif
> +
> +#ifdef CONFIG_PM
> +static int i2c_runtime_resume(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       struct i2c_adapter *adap = client->adapter;
> +       int err;
> +
> +       err = regulator_enable(adap->bus_reg);
> +       if (err)
> +               return err;
> +
> +       return pm_generic_runtime_resume(dev);
> +}
> +
> +static int i2c_runtime_suspend(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       struct i2c_adapter *adap = client->adapter;
> +       int err;
> +
> +       err = pm_generic_runtime_suspend(dev);
> +       if (err)
> +               return err;
> +
> +       return regulator_disable(adap->bus_reg);
> +}
> +#endif
> +
> +static const struct dev_pm_ops i2c_device_pm = {
> +       SET_SYSTEM_SLEEP_PM_OPS(i2c_suspend, i2c_resume)
> +       SET_RUNTIME_PM_OPS(i2c_runtime_suspend, i2c_runtime_resume, NULL)
> +};
> +
>  static void i2c_device_shutdown(struct device *dev)
>  {
>         struct i2c_client *client = i2c_verify_client(dev);
> @@ -488,6 +563,7 @@ struct bus_type i2c_bus_type = {
>         .probe          = i2c_device_probe,
>         .remove         = i2c_device_remove,
>         .shutdown       = i2c_device_shutdown,
> +       .pm             = &i2c_device_pm,
>  };
>  EXPORT_SYMBOL_GPL(i2c_bus_type);
>
> @@ -1351,6 +1427,11 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
>                 goto out_reg;
>
>         dev_dbg(&adap->dev, "adapter [%s] registered\n", adap->name);
> +       adap->bus_reg = devm_regulator_get(&adap->dev, "bus");
> +       if (IS_ERR(adap->bus_reg)) {
> +               res = PTR_ERR(adap->bus_reg);
> +               goto out_reg;
> +       }
>
>         pm_runtime_no_callbacks(&adap->dev);
>         pm_suspend_ignore_children(&adap->dev, true);
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index d2f786706657..833b81a680da 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -15,6 +15,7 @@
>  #include <linux/device.h>      /* for struct device */
>  #include <linux/sched.h>       /* for completion */
>  #include <linux/mutex.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/rtmutex.h>
>  #include <linux/irqdomain.h>           /* for Host Notify IRQ */
>  #include <linux/of.h>          /* for struct device_node */
> @@ -330,6 +331,7 @@ struct i2c_client {
>         int init_irq;                   /* irq set at initialization    */
>         int irq;                        /* irq issued by device         */
>         struct list_head detected;
> +

nit: Unnecessary change.

Best regards,
Tomasz
