Return-Path: <SRS0=8xA8=LU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:55722 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727733AbeIFPAo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Sep 2018 11:00:44 -0400
Received: by mail-it0-f65.google.com with SMTP id d10-v6so14015274itj.5
        for <devicetree@vger.kernel.org>; Thu, 06 Sep 2018 03:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20180905132618.31274-1-vincent.whitchurch@axis.com>
In-Reply-To: <20180905132618.31274-1-vincent.whitchurch@axis.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Sep 2018 12:25:44 +0200
Message-ID: <CACRpkdYxXqosomt8KJDpy4kQ07_9o2VkAjyVQACHURJb_Uct+w@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: mockup: Allow probing from device tree
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: vincent.whitchurch@axis.com, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, rabinv@axis.com
List-ID: <devicetree@vger.kernel.org>

Hi Vincent,

looping in Bartosz here too.

On Wed, Sep 5, 2018 at 3:26 PM Vincent Whitchurch
<vincent.whitchurch@axis.com> wrote:
>
> Allow the mockup driver to be probed via the device tree, allowing it to
> be used to configure and test higher level drivers like the leds-gpio
> driver and corresponding userspace before actual hardware is available.
>
> The mockup debugfs interface can be used to inject events, and actions
> on the GPIO can be traced with ftrace.
>
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>

As stated on the bindings, this looks generally helpful.

The code looks fine, would be good if Bartosz could test the patch
with his test setup so we know we don't regress anything.

Nitpicky comments below.

> -       struct gpio_mockup_platform_data *pdata;
> +       struct device_node *node = pdev->dev.of_node;

I usually just call it "np" (node pointer).

> +       if (node) {
> +               u32 nr_gpios;
> +               int ret;
> +
> +               ret = of_property_read_u32(node, "nr-gpios", &nr_gpios);

This we change to ngpios per the standard bindings.

> +               if (ret)
> +                       return ret;
> +
> +               base = -1;
> +               ngpio = nr_gpios;
> +               name = pdev->name;

Maybe of_node_full_name(node) is more helpful? (I'm not sure.)

Yours,
Linus Walleij
