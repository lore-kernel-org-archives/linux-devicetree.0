Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715FBC83004
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 11:45:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 487D1206E2
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 11:45:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WCmchLk8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbgD1Lpe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 07:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgD1Lpe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Apr 2020 07:45:34 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20889C03C1A9
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 04:45:34 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id rh22so16991925ejb.12
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 04:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8ghVaLvgfptCaaZOVahUCAkpUeHXgsqT+vrjbhFZHSc=;
        b=WCmchLk82HqiCwaieVSY9+b2tv9ZS0iPFiPat7z0ETDi1r6Q3uKq+VtUw1I9fi4r7P
         roUOHRDmnS37DXdW+kZZ6g2KXV966oORc1KFftEULlQvlPJzccIAcGKPpuqN3CsuxRzj
         4L3tzgO8TQqjcZ3cXCZ/mpc6rs0RFAbhj5XCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ghVaLvgfptCaaZOVahUCAkpUeHXgsqT+vrjbhFZHSc=;
        b=K45WxqkO85cGNMUwoc5biff0FQ2RhQ1OyX59hj8WvglrMfDfAE5lAG4ks7MUAeuCzb
         JAjky3a+a1TRDXZjd1ojqEDSVA0M2DL2HYydDVqN846Ogddh1Jgx3Pnt5VaEwZxVsBDx
         tSaU0foTP03nG2kgMVot8bJ0XVJwGXz97LOC/GhZWpqJ+T7ocmLQYE6JpaumjGuAFnta
         vvR7J6021BouetEA13o4MmOyfTJ+WKRcK/RiPG1jq0BZNNchfoLWqv/tYP9W0rcJS9wa
         Z7eFlgsX7I+gYXKj6YfCjUI12Pa/reBaPBDwXzlH64ndKrhGSMX2zbumM+YdRSsGWEnz
         wnlg==
X-Gm-Message-State: AGi0PuZqpd2yVW51iOFpVKC/tToDY6X3pDklLdmrQhHLo0STxANw5O+d
        68znDDPWSBEb+5ejx3goYpjyOrZG5t3WZg==
X-Google-Smtp-Source: APiQypLcqzsI9Nn3bQFttsJeHaONHiaYYq2907UGuMbuvWXo50yUW7Ly+Ak3MAvM8XiNnQSuWBtAWw==
X-Received: by 2002:a17:906:4714:: with SMTP id y20mr24929951ejq.5.1588074332279;
        Tue, 28 Apr 2020 04:45:32 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id o13sm422646ejn.19.2020.04.28.04.45.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 04:45:31 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id d15so22644949wrx.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 04:45:31 -0700 (PDT)
X-Received: by 2002:adf:9d8d:: with SMTP id p13mr32019542wre.17.1588074330852;
 Tue, 28 Apr 2020 04:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200428061813.27072-1-bibby.hsieh@mediatek.com> <20200428061813.27072-3-bibby.hsieh@mediatek.com>
In-Reply-To: <20200428061813.27072-3-bibby.hsieh@mediatek.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 28 Apr 2020 13:45:18 +0200
X-Gmail-Original-Message-ID: <CAAFQd5A0wG22F32bEZeN1ZmwxnbQkcexHV9JbPUFrTijF3TgLw@mail.gmail.com>
Message-ID: <CAAFQd5A0wG22F32bEZeN1ZmwxnbQkcexHV9JbPUFrTijF3TgLw@mail.gmail.com>
Subject: Re: [PATCH v14 2/2] i2c: core: support bus regulator controlling in adapter
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Apr 28, 2020 at 8:18 AM Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:
>
> Although in the most platforms, the bus power of i2c
> are alway on, some platforms disable the i2c bus power
> in order to meet low power request.
>
> We get and enable bulk regulator in i2c adapter device.
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/i2c/i2c-core-base.c | 82 +++++++++++++++++++++++++++++++++++++
>  include/linux/i2c.h         |  2 +
>  2 files changed, 84 insertions(+)
>

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 5cc0b0ec5570..f81b42a4ed07 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -313,6 +313,7 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
>  static int i2c_device_probe(struct device *dev)
>  {
>         struct i2c_client       *client = i2c_verify_client(dev);
> +       struct i2c_adapter      *adap = client->adapter;
>         struct i2c_driver       *driver;
>         int status;
>
> @@ -378,6 +379,12 @@ static int i2c_device_probe(struct device *dev)
>
>         dev_dbg(dev, "probe\n");
>
> +       status = regulator_enable(adap->bus_regulator);
> +       if (status < 0) {
> +               dev_err(&adap->dev, "Failed to enable power regulator\n");
> +               goto err_clear_wakeup_irq;
> +       }
> +
>         status = of_clk_set_defaults(dev->of_node, false);
>         if (status < 0)
>                 goto err_clear_wakeup_irq;
> @@ -414,6 +421,7 @@ static int i2c_device_probe(struct device *dev)
>  static int i2c_device_remove(struct device *dev)
>  {
>         struct i2c_client       *client = i2c_verify_client(dev);
> +       struct i2c_adapter      *adap = client->adapter;
>         struct i2c_driver       *driver;
>         int status = 0;
>
> @@ -427,6 +435,8 @@ static int i2c_device_remove(struct device *dev)
>         }
>
>         dev_pm_domain_detach(&client->dev, true);
> +       if (!pm_runtime_status_suspended(&client->dev))
> +               regulator_disable(adap->bus_regulator);
>
>         dev_pm_clear_wake_irq(&client->dev);
>         device_init_wakeup(&client->dev, false);
> @@ -438,6 +448,72 @@ static int i2c_device_remove(struct device *dev)
>         return status;
>  }
>
> +#ifdef CONFIG_PM_SLEEP
> +static int i2c_resume_early(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       struct i2c_adapter *adap = client->adapter;
> +       int err;
> +
> +       if (!pm_runtime_status_suspended(&client->dev)) {
> +               err = regulator_enable(adap->bus_regulator);
> +               if (err)
> +                       return err;
> +       }
> +
> +       return pm_generic_resume_early(&client->dev);
> +}
> +
> +static int i2c_suspend_late(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       struct i2c_adapter *adap = client->adapter;
> +       int err;
> +
> +       err = pm_generic_suspend_late(&client->dev);
> +       if (err)
> +               return err;
> +
> +       if (!pm_runtime_status_suspended(&client->dev))
> +               return regulator_disable(adap->bus_regulator);
> +
> +       return err;
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
> +       err = regulator_enable(adap->bus_regulator);
> +       if (err)
> +               return err;
> +
> +       return pm_generic_runtime_resume(&client->dev);
> +}
> +
> +static int i2c_runtime_suspend(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       struct i2c_adapter *adap = client->adapter;
> +       int err;
> +
> +       err = pm_generic_runtime_suspend(&client->dev);
> +       if (err)
> +               return err;
> +
> +       return regulator_disable(adap->bus_regulator);
> +}
> +#endif
> +
> +static const struct dev_pm_ops i2c_device_pm = {
> +       SET_LATE_SYSTEM_SLEEP_PM_OPS(i2c_suspend_late, i2c_resume_early)
> +       SET_RUNTIME_PM_OPS(i2c_runtime_suspend, i2c_runtime_resume, NULL)
> +};
> +
>  static void i2c_device_shutdown(struct device *dev)
>  {
>         struct i2c_client *client = i2c_verify_client(dev);
> @@ -495,6 +571,7 @@ struct bus_type i2c_bus_type = {
>         .probe          = i2c_device_probe,
>         .remove         = i2c_device_remove,
>         .shutdown       = i2c_device_shutdown,
> +       .pm             = &i2c_device_pm,
>  };
>  EXPORT_SYMBOL_GPL(i2c_bus_type);
>
> @@ -1333,6 +1410,11 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
>         if (res)
>                 goto out_reg;
>
> +       adap->bus_regulator = devm_regulator_get(&adap->dev, "bus");
> +       if (IS_ERR(adap->bus_regulator)) {
> +               res = PTR_ERR(adap->bus_regulator);
> +               goto out_reg;
> +       }
>         dev_dbg(&adap->dev, "adapter [%s] registered\n", adap->name);
>
>         pm_runtime_no_callbacks(&adap->dev);
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 456fc17ecb1c..bc83af0d38d1 100644
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
> @@ -721,6 +722,7 @@ struct i2c_adapter {
>         const struct i2c_adapter_quirks *quirks;
>
>         struct irq_domain *host_notify_domain;
> +       struct regulator *bus_regulator;
>  };
>  #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
>
> --
> 2.18.0
