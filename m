From: Jingoo Han <jingoohan1@gmail.com>
Subject: Re: [PATCH v6] PCI: Store PCIe bus address in struct of_pci_range
Date: Tue, 4 Aug 2015 13:19:50 +0900
Message-ID: <7F6386B4-D2F5-4840-AC72-F8C76CBC3B94@gmail.com>
References: <1438010223-124422-1-git-send-email-gabriele.paoloni@huawei.com> <20150729172053.GE31170@google.com> <EE11001F9E5DDD47B7634E2F8A612F2E01D6F350@lhreml503-mbs> <CAL_JsqKs11-sXQTdBD+ZjbVYFWUHBARTW9q5MF1hCXUhZ+nWLQ@mail.gmail.com> <EE11001F9E5DDD47B7634E2F8A612F2E01D6F94A@lhreml503-mbs> <20150730161447.GG9640@google.com> <EE11001F9E5DDD47B7634E2F8A612F2E01D6FB3B@lhreml503-mbs> <20150730171445.GI9640@google.com> <EE11001F9E5DDD47B7634E2F8A612F2E01D6FC15@lhreml503-mbs> <CAL_Jsq+aQVakaZf4xo7sxnVyTmPR+HJ-9ByyS6OYJ0PHDYOwmg@mail.gmail.com> <EE11001F9E5DDD47B7634E2F8A612F2E01D70589@lhreml503-mbs> <55BB8CC6.1080203@ti.com> <CAL_JsqJqjiWVaKs-3ghQ1EBQzRRQ38GzkMV+FELPj53bSF-yXQ@mail.gmail.com> <EE11001F9E5DDD47B7634E2F8A612F2E01D712E7@lhreml503-mbs>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <EE11001F9E5DDD47B7634E2F8A612F2E01D712E7@lhreml503-mbs>
Sender: linux-pci-owner@vger.kernel.org
To: Gabriele Paoloni <gabriele.paoloni@huawei.com>
Cc: Rob Herring <robherring2@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Bjorn Helgaas <bhelgaas@google.com>, "arnd@arndb.de" <arnd@arndb.de>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "james.morse@arm.com" <james.morse@arm.com>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Yuanzhichang <yuanzhichang@hisilicon.com>, Zhudacai <zhudacai@hisilicon.com>, zhangjukuo <zhangjukuo@huawei.com>, qiuzhenfa <qiuzhenfa@hisilicon.com>, "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>, Pratyush Anand <pratyush.anand@gmail.com>, Arnd Bergmann <arnd@linaro.org>, jingoohan1@gmail.com
List-Id: devicetree@vger.kernel.org

On 2015. 8. 3., at PM 8:18, Gabriele Paoloni <gabriele.paoloni@huawei.c=
om> wrote:
>=20
> Rob, Kishon what about the following solution?....
>=20
> ---
> drivers/pci/host/pci-dra7xx.c      | 12 ++++++++++++
> drivers/pci/host/pcie-designware.c |  9 +++------

Hi Paoloni,

OK, it looks good.
I want you to revert the following patch.=20

commit "f4c55c5a3f7f (PCI: designware: Program ATU with untranslated ad=
dress)"

Would you remove all '*_mode_base's?

Best regards,
Jingoo Han

> 2 files changed, 15 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/pci/host/pci-dra7xx.c b/drivers/pci/host/pci-dra=
7xx.c
> index 80db09e..bb2635f 100644
> --- a/drivers/pci/host/pci-dra7xx.c
> +++ b/drivers/pci/host/pci-dra7xx.c
> @@ -61,6 +61,7 @@
>=20
> #define    PCIECTRL_DRA7XX_CONF_PHY_CS            0x010C
> #define    LINK_UP                        BIT(16)
> +#define CPU_TO_BUS_ADDR             0x0FFFFFFF
>=20
> struct dra7xx_pcie {
>    void __iomem        *base;
> @@ -138,6 +139,17 @@ static void dra7xx_pcie_enable_interrupts(struct=
 pcie_port *pp)
>=20
> static void dra7xx_pcie_host_init(struct pcie_port *pp)
> {
> +    if (pp->io_mod_base)
> +        pp->io_mod_base &=3D CPU_TO_BUS_ADDR;
> +
> +    if (pp->mem_mod_base)
> +        pp->mem_mod_base &=3D CPU_TO_BUS_ADDR;
> +
> +    if (pp->cfg0_mod_base) {
> +        pp->cfg0_mod_base &=3D CPU_TO_BUS_ADDR;
> +        pp->cfg1_mod_base &=3D CPU_TO_BUS_ADDR;
> +    }
> +
>    dw_pcie_setup_rc(pp);
>    dra7xx_pcie_establish_link(pp);
>    if (IS_ENABLED(CONFIG_PCI_MSI))
> diff --git a/drivers/pci/host/pcie-designware.c b/drivers/pci/host/pc=
ie-designware.c
> index 69486be..06c682b 100644
> --- a/drivers/pci/host/pcie-designware.c
> +++ b/drivers/pci/host/pcie-designware.c
> @@ -416,8 +416,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
>            pp->io_base =3D range.cpu_addr;
>=20
>            /* Find the untranslated IO space address */
> -            pp->io_mod_base =3D of_read_number(parser.range -
> -                             parser.np + na, ns);
> +            pp->io_mod_base =3D range.cpu_addr;;
>        }
>        if (restype =3D=3D IORESOURCE_MEM) {
>            of_pci_range_to_resource(&range, np, &pp->mem);
> @@ -426,8 +425,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
>            pp->mem_bus_addr =3D range.pci_addr;
>=20
>            /* Find the untranslated MEM space address */
> -            pp->mem_mod_base =3D of_read_number(parser.range -
> -                              parser.np + na, ns);
> +            pp->mem_mod_base =3D range.cpu_addr;
>        }
>        if (restype =3D=3D 0) {
>            of_pci_range_to_resource(&range, np, &pp->cfg);
> @@ -437,8 +435,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
>            pp->cfg1_base =3D pp->cfg.start + pp->cfg0_size;
>=20
>            /* Find the untranslated configuration space address */
> -            pp->cfg0_mod_base =3D of_read_number(parser.range -
> -                               parser.np + na, ns);
> +            pp->cfg0_mod_base =3D range.cpu_addr;
>            pp->cfg1_mod_base =3D pp->cfg0_mod_base +
>                        pp->cfg0_size;
>        }
> --=20
> 1.9.1
>=20
>=20
>> -----Original Message-----
>> From: linux-pci-owner@vger.kernel.org [mailto:linux-pci-
>> owner@vger.kernel.org] On Behalf Of Rob Herring
>> Sent: Friday, July 31, 2015 5:53 PM
>> To: Kishon Vijay Abraham I
>> Cc: Gabriele Paoloni; Bjorn Helgaas; arnd@arndb.de;
>> lorenzo.pieralisi@arm.com; Wangzhou (B); robh+dt@kernel.org;
>> james.morse@arm.com; Liviu.Dudau@arm.com; linux-pci@vger.kernel.org;
>> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
>> Yuanzhichang; Zhudacai; zhangjukuo; qiuzhenfa; Liguozhu (Kenneth);
>> Jingoo Han; Pratyush Anand; Arnd Bergmann
>> Subject: Re: [PATCH v6] PCI: Store PCIe bus address in struct
>> of_pci_range
>>=20
>> On Fri, Jul 31, 2015 at 9:57 AM, Kishon Vijay Abraham I <kishon@ti.c=
om>
>> wrote:
>>> +Arnd
>>>=20
>>> Hi,
>>>=20
>>>> On Friday 31 July 2015 07:55 PM, Gabriele Paoloni wrote:
>>>> [+cc Kishon]
>>>>=20
>>>>> -----Original Message-----
>>>>> From: linux-pci-owner@vger.kernel.org [mailto:linux-pci-
>>>>> owner@vger.kernel.org] On Behalf Of Rob Herring
>>>>> Sent: Thursday, July 30, 2015 9:42 PM
>>>>> To: Gabriele Paoloni
>>>>> Cc: Bjorn Helgaas; arnd@arndb.de; lorenzo.pieralisi@arm.com;
>> Wangzhou
>>>>> (B); robh+dt@kernel.org; james.morse@arm.com; Liviu.Dudau@arm.com=
;
>>>>> linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>>>>> devicetree@vger.kernel.org; Yuanzhichang; Zhudacai; zhangjukuo;
>>>>> qiuzhenfa; Liguozhu (Kenneth); Jingoo Han; Pratyush Anand
>>>>> Subject: Re: [PATCH v6] PCI: Store PCIe bus address in struct
>>>>> of_pci_range
>>>>>=20
>>>>> On Thu, Jul 30, 2015 at 12:34 PM, Gabriele Paoloni
>>>>> <gabriele.paoloni@huawei.com> wrote:
>>>>>>> -----Original Message-----
>>>>>>> From: Bjorn Helgaas [mailto:bhelgaas@google.com]
>>>>>>> Sent: 30 July 2015 18:15
>>>>>>> On Thu, Jul 30, 2015 at 04:50:55PM +0000, Gabriele Paoloni wrot=
e:
>>>>>>>>> -----Original Message-----
>>>>>>>>> From: linux-pci-owner@vger.kernel.org [mailto:linux-pci-
>>>>>>>>> owner@vger.kernel.org] On Behalf Of Bjorn Helgaas
>>>>>>>>> Sent: Thursday, July 30, 2015 5:15 PM
>>>>>>>>> On Thu, Jul 30, 2015 at 01:52:13PM +0000, Gabriele Paoloni
>> wrote:
>>>>>=20
>>>>> [...]
>>>>>=20
>>>>>>>>>> I don=A1=AFt think we should rely on [CPU] addresses...what =
if the
>>>>>>>>> intermediate
>>>>>>>>>> translation layer changes the lower significant bits of the
>>>>> "bus
>>>>>>>>> address"
>>>>>>>>>> to translate into a cpu address?
>>>>>>>>>=20
>>>>>>>>> Is it really a possiblity that the lower bits could be change=
d?
>>>>>>>>=20
>>>>>>>> I've checked all the current deignware users DTs except "pci-
>>>>>>> layerscape"
>>>>>>>> that I could not find:
>>>>>>>> spear1310.dtsi
>>>>>>>> spear1340.dtsi
>>>>>>>> dra7.dtsi
>>>>>>>> imx6qdl.dtsi
>>>>>>>> imx6sx.dtsi
>>>>>>>> keystone.dtsi
>>>>>>>> exynos5440.dtsi
>>>>>>>>=20
>>>>>>>> None of them modifies the lower bits. To be more precise the
>> only
>>>>> guy
>>>>>>>> that provides another translation layer is "dra7.dtsi":
>>>>>>>> axi0
>>>>>>>> http://lxr.free-
>>>>> electrons.com/source/arch/arm/boot/dts/dra7.dtsi#L207
>>>>>>>>=20
>>>>>>>> axi1
>>>>>>>> http://lxr.free-
>>>>> electrons.com/source/arch/arm/boot/dts/dra7.dtsi#L241
>>>>>>>>=20
>>>>>>>> For this case masking the top 4bits (bits28 to 31) should make
>> the
>>>>> job.
>>>>>=20
>>>>> IMO, we should just fix this case. After further study, I don't
>> think
>>>>> this is a DW issue, but rather an SOC integration issue.
>>>>>=20
>>>>> I believe you can just fixup the address in the pp->ops->host_ini=
t
>> hook.
>>>>=20
>>>> Yes I guess that I could just assign pp->(*)_mod_base to the CPU
>> address
>>>> in DW and mask it out in dra7xx_pcie_host_init()...
>>>>=20
>>>> Kishon, would you be ok with that?
>>>=20
>>> Initially I was using *base-mask* property from dt. Me and Arnd
>> (cc'ed) had
>>> this discussion [1] before we decided the current approach. It'll b=
e
>> good to
>>> check with Arnd too.
>>>=20
>>> [1] ->  http://lists.infradead.org/pipermail/linux-arm-kernel/2014-
>> May/253528.html
>>=20
>> The problem I have here is the use of ranges does not necessarily me=
an
>> fewer address bits are available. It can be used just for convenienc=
e
>> of not putting the full address into every node's reg property. And
>> vice versa, there are probably plenty of cases where we have the ful=
l
>> address in the nodes, but really only some of the address bits are
>> decoded at the IP block. Whether the address bits are present is
>> rarely cared about or known by s/w folks until you hit a problem lik=
e
>> this. Given this is an isolated case ATM, I would fix it in an
>> isolated way. It does not affect the binding and could be changed in
>> the kernel later if this becomes a common need.
>>=20
>> Rob
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-pci"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
