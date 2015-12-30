From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V10 7/7] dma: qcom_hidma: add support for object hierarchy
Date: Wed, 30 Dec 2015 10:28:30 -0500
Message-ID: <5683F81E.5050406@codeaurora.org>
References: <1450371684-23415-1-git-send-email-okaya@codeaurora.org>
 <1450371684-23415-8-git-send-email-okaya@codeaurora.org>
 <CAHp75Vd-ku1E4+BWGwtL06mO7EZHFmwCvwFiAhLUVwrJHNKD7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vd-ku1E4+BWGwtL06mO7EZHFmwCvwFiAhLUVwrJHNKD7w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: dmaengine <dmaengine@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Timur Tabi <timur@codeaurora.org>, devicetree <devicetree@vger.kernel.org>, cov@codeaurora.org, Vinod Koul <vinod.koul@intel.com>, jcm@redhat.com, Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 12/19/2015 1:37 PM, Andy Shevchenko wrote:
> On Thu, Dec 17, 2015 at 7:01 PM, Sinan Kaya <okaya@codeaurora.org> wr=
ote:
>> In order to create a relationship model between the channels and the
>> management object, we are adding support for object hierarchy to the
>> drivers. This patch simplifies the userspace application development=
=2E
>> We will not have to traverse different firmware paths based on devic=
e
>> tree or ACPI baed kernels.
>>
>> No matter what flavor of kernel is used, objects will be represented=
 as
>> platform devices.
>>
>> The new layout is as follows:
>>
>> hidmam_10: hidma-mgmt@0x5A000000 {
>>         compatible =3D "qcom,hidma-mgmt-1.0";
>>         ...
>>
>>         hidma_10: hidma@0x5a010000 {
>>                         compatible =3D "qcom,hidma-1.0";
>>                         ...
>>         }
>> }
>>
>> The hidma_mgmt_init detects each instance of the hidma-mgmt-1.0 obje=
cts
>> in device tree and calls into the channel driver to create platform =
devices
>> for each child of the management object.
>>
>> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
>=20
>=20
>> +What:          /sys/devices/platform/hidma-*/chid
>> +               /sys/devices/platform/QCOM8061:*/chid
>> +Date:          Dec 2015
>> +KernelVersion: 4.4
>> +Contact:       "Sinan Kaya <okaya@cudeaurora.org>"
>> +Description:
>> +               Contains the ID of the channel within the HIDMA inst=
ance.
>> +               It is used to associate a given HIDMA channel with t=
he
>> +               priority and weight calls in the management interfac=
e.
>=20
>> -module_platform_driver(hidma_mgmt_driver);
>> +#ifdef CONFIG_OF
>> +static int object_counter;
>> +
>> +static int __init hidma_mgmt_of_populate_channels(struct device_nod=
e *np)
>> +{
>> +       struct platform_device *pdev_parent =3D of_find_device_by_no=
de(np);
>> +       struct platform_device_info pdevinfo;
>> +       struct of_phandle_args out_irq;
>> +       struct device_node *child;
>> +       struct resource *res;
>> +       const __be32 *cell;
>=20
> Always BE ?

Yes, as Timur indicated device tree is big endian all the time.
>=20
>> +       int ret =3D 0, size, i, num;
>> +       u64 addr, addr_size;
>=20
> resource_size_t

These values are read from the device tree blob using of_read_number fu=
nction. of_read_number
returns a u64.
>=20
>> +
>> +       for_each_available_child_of_node(np, child) {
>> +               int iter =3D 0;
>> +
>> +               cell =3D of_get_property(child, "reg", &size);
>> +               if (!cell) {
>> +                       ret =3D -EINVAL;
>> +                       goto out;
>> +               }
>> +
>> +               size /=3D (sizeof(*cell));
>=20
> Redundant parens. I think it might be good to use common sense for
> operator precedence, here is a radical example of ignoring it. And
> this is not the first case.

Removed. Note that I copied most of this function from another driver.=20

>=20
>> +               num =3D size /
>> +                       (of_n_addr_cells(child) + of_n_size_cells(ch=
ild)) + 1;
>> +
>> +               /* allocate a resource array */
>> +               res =3D kcalloc(num, sizeof(*res), GFP_KERNEL);
>> +               if (!res) {
>> +                       ret =3D -ENOMEM;
>> +                       goto out;
>> +               }
>> +
>> +               /* read each reg value */
>> +               i =3D 0;
>> +               while (i < size) {
>> +                       addr =3D of_read_number(&cell[i],
>> +                                             of_n_addr_cells(child)=
);
>> +                       i +=3D of_n_addr_cells(child);
>> +
>> +                       addr_size =3D of_read_number(&cell[i],
>> +                                                  of_n_size_cells(c=
hild));
>> +                       i +=3D of_n_size_cells(child);
>> +
>> +                       res[iter].start =3D addr;
>> +                       res[iter].end =3D res[iter].start + addr_siz=
e - 1;
>> +                       res[iter].flags =3D IORESOURCE_MEM;
>=20
> res->start =3D =E2=80=A6
> =E2=80=A6
> res++;

ok

>=20
>> +                       iter++;
>> +               }
>> +
>> +               ret =3D of_irq_parse_one(child, 0, &out_irq);
>> +               if (ret)
>> +                       goto out;
>> +
>> +               res[iter].start =3D irq_create_of_mapping(&out_irq);
>> +               res[iter].name =3D "hidma event irq";
>> +               res[iter].flags =3D IORESOURCE_IRQ;
>=20
> Ditto.
ok

>=20
>> +
>> +               pdevinfo.fwnode =3D &child->fwnode;
>> +               pdevinfo.parent =3D pdev_parent ? &pdev_parent->dev =
: NULL;
>> +               pdevinfo.name =3D child->name;
>> +               pdevinfo.id =3D object_counter++;
>> +               pdevinfo.res =3D res;
>> +               pdevinfo.num_res =3D num;
>> +               pdevinfo.data =3D NULL;
>> +               pdevinfo.size_data =3D 0;
>> +               pdevinfo.dma_mask =3D DMA_BIT_MASK(64);
>> +               platform_device_register_full(&pdevinfo);
>> +
>> +               kfree(res);
>> +               res =3D NULL;
>> +       }
>> +out:
>=20
>> +       kfree(res);
>=20
>=20
>> +
>> +       return ret;
>> +}
>> +#endif
>> +
>> +static int __init hidma_mgmt_init(void)
>> +{
>> +#ifdef CONFIG_OF
>> +       struct device_node *child;
>> +
>> +       for (child =3D of_find_matching_node(NULL, hidma_mgmt_match)=
; child;
>> +            child =3D of_find_matching_node(child, hidma_mgmt_match=
)) {
>> +               /* device tree based firmware here */
>> +               hidma_mgmt_of_populate_channels(child);
>> +               of_node_put(child);
>> +       }
>=20
> And why this is can't be done in probe of parent node driver?

The populate function creates platform objects using platform_device_re=
gister_full function above.=20
The hidma device driver later probes the object during object enumerati=
on phase.=20

I tried moving platform_device_register_full into the probe context. Th=
e objects got generated but hidma=20
device driver didn't probe the object. I suppose we are required to cre=
ate the objects before the probing starts.

I copied this pattern from another driver.

>=20
>> +#endif
>> +       platform_driver_register(&hidma_mgmt_driver);
>> +
>> +       return 0;
>> +}
>> +module_init(hidma_mgmt_init);
>=20


--=20
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, In=
c.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Li=
nux Foundation Collaborative Project
