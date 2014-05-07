From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] devicetree: set bus type same as parent
Date: Wed, 7 May 2014 16:17:10 +0100
Message-ID: <CACxGe6tczi3Vjj44SvXNf+qER0LE_zGd83dJEQauyzD0H8=VMw@mail.gmail.com>
References: <536982E3.10303@gmail.com> <53698380.1060006@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53698380.1060006-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 7, 2014 at 1:51 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>
> This is a somewhat scary patch since it touches a path that is central to
> device creation based on the device tree.  It should not be applied without
> careful consideration.
>
> I am not sure if this patch is a good idea, even if it does not break
> anything.
>
> An issue with the path of SPMI nodes under /sys/bus/... was reported in
> https://lkml.org/lkml/2014/4/23/312.  The symptom is that two different
> grandchild nodes of the spmi with the same node-name@unit-address will
> result in attempting to create duplicate links at
> /sys/bus/platform/devices/unit-address.node-name.  It turns out that the
> specific example provided might not be an expected configuration for
> current hardware, but the reported trap remains an issue.
>
> The common pattern exposed is a driver probe function calling
> of_platform_populate() to create child devices.  As the reporting
> email noted, the devices are created with dev.bus set to
> platform_bus_type.  Thus all devices created via this pattern will
> result in a link in /sys/bus/platform/devices/, with the risk that
> a name collision will occur.
>
> This patch reduces the scope of possible name collisions to devices
> on the same bus type.  This is still not ideal, because a legal
> device tree source file can result in run time errors.  In the case
> of SPMI nodes, the collisions will occur in /bus/spmi/devices/.
>
> I have not investigated whether other drivers would be negatively impacted
> by this change - there are 26 drivers in tree that call of_platform_populate().
>
> Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> ---
>  drivers/of/platform.c |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> Index: b/drivers/of/platform.c
> ===================================================================
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -217,7 +217,10 @@ static struct platform_device *of_platfo
>         dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
>         if (!dev->dev.dma_mask)
>                 dev->dev.dma_mask = &dev->dev.coherent_dma_mask;
> -       dev->dev.bus = &platform_bus_type;
> +       if (parent && parent->bus)
> +               dev->dev.bus = parent->bus;
> +       else
> +               dev->dev.bus = &platform_bus_type;

Yeah, this is a very wrong thing to do. It makes the device accessible
to the other bus types behaviour and most likely will result in
container_of() being used on the struct device to get the other bus
types container structure. It is a very bad idea.

I also suspect that you're conflating the concept of a bus_type and
the instance of a bus (like the platform bus) in the /sys/devices/
hierarchy. Among other things, a bus_type contains a list of drivers
and a list of devices that can potentially be bound together because
they use the same interface.

"platform_bus" on the other hand isn't really a device at all. It is a
bare struct device with no bus type and no behaviour. It exists merely
as a container for other devices. By default, any platform_device that
gets registered will be added as a child of platform_bus unless the
parent pointer is already assigned to something else.

The device hierarchy can pretty much be anything. A child can have any
bus type regardless of the bus type of the parent. Individual
subsystems will put restrictions on this (ie. all children of i2c bus
instances will use the i2c bus type), but the driver core is very
flexible.

The reason we use platform_bus_type so extensively is that there are a
very large number of devices that don't have any bus behaviour
expectations. No hot plug. No auto detection. Usually memory mapped.
The device just exists and is immediately accessible by the system.

g.

>         dev->dev.platform_data = platform_data;
>
>         /* We do not fill the DMA ops for platform devices by default.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
