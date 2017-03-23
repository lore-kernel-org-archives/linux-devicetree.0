From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] of/pci: Fix memory leak in of_pci_get_host_bridge_resources
Date: Thu, 23 Mar 2017 17:07:11 -0500
Message-ID: <CAL_Jsq+xxG6w6J+Zz-kcJ+rA9jJomyHFiazHzcPHuQizn-4-wg@mail.gmail.com>
References: <1490256755-889-1-git-send-email-jeffy.chen@rock-chips.com> <1490256755-889-3-git-send-email-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490256755-889-3-git-send-email-jeffy.chen@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffy Chen <jeffy.chen@rock-chips.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, toshi.kani@hpe.com, Shawn Lin <shawn.lin@rock-chips.com>, Brian Norris <briannorris@chromium.org>, Doug Anderson <dianders@chromium.org>, "bhelgaas@google.com" <bhelgaas@google.com>, Dmitry Torokhov <dtor@chromium.org>, Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 23, 2017 at 3:12 AM, Jeffy Chen <jeffy.chen@rock-chips.com> wrote:
> Currently we only free the allocated resource struct when error.
> This would cause memory leak after pci_free_resource_list.
>
> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> ---
>
> Changes in v2:
> Don't change the resource_list_create_entry's behavior.
>
>  drivers/of/of_pci.c | 57 +++++++++++++++++++++++------------------------------
>  1 file changed, 25 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
> index 0ee42c3..a0ec246 100644
> --- a/drivers/of/of_pci.c
> +++ b/drivers/of/of_pci.c
> @@ -190,8 +190,7 @@ int of_pci_get_host_bridge_resources(struct device_node *dev,
>                         struct list_head *resources, resource_size_t *io_base)
>  {
>         struct resource_entry *window;
> -       struct resource *res;
> -       struct resource *bus_range;
> +       struct resource res;
>         struct of_pci_range range;
>         struct of_pci_range_parser parser;
>         char range_type[4];
> @@ -200,24 +199,24 @@ int of_pci_get_host_bridge_resources(struct device_node *dev,
>         if (io_base)
>                 *io_base = (resource_size_t)OF_BAD_ADDR;
>
> -       bus_range = kzalloc(sizeof(*bus_range), GFP_KERNEL);
> -       if (!bus_range)
> -               return -ENOMEM;
> -
>         pr_info("host bridge %s ranges:\n", dev->full_name);
>
> -       err = of_pci_parse_bus_range(dev, bus_range);
> +       err = of_pci_parse_bus_range(dev, &res);
>         if (err) {
> -               bus_range->start = busno;
> -               bus_range->end = bus_max;
> -               bus_range->flags = IORESOURCE_BUS;
> -               pr_info("  No bus range found for %s, using %pR\n",
> -                       dev->full_name, bus_range);
> +               res.start = busno;
> +               res.end = bus_max;
> +               res.flags = IORESOURCE_BUS;
> +               pr_info("  No bus range found for %s\n", dev->full_name);
>         } else {
> -               if (bus_range->end > bus_range->start + bus_max)
> -                       bus_range->end = bus_range->start + bus_max;
> +               if (res.end > res.start + bus_max)
> +                       res.end = res.start + bus_max;
> +       }
> +       window = pci_add_resource(resources, NULL);
> +       if (!window) {
> +               err = -ENOMEM;
> +               goto parse_failed;
>         }
> -       pci_add_resource(resources, bus_range);
> +       *window->res = res;

Well, now this seems racy. You add a blank resource to the list first
and then fill it in.

Rob
