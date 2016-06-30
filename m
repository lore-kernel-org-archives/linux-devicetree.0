From: Franck Jullien <franck.jullien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drivers/of: add option to load a default Device Tree
Date: Thu, 30 Jun 2016 22:57:53 +0200
Message-ID: <CAJfOKBzApf1fNFFmK+=PcnO+J50+XLqNndAWOVQmvPwzZ5iy0g@mail.gmail.com>
References: <1466607954-2821-1-git-send-email-franck.jullien@odyssee-systemes.fr>
 <576C2A22.2020103@gmail.com> <86d0de95-9b74-81ca-bcf4-e6e41b95ea9a@odyssee-systemes.fr>
 <5774FA17.7020501@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5774FA17.7020501-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Carlos Palminha <CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

2016-06-30 12:53 GMT+02:00 Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>:
> Hi Franck,
>
> ++ Carlos
>
> On 24-06-2016 09:15, Franck Jullien wrote:
>> Le 23/06/2016 =C3=A0 20:27, Frank Rowand a =C3=A9crit :
>>> On 06/22/16 08:05, Franck Jullien wrote:
>>>> Even if a platform doesn't use a device tree during its
>>>> boot process it can be useful to enable CONFIG_OF and get
>>>> an empty device tree.
>>>>
>>>> Then, devices can use device tree overlays to populate this
>>>> default tree.
>>>
>>> Hi Franck,
>>>
>>> Can you elaborate on the problem that you are trying to
>>> solve and the use cases that you are envisioning?
>>>
>>> Thanks,
>>>
>>> Frank
>>>
>> Hi,
>>
>> The idea behind this patch is to describe devices that are in a FPGA
>> which is itself connected to the platform through PCIe. The platform
>> might not use a devicetree for its own configuration. That's why we =
need
>> this patch.
>
> This sure looks interesting to us because we are using the
> exactly same setup (x86_64 + FPGA through PCIe). As I said before
> in the DMA mailing list our approach was different: we use
> platform data in each driver and we register them using a PCI
> driver which passes all the required parameters. Still, we were
> wondering if your approach can save us development time in the
> future. So, I have a few questions that I was hoping you could
> answer.
>
>>
>> There is an ongoing  discussion about this subject [1].
>>
>> I have a working setup (on a x86_64) using this principle. I have
>> created a pci resources proxy module which is parent of all devices =
on
>> the FPGA. This is an example of binding:
>>
>>       proxy: pci1337_0001 {
>>               #address-cells =3D <1>;
>>               #size-cells =3D <1>;
>>               #interrupt-cells =3D <1>;
>>               vendor-id =3D <0x00001337>;
>>               device-id =3D <0x00000001>;
>>               compatible =3D "pci1337,0001",
>>                            "generic,pci-proxy";
>>               interrupt-controller;
>>               /* Ranges will be overwritten during probe */
>>               ranges =3D <0 0 0xA0000000 0x100000     /* BAR 0 */
>>                         1 0 0xB0000000 0x100000     /* BAR 1 */
>>                         2 0 0xC0000000 0x100000>;   /* BAR 2 */
>>       };
>>
>> Ranges are dynamically updated on probe with regards to FPGA bars.
>> This node is attached to the tree (an empty tree in my case) from th=
e
>> client module.
>
> I am not fully understanding where does this binding is added.
> You use your patches to create an empty device tree or a device
> tree where the FPGA is declared?

The patch creates an empty devicetree. In my setup, I have two modules:

- pci-proxy, which is independant of the functionnal part of the board.

- my_module, where the node above is attached to the root node. This
module also creates the overlay.

>
>>
>> Then FPGA devices nodes are added using overlay. This is an example:
>>
>> /dts-v1/;
>> / {
>>       #address-cells =3D <1>;
>>       #size-cells =3D <1>;
>>
>>       fragment@0 {
>>               target-path =3D "/pci1337_0001";
>>               __overlay__ {
>>
>>                       #address-cells =3D <2>;
>>                       #size-cells =3D <1>;
>>                       interrupt-parent =3D <&proxy>;
>>
>>                       osc: oscillator {
>>                               compatible =3D "fixed-clock";
>>                               #clock-cells =3D <1>;
>>                               clock-frequency  =3D <148500000>;
>>                               clock-output-names =3D "osc";
>>                       };
>>                       enet0: ethoc {
>>                               compatible =3D "opencores,ethoc";
>>                               reg =3D <1 0x50000 0x100>;
>>                               interrupts =3D <0>;
>>                       };
>>                       gpio0: gpio {
>>                               #gpio-cells =3D <2>;
>>                               compatible =3D "xlnx,xps-gpio-1.00.a";
>>                               reg =3D <0 0x30000 0x10000>;
>>                               gpio-controller;
>>                       };
>>               };
>>       };
>>
>>
>> };
>>
>> Interrupts property are dynamically modified before the overlay is
>> applied. By the way, I had to do a little hack here in the pci-proxy=
=2E
>> I did not declare a new interrupt domain. What I did is to get the P=
CI
>> interrupt domain (IO-APIC on my platform):
>>
>> irq_data =3D irq_get_irq_data(priv->pci_dev->irq);
>> domain_parent =3D irq_data->domain;
>>
>> and then set fwnode of IO-APIC to pci-proxy fwnode so
>> irq_create_of_mapping get IO-APIC's domain:
>>
>> domain_parent->fwnode =3D &np->fwnode;
>
> In my case we have an interrupt controller driver which is
> embedded into the PCI driver so I also can't use the generic PCI
> proxy without modifying it. Can this controller be declared in
> the overlay device tree and then make the remaining drivers use
> the domain created?

Yes you can. In my current work, pci-proxy is not an interrupt controll=
er
anymore. I created a io-apic node (which is here just to get a fwnode
reference) which is interrupt parent of other nodes in the overlay.

>
>>
>> There might be a better way to make things work.
>>
>> Beside this patch I needed to export of_attach_node and of_detach_no=
de.
>> This will be another patch.
>
> There is still one more thing: By default CONFIG_OF is not
> enabled in x86_64 so you need to enable this, right? Shouldn't a
> "select OF" be added to your kconfig entry?
>

You're right. CONFIG_OF still need to be enabled.

=46ranck.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
