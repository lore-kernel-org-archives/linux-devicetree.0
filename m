From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] [RFC] of/platform: Make of_dev_node_match() helper public
Date: Fri, 5 May 2017 21:13:39 +0200
Message-ID: <CAMuHMdUqKotXhpn_f_4BxLkufetYayDMHLP-QkAt9ze4RBKqqA@mail.gmail.com>
References: <1493995961-11828-1-git-send-email-geert+renesas@glider.be> <CAL_JsqKn8CVTMvjD_JwBUENXs9YgsybkVv1PeLQHMB0EDMWbrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKn8CVTMvjD_JwBUENXs9YgsybkVv1PeLQHMB0EDMWbrg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Fri, May 5, 2017 at 8:50 PM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, May 5, 2017 at 9:52 AM, Geert Uytterhoeven
> <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org> wrote:
>> Several drivers provide their own match functions, identical to
>> of_dev_node_match() in the OF platform core.
>>
>> Reduce duplication by making of_dev_node_match() public.
>> To avoid conflicts, the duplicates in coresight and i2c must be removed
>> at the same time.
>
> I think you are down one level too far. At least the 2 users here are
> just for calls to bus_find_device. We already have a function for that

There are more of them, some used with driver_find_device().
class_find_device() need a slightly different version, as the data pointer
is const. E.g. drivers/spi/spi.c uses both variants...

device_find_child() can use the same callback.

> with of_find_device_by_node at least for platform devices. Perhaps
> rework that to be "struct device *of_find_bus_device_by_node(struct
> bus_type *b, struct device_node *np)" and then wrappers for each bus
> type. And perhaps make a class variant as well. However, we should
> also consider if OF is the right level. Maybe it should be fwnode
> functions?

There are only 2 of these:

$ git grep 'dev->fwnode == data'
drivers/iommu/arm-smmu-v3.c:    return dev->fwnode == data;
drivers/iommu/arm-smmu.c:       return dev->fwnode == data;
$

while you can find a few dozen of the OF callbacks.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
