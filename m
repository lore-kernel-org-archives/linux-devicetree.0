Return-Path: <SRS0=UCWN=6F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73F9C54FC9
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Apr 2020 15:25:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EDFF2068F
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Apr 2020 15:25:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nXp+eKJF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbgDUPZI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Apr 2020 11:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbgDUPZH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Apr 2020 11:25:07 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48546C061A41
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 08:25:07 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id r7so10502427edo.11
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 08:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A0hD3Q0ITYFJ+WJSCgWA5cOFQ2Hb706eW4ZYrVGl9Is=;
        b=nXp+eKJF/myCFRCaorUOV9CYoN/WHisSwMTKfzpZVvin3o1rzC4CCU4eM1IEsUZWzY
         K4yhdnlnO+5j7pzJIR2zo3acm84EuPDwIAqvLgv+2hMSZi28C/RwuPpbnMMXfJzQYfbO
         yVdQUm5C7n/+hWUjCO8EJmj5nopNYBLU/453U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A0hD3Q0ITYFJ+WJSCgWA5cOFQ2Hb706eW4ZYrVGl9Is=;
        b=ZzXjLxZztFpe8YCbO+R1Rs1j1haLRDRdsBxYU6HzJ0d2yF0xJ9g944ZxnCSWLVr26r
         q5c1Se9e2bJNFXi1qN6CXsjwqPTT3uwu2pPj0W5SdGw5xvN5NzU93pXx70w7WOH7W3zZ
         LkPl4zZhGhT5I6NQZehDc8/xz7T5296hX0Yy0Hx4/roWeSGZnIBLswAzOTmgNr7ylTm/
         H5BzRR/ampL7/cVXK6TZmCw2zLij1F5fcadezZRz8iH8DjY+Fu0hNyqu8k4JRGE1XFaV
         0w+mgWvZfmqKNLKKLH/xxNtIWdno7hFIeXvIJJgU3zUCzk8kYsyZnu7lDXi9LprivVVv
         ZoiQ==
X-Gm-Message-State: AGi0PuZEsTnBxEJn7GvGosgQy2jWaMIBVjHuVi+H9QK0wq1vrqZUkItw
        RX9QvSuaVfiSr+hiK6U7KsvkGGAM2QJf0w==
X-Google-Smtp-Source: APiQypKBukGXPZCubiXo2NMhaYc0dVY+LXE9FcZBw/UJQjchAunpVYx+MRQMK5Fp18cZruQnxoz8/g==
X-Received: by 2002:aa7:d518:: with SMTP id y24mr18625279edq.222.1587482705549;
        Tue, 21 Apr 2020 08:25:05 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id n17sm507965eja.9.2020.04.21.08.25.04
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 08:25:04 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id i10so16893254wrv.10
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 08:25:04 -0700 (PDT)
X-Received: by 2002:adf:bb94:: with SMTP id q20mr26683063wrg.105.1587482703399;
 Tue, 21 Apr 2020 08:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200421051858.11176-1-bibby.hsieh@mediatek.com> <20200421051858.11176-3-bibby.hsieh@mediatek.com>
In-Reply-To: <20200421051858.11176-3-bibby.hsieh@mediatek.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 21 Apr 2020 17:24:51 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BhHpVn6aE_Q8zsg6iZu5zf05S2oO4XnE6mAfwx3HHEdw@mail.gmail.com>
Message-ID: <CAAFQd5BhHpVn6aE_Q8zsg6iZu5zf05S2oO4XnE6mAfwx3HHEdw@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] i2c: core: support bus regulator controlling in adapter
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

On Tue, Apr 21, 2020 at 7:19 AM Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:
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
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 5cc0b0ec5570..b3d15d6d449d 100644
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
> +       if (pm_runtime_status_suspended(&client->dev)) {

Shouldn't this be !pm_runtime_status_suspended()? If the device was
suspended at system suspend time, we wouldn't have powered off the
regulator in our suspend_late callback, so we don't need to re-enable
it in resume_early.

Best regards,
Tomasz
