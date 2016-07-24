From: "William.wu" <William.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v7 3/5] usb: dwc3: make usb2 phy utmi interface
 configurable in DT
Date: Mon, 25 Jul 2016 00:05:15 +0800
Message-ID: <f9a11ec3-8a69-83d6-39c3-7c50439298d6@rock-chips.com>
References: <1468486762-21960-1-git-send-email-william.wu@rock-chips.com>
 <1468486762-21960-4-git-send-email-william.wu@rock-chips.com>
 <20160716225715.GA27724@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160716225715.GA27724@rob-hp-laptop>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Rob,


On 2016/7/17 6:57, Rob Herring wrote:
> On Thu, Jul 14, 2016 at 04:59:20PM +0800, William Wu wrote:
>> Add snps,phyif-utmi-width devicetree property to configure
>> the UTMI+ PHY with an 8- or 16-bit interface. UTMI+ PHY
>> interface is a hardware property, and it's platform dependent.
>> Normally,the PHYIF can be configured during coreconsultant.
>             ^
> space
I'll fix it next patch, thanks:-)
>
>> But for some specific USB cores(e.g. rk3399 SoC DWC3), the
>> default PHYIF configuration value is fault, so we need to
>> reconfigure it by software.
>>
>> And refer to the DWC3 databook, the GUSB2PHYCFG.USBTRDTIM
>> must be set to the corresponding value according to the
>> UTMI+ PHY interface.
>>
>> Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>> Changes in v7:
>> - remove quirk and use only one property to configure utmi (Heiko, R=
ob Herring)
>>
>> Changes in v6:
>> - use '-' instead of '_' in dts (Rob Herring)
>>
>> Changes in v5:
>> - None
>>
>> Changes in v4:
>> - rebase on top of balbi testing/next, remove pdata (balbi)
>>
>> Changes in v3:
>> - None
>>
>> Changes in v2:
>> - add a quirk for phyif_utmi (balbi)
>>
>>   Documentation/devicetree/bindings/usb/dwc3.txt |  3 +++
>>   drivers/usb/dwc3/core.c                        | 25 ++++++++++++++=
+++++++++++
>>   drivers/usb/dwc3/core.h                        | 10 ++++++++++
>>   3 files changed, 38 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Docume=
ntation/devicetree/bindings/usb/dwc3.txt
>> index 020b0e9..00cc541 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>> @@ -47,6 +47,9 @@ Optional properties:
>>    - snps,hird-threshold: HIRD threshold
>>    - snps,hsphy_interface: High-Speed PHY interface selection betwee=
n "utmi" for
>>      UTMI+ and "ulpi" for ULPI when the DWC_USB3_HSPHY_INTERFACE has=
 value 3.
>> + - snps,phyif-utmi-width: the value to configure the core to suppor=
t a UTMI+ PHY
>> +			with an 8- or 16-bit interface. Value 8 select 8-bit
>> +			interface, value 16 select 16-bit interface.
> Is 'phy_type =3D "utmi_wide"' not the same as 16-bit width?
>
> Again, I think this should be common.
Yes=EF=BC=8C I agree with you. =E2=80=98phy_type =3D "utmi_wide" really=
 means 16-bit UTMI=20
width.
Thanks very much for your rigorous check.

And according to Heiko's helpful suggestion=EF=BC=8CI double check the =
kernel=20
code and
look over UTMI/UTMI+ spec=EF=BC=8CI confirm that there is already gener=
ic code in
drivers/usb/phy/of.c about utmi interface, 'phy_type =3D "utmi"' means=20
8-bit interface,
and 'phy_type =3D "utmi_wide"' means 16-bit interface.

So I think I don't need to add a new dts property=20
'snps,phyif-utmi-width' here=EF=BC=8C
but just use the=E2=80=98phy_type=E2=80=99 property to confirm UTMI+ in=
terface for dwc3.

>
> Rob
>
>
>



--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
