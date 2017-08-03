From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/5] of/platform: Generalize /reserved-memory handling
Date: Thu, 3 Aug 2017 12:40:28 -0500
Message-ID: <CAL_JsqKBre5yPJHG3s+8Y7_hgj0_r35nNZc3QiL4HbWLuFx=Bg@mail.gmail.com>
References: <20170803025754.19101-1-bjorn.andersson@linaro.org> <20170803025754.19101-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170803025754.19101-2-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 2, 2017 at 9:57 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> By iterating over all /reserved-memory child nodes and match each one to
> a list of compatibles that we want to treat specially, we can easily
> extend the list of compatibles to handle - without having to resort to
> of_platform_populate() that would create unnecessary platform_devices.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v1:
> - New patch
>
>  drivers/of/platform.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index b19524623498..8c241a116b08 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -497,23 +497,32 @@ int of_platform_default_populate(struct device_node *root,
>  EXPORT_SYMBOL_GPL(of_platform_default_populate);
>
>  #ifndef CONFIG_PPC
> +static const char *rmem_compats[] = {
> +       "ramoops",
> +       NULL
> +};
> +
>  static int __init of_platform_default_populate_init(void)
>  {
> +       struct device_node *rmem_nodes;
>         struct device_node *node;
> +       int ret;
>
>         if (!of_have_populated_dt())
>                 return -ENODEV;
>
>         /*
> -        * Handle ramoops explicitly, since it is inside /reserved-memory,
> -        * which lacks a "compatible" property.
> +        * Handle certain compatibles explicitly, since we don't want to create
> +        * platform_devices for every node in /reserved-memory with a
> +        * "compatible",
>          */
> -       node = of_find_node_by_path("/reserved-memory");
> -       if (node) {
> -               node = of_find_compatible_node(node, NULL, "ramoops");
> -               if (node)
> +       rmem_nodes = of_find_node_by_path("/reserved-memory");
> +       for_each_available_child_of_node(rmem_nodes, node) {
> +               ret = of_device_compatible_match(node, rmem_compats);
> +               if (ret)

I would just do:

for_each_matching_node(node, ...)
    of_platform_device_create(node, NULL, NULL);

I don't think the kernel has to validate that ramoops and any others
we add are children of /reserved-memory. We should only have those
compatibles located there and any other location would be an error.

>                         of_platform_device_create(node, NULL, NULL);
>         }
> +       of_node_put(rmem_nodes);
>
>         /* Populate everything else. */
>         of_platform_default_populate(NULL, NULL, NULL);
> --
> 2.12.0
>
