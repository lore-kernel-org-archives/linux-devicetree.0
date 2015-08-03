From: Jingoo Han <jingoohan1@gmail.com>
Subject: Re: [PATCH v6] PCI: Store PCIe bus address in struct of_pci_range
Date: Mon, 3 Aug 2015 23:41:20 +0900
Message-ID: <D6845CEF-67C3-4777-A219-D224C84BACE4@gmail.com>
References: <1438010223-124422-1-git-send-email-gabriele.paoloni@huawei.com> <20150729172053.GE31170@google.com> <EE11001F9E5DDD47B7634E2F8A612F2E01D6F350@lhreml503-mbs> <CAL_JsqKs11-sXQTdBD+ZjbVYFWUHBARTW9q5MF1hCXUhZ+nWLQ@mail.gmail.com> <EE11001F9E5DDD47B7634E2F8A612F2E01D6F94A@lhreml503-mbs> <20150730161447.GG9640@google.com> <EE11001F9E5DDD47B7634E2F8A612F2E01D6FB3B@lhreml503-mbs> <20150730171445.GI9640@google.com> <EE11001F9E5DDD47B7634E2F8A612F2E01D6FC15@lhreml503-mbs> <CAL_Jsq+aQVakaZf4xo7sxnVyTmPR+HJ-9ByyS6OYJ0PHDYOwmg@mail.gmail.com> <EE11001F9E5DDD47B7634E2F8A612F2E01D70589@lhreml503-mbs> <55BB8CC6.1080203@ti.com> <EE11001F9E5DDD47B7634E2F8A612F2E01D70641@lhreml503-mbs>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <EE11001F9E5DDD47B7634E2F8A612F2E01D70641@lhreml503-mbs>
Sender: linux-pci-owner@vger.kernel.org
To: Gabriele Paoloni <gabriele.paoloni@huawei.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robherring2@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, "arnd@arndb.de" <arnd@arndb.de>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "james.morse@arm.com" <james.morse@arm.com>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Yuanzhichang <yuanzhichang@hisilicon.com>, Zhudacai <zhudacai@hisilicon.com>, zhangjukuo <zhangjukuo@huawei.com>, qiuzhenfa <qiuzhenfa@hisilicon.com>, "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>, Pratyush Anand <pratyush.anand@gmail.com>, Arnd Bergmann <arnd@linaro.org>, "jingoohan1@gmail.com" <jin>
List-Id: devicetree@vger.kernel.org

On 2015. 8. 1., at AM 12:09, Gabriele Paoloni <gabriele.paoloni@huawei.=
com> wrote:
>=20
>> -----Original Message-----
>> From: Kishon Vijay Abraham I [mailto:kishon@ti.com]
>> Sent: Friday, July 31, 2015 3:57 PM
>> To: Gabriele Paoloni; Rob Herring
>> Cc: Bjorn Helgaas; arnd@arndb.de; lorenzo.pieralisi@arm.com; Wangzho=
u
>> (B); robh+dt@kernel.org; james.morse@arm.com; Liviu.Dudau@arm.com;
>> linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>> devicetree@vger.kernel.org; Yuanzhichang; Zhudacai; zhangjukuo;
>> qiuzhenfa; Liguozhu (Kenneth); Jingoo Han; Pratyush Anand; Arnd
>> Bergmann; Arnd Bergmann
>> Subject: Re: [PATCH v6] PCI: Store PCIe bus address in struct
>> of_pci_range
>>=20
>> +Arnd
>>=20
>> Hi,
>>=20
>>> On Friday 31 July 2015 07:55 PM, Gabriele Paoloni wrote:
>>> [+cc Kishon]
>>>=20
>>>> -----Original Message-----
>>>> From: linux-pci-owner@vger.kernel.org [mailto:linux-pci-
>>>> owner@vger.kernel.org] On Behalf Of Rob Herring
>>>> Sent: Thursday, July 30, 2015 9:42 PM
>>>> To: Gabriele Paoloni
>>>> Cc: Bjorn Helgaas; arnd@arndb.de; lorenzo.pieralisi@arm.com;
>> Wangzhou
>>>> (B); robh+dt@kernel.org; james.morse@arm.com; Liviu.Dudau@arm.com;
>>>> linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>>>> devicetree@vger.kernel.org; Yuanzhichang; Zhudacai; zhangjukuo;
>>>> qiuzhenfa; Liguozhu (Kenneth); Jingoo Han; Pratyush Anand
>>>> Subject: Re: [PATCH v6] PCI: Store PCIe bus address in struct
>>>> of_pci_range
>>>>=20
>>>> On Thu, Jul 30, 2015 at 12:34 PM, Gabriele Paoloni
>>>> <gabriele.paoloni@huawei.com> wrote:
>>>>>> -----Original Message-----
>>>>>> From: Bjorn Helgaas [mailto:bhelgaas@google.com]
>>>>>> Sent: 30 July 2015 18:15
>>>>>> On Thu, Jul 30, 2015 at 04:50:55PM +0000, Gabriele Paoloni wrote=
:
>>>>>>>> -----Original Message-----
>>>>>>>> From: linux-pci-owner@vger.kernel.org [mailto:linux-pci-
>>>>>>>> owner@vger.kernel.org] On Behalf Of Bjorn Helgaas
>>>>>>>> Sent: Thursday, July 30, 2015 5:15 PM
>>>>>>>> On Thu, Jul 30, 2015 at 01:52:13PM +0000, Gabriele Paoloni wro=
te:
>>>>=20
>>>> [...]
>>>>=20
>>>>>>>>> I don=A1=AFt think we should rely on [CPU] addresses...what i=
f the
>>>>>>>> intermediate
>>>>>>>>> translation layer changes the lower significant bits of the
>>>> "bus
>>>>>>>> address"
>>>>>>>>> to translate into a cpu address?
>>>>>>>>=20
>>>>>>>> Is it really a possiblity that the lower bits could be changed=
?
>>>>>>>=20
>>>>>>> I've checked all the current deignware users DTs except "pci-
>>>>>> layerscape"
>>>>>>> that I could not find:
>>>>>>> spear1310.dtsi
>>>>>>> spear1340.dtsi
>>>>>>> dra7.dtsi
>>>>>>> imx6qdl.dtsi
>>>>>>> imx6sx.dtsi
>>>>>>> keystone.dtsi
>>>>>>> exynos5440.dtsi
>>>>>>>=20
>>>>>>> None of them modifies the lower bits. To be more precise the on=
ly
>>>> guy
>>>>>>> that provides another translation layer is "dra7.dtsi":
>>>>>>> axi0
>>>>>>> http://lxr.free-
>>>> electrons.com/source/arch/arm/boot/dts/dra7.dtsi#L207
>>>>>>>=20
>>>>>>> axi1
>>>>>>> http://lxr.free-
>>>> electrons.com/source/arch/arm/boot/dts/dra7.dtsi#L241
>>>>>>>=20
>>>>>>> For this case masking the top 4bits (bits28 to 31) should make
>> the
>>>> job.
>>>>=20
>>>> IMO, we should just fix this case. After further study, I don't
>> think
>>>> this is a DW issue, but rather an SOC integration issue.
>>>>=20
>>>> I believe you can just fixup the address in the pp->ops->host_init
>> hook.

Yep, it is SOC specific code for dra7.
This is NOT a DW issue.

>>>=20
>>> Yes I guess that I could just assign pp->(*)_mod_base to the CPU
>> address
>>> in DW and mask it out in dra7xx_pcie_host_init()...
>>>=20
>>> Kishon, would you be ok with that?
>>=20
>> Initially I was using *base-mask* property from dt. Me and Arnd (cc'=
ed)
>> had
>> this discussion [1] before we decided the current approach. It'll be
>> good to
>> check with Arnd too.
>>=20
>> [1] ->  http://lists.infradead.org/pipermail/linux-arm-kernel/2014-
>> May/253528.html
>=20
>=20
> In this patch you use the mask into designware....instead the approac=
h=20
> proposed by Rob means to have the mask declared in the dra7 driver an=
d
> you modified the pp members in dra7xx_pcie_host_init by masking them.=
=2E.

I want to move that code to dra7 driver,
because that code is dra7-specific.

Best regards,
Jingoo Han

> BTW good to have Arnd opinion too..
>>=20
>> Thanks
>> Kishon
