From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] of: platform: stop accessing invalid dev in of_platform_device_destroy
Date: Mon, 4 Jun 2018 08:44:39 -0500
Message-ID: <CAL_JsqJ9AMDiYCfgGgHZ=XL_1yJjTdSA4Jb_GqHAZML3jwB6+Q@mail.gmail.com>
References: <20180602000343.20045-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180602000343.20045-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Frank Rowand <frowand.list@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Banajit Goswami <bgoswami@codeaurora.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Rohit Kumar <rohkumar@qti.qualcomm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 1, 2018 at 7:03 PM, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
> Immediately after the platform_device_unregister() the device will be cleaned up.
> Accessing the freed pointer immediately after that will crash the system.
>
> Found this bug when kernel is built with CONFIG_PAGE_POISONING and testing
> loading/unloading audio drivers in a loop on Qcom platforms.

Curious, does the unittest not catch this too?

>
> Fix this by removing accessing the dev pointer.
> Below is the carsh trace:

s/carsh/crash/

[...]

> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index c00d81dfac0b..84c5c899187b 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -529,10 +529,13 @@ arch_initcall_sync(of_platform_default_populate_init);
>
>  int of_platform_device_destroy(struct device *dev, void *data)
>  {
> +       struct device_node *np;
> +
>         /* Do not touch devices not populated from the device tree */
>         if (!dev->of_node || !of_node_check_flag(dev->of_node, OF_POPULATED))
>                 return 0;
>
> +       np = dev->of_node;
>         /* Recurse for any nodes that were treated as busses */
>         if (of_node_check_flag(dev->of_node, OF_POPULATED_BUS))
>                 device_for_each_child(dev, NULL, of_platform_device_destroy);
> @@ -544,8 +547,8 @@ int of_platform_device_destroy(struct device *dev, void *data)
>                 amba_device_unregister(to_amba_device(dev));
>  #endif
>
> -       of_node_clear_flag(dev->of_node, OF_POPULATED);
> -       of_node_clear_flag(dev->of_node, OF_POPULATED_BUS);

Just move these 2 lines to before unregister calls.

> +       of_node_clear_flag(np, OF_POPULATED);
> +       of_node_clear_flag(np, OF_POPULATED_BUS);
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(of_platform_device_destroy);
> --
> 2.16.2
>
