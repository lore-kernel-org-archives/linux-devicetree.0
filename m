From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drivers/of: Add devm_of_iomap()
Date: Tue, 12 Jun 2018 11:42:34 -0600
Message-ID: <CAL_Jsq+dHVN+Y7xczf_Oxcn=BiJ6N9WzovRbSujgLLTYHMEh0g@mail.gmail.com>
References: <23be2945b593a36d8fa1970bb579389c0f892a3e.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <23be2945b593a36d8fa1970bb579389c0f892a3e.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 11, 2018 at 6:01 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> There are still quite a few cases where a device might want to get to a
> different node of the device-tree, obtain the resources and map them.
>
> Drivers doing that currently open code the whole thing, which is error
> proe.
>
> We have of_iomap() and of_io_request_and_map() but they both have shortcomings,
> such as not returning the size of the resource found (which can be necessary)
> and not being "managed".
>
> This adds a devm_of_iomap() that provides all of these and should probably
> replace uses of the above in most drivers.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>
> I'm cooking a driver that uses this, if there's no objection I'd like
> to carry it in my pull request for that driver (it can also exist in
> the DT tree of course). Just let me know.

We generally only use of_iomap when there is no struct device for any
new driver. Why can't you use devm_ioremap_resource? Is this a
non-platform bus device?

>
>  drivers/of/address.c       | 35 +++++++++++++++++++++++++++++++++++
>  include/linux/of_address.h |  5 +++++
>  2 files changed, 40 insertions(+)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index cf83c05f5650..b7d49ee7b690 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -807,6 +807,41 @@ void __iomem *of_io_request_and_map(struct device_node *np, int index,
>  }
>  EXPORT_SYMBOL(of_io_request_and_map);
>
> +/*
> + * devm_of_iomap - Requests a resource and maps the memory mapped IO
> + *                for a given device_node managed by a given device
> + *
> + * Checks that a resource is a valid memory region, requests the memory
> + * region and ioremaps it. All operations are managed and will be undone
> + * on driver detach of the device.
> + *
> + * This is to be used when a device requests/maps resources described
> + * by other device tree nodes (children or otherwise).
> + *
> + * @dev:       The device "managing" the resource
> + * @node:       The device-tree node where the resource resides
> + * @index:     index of the MMIO range in the "reg" property
> + * @size:      Returns the size of the resource (pass NULL if not needed)
> + * Returns a pointer to the requested and mapped memory or an ERR_PTR() encoded
> + * error code on failure. Usage example:
> + *
> + *     base = devm_of_iomap(&pdev->dev, node, 0, NULL);
> + *     if (IS_ERR(base))
> + *             return PTR_ERR(base);
> + */
> +void __iomem *devm_of_iomap(struct device *dev, struct device_node *node, int index,
> +                           resource_size_t *size)

of/address.c generally doesn't depend on struct device. I'd like to
keep it that way.

Rob
