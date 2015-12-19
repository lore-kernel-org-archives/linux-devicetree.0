From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V10 7/7] dma: qcom_hidma: add support for object hierarchy
Date: Sat, 19 Dec 2015 20:37:00 +0200
Message-ID: <CAHp75Vd-ku1E4+BWGwtL06mO7EZHFmwCvwFiAhLUVwrJHNKD7w@mail.gmail.com>
References: <1450371684-23415-1-git-send-email-okaya@codeaurora.org>
	<1450371684-23415-8-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450371684-23415-8-git-send-email-okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dmaengine <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 17, 2015 at 7:01 PM, Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrot=
e:
> In order to create a relationship model between the channels and the
> management object, we are adding support for object hierarchy to the
> drivers. This patch simplifies the userspace application development.
> We will not have to traverse different firmware paths based on device
> tree or ACPI baed kernels.
>
> No matter what flavor of kernel is used, objects will be represented =
as
> platform devices.
>
> The new layout is as follows:
>
> hidmam_10: hidma-mgmt@0x5A000000 {
>         compatible =3D "qcom,hidma-mgmt-1.0";
>         ...
>
>         hidma_10: hidma@0x5a010000 {
>                         compatible =3D "qcom,hidma-1.0";
>                         ...
>         }
> }
>
> The hidma_mgmt_init detects each instance of the hidma-mgmt-1.0 objec=
ts
> in device tree and calls into the channel driver to create platform d=
evices
> for each child of the management object.
>
> Signed-off-by: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>


> +What:          /sys/devices/platform/hidma-*/chid
> +               /sys/devices/platform/QCOM8061:*/chid
> +Date:          Dec 2015
> +KernelVersion: 4.4
> +Contact:       "Sinan Kaya <okaya-kIo0bpQILBj9JmXXK+q4OQ@public.gmane.org>"
> +Description:
> +               Contains the ID of the channel within the HIDMA insta=
nce.
> +               It is used to associate a given HIDMA channel with th=
e
> +               priority and weight calls in the management interface=
=2E

> -module_platform_driver(hidma_mgmt_driver);
> +#ifdef CONFIG_OF
> +static int object_counter;
> +
> +static int __init hidma_mgmt_of_populate_channels(struct device_node=
 *np)
> +{
> +       struct platform_device *pdev_parent =3D of_find_device_by_nod=
e(np);
> +       struct platform_device_info pdevinfo;
> +       struct of_phandle_args out_irq;
> +       struct device_node *child;
> +       struct resource *res;
> +       const __be32 *cell;

Always BE ?

> +       int ret =3D 0, size, i, num;
> +       u64 addr, addr_size;

resource_size_t

> +
> +       for_each_available_child_of_node(np, child) {
> +               int iter =3D 0;
> +
> +               cell =3D of_get_property(child, "reg", &size);
> +               if (!cell) {
> +                       ret =3D -EINVAL;
> +                       goto out;
> +               }
> +
> +               size /=3D (sizeof(*cell));

Redundant parens. I think it might be good to use common sense for
operator precedence, here is a radical example of ignoring it. And
this is not the first case.

> +               num =3D size /
> +                       (of_n_addr_cells(child) + of_n_size_cells(chi=
ld)) + 1;
> +
> +               /* allocate a resource array */
> +               res =3D kcalloc(num, sizeof(*res), GFP_KERNEL);
> +               if (!res) {
> +                       ret =3D -ENOMEM;
> +                       goto out;
> +               }
> +
> +               /* read each reg value */
> +               i =3D 0;
> +               while (i < size) {
> +                       addr =3D of_read_number(&cell[i],
> +                                             of_n_addr_cells(child))=
;
> +                       i +=3D of_n_addr_cells(child);
> +
> +                       addr_size =3D of_read_number(&cell[i],
> +                                                  of_n_size_cells(ch=
ild));
> +                       i +=3D of_n_size_cells(child);
> +
> +                       res[iter].start =3D addr;
> +                       res[iter].end =3D res[iter].start + addr_size=
 - 1;
> +                       res[iter].flags =3D IORESOURCE_MEM;

res->start =3D =E2=80=A6
=E2=80=A6
res++;

> +                       iter++;
> +               }
> +
> +               ret =3D of_irq_parse_one(child, 0, &out_irq);
> +               if (ret)
> +                       goto out;
> +
> +               res[iter].start =3D irq_create_of_mapping(&out_irq);
> +               res[iter].name =3D "hidma event irq";
> +               res[iter].flags =3D IORESOURCE_IRQ;

Ditto.

> +
> +               pdevinfo.fwnode =3D &child->fwnode;
> +               pdevinfo.parent =3D pdev_parent ? &pdev_parent->dev :=
 NULL;
> +               pdevinfo.name =3D child->name;
> +               pdevinfo.id =3D object_counter++;
> +               pdevinfo.res =3D res;
> +               pdevinfo.num_res =3D num;
> +               pdevinfo.data =3D NULL;
> +               pdevinfo.size_data =3D 0;
> +               pdevinfo.dma_mask =3D DMA_BIT_MASK(64);
> +               platform_device_register_full(&pdevinfo);
> +
> +               kfree(res);
> +               res =3D NULL;
> +       }
> +out:

> +       kfree(res);


> +
> +       return ret;
> +}
> +#endif
> +
> +static int __init hidma_mgmt_init(void)
> +{
> +#ifdef CONFIG_OF
> +       struct device_node *child;
> +
> +       for (child =3D of_find_matching_node(NULL, hidma_mgmt_match);=
 child;
> +            child =3D of_find_matching_node(child, hidma_mgmt_match)=
) {
> +               /* device tree based firmware here */
> +               hidma_mgmt_of_populate_channels(child);
> +               of_node_put(child);
> +       }

And why this is can't be done in probe of parent node driver?

> +#endif
> +       platform_driver_register(&hidma_mgmt_driver);
> +
> +       return 0;
> +}
> +module_init(hidma_mgmt_init);

--=20
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
