From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2] rtc: add hym8563 rtc-driver
Date: Mon, 25 Nov 2013 12:01:25 +0000
Message-ID: <20131125120125.GD32081@e106331-lin.cambridge.arm.com>
References: <201311222254.07730.heiko@sntech.de>
 <201311222255.48943.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201311222255.48943.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[...]

> +static int hym8563_probe(struct i2c_client *client,
> +                        const struct i2c_device_id *id)
> +{
> +       struct hym8563 *hym8563;
> +       int ret, gpio_int;
> +
> +       hym8563 = devm_kzalloc(&client->dev, sizeof(hym8563), GFP_KERNEL);
> +       if (!hym8563)
> +               return -ENOMEM;
> +
> +       hym8563->client = client;
> +       i2c_set_clientdata(client, hym8563);
> +
> +       device_set_wakeup_capable(&client->dev, true);
> +
> +       gpio_int = of_get_gpio(client->dev.of_node, 0);
> +       if (!gpio_is_valid(gpio_int)) {
> +               dev_err(&client->dev, "failed to get interrupt gpio\n");
> +               return -EINVAL;
> +       }
> +
> +       ret = devm_gpio_request_one(&client->dev, gpio_int,
> +                                     GPIOF_DIR_IN, "hym8563_int");
> +       if (ret) {
> +               dev_err(&client->dev, "request of gpio %d failed, %d\n",
> +                       gpio_int, ret);
> +               return ret;
> +       }

>From here on the gpio is never used or even stashed away anywhere.
What's the point in requesting it and then leaking it?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
