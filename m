From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drivers/of: Add devm_of_iomap()
Date: Thu, 14 Jun 2018 10:27:47 +0200
Message-ID: <CAMuHMdVixknUDYZUHafCqNY02z=T-WC2s+Qh6GkpejmoJU0fuQ@mail.gmail.com>
References: <23be2945b593a36d8fa1970bb579389c0f892a3e.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <23be2945b593a36d8fa1970bb579389c0f892a3e.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Ben,

(the "m68k" later in the thread caught my attention ;-)

On Tue, Jun 12, 2018 at 2:02 AM Benjamin Herrenschmidt
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

Thanks for your patch!

> --- a/include/linux/of_address.h
> +++ b/include/linux/of_address.h
> @@ -40,6 +40,11 @@ extern void __iomem *of_iomap(struct device_node *device, int index);
>  void __iomem *of_io_request_and_map(struct device_node *device,
>                                     int index, const char *name);
>
> +/* Request and map, wrapper on devm_ioremap_resource */
> +extern void __iomem *devm_of_iomap(struct device *dev,
> +                                  struct device_node *node, int index,
> +                                  resource_size_t *size);
> +
>  /* Extract an address from a device, returns the region size and
>   * the address space flags too. The PCI version uses a BAR number
>   * instead of an absolute index

Do you need a dummy for !CONFIG_OF_ADDRESS, to aid compile-testing?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
