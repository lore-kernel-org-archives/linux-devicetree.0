From: "William.wu" <William.wu@rock-chips.com>
Subject: Re: [PATCH v6 3/5] usb: dwc3: add phyif_utmi_quirk
Date: Sat, 9 Jul 2016 11:38:00 +0800
Message-ID: <f5daa697-3125-cfbf-7318-d4900f666362@rock-chips.com>
References: <1467860066-15142-1-git-send-email-william.wu@rock-chips.com>
 <1467860066-15142-4-git-send-email-william.wu@rock-chips.com>
 <2213342.0Nx5tnEW8p@phil> <87d1moi7g7.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87d1moi7g7.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: gregkh@linuxfoundation.org, linux-rockchip@lists.infradead.org, briannorris@google.com, dianders@google.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, frank.wang@rock-chips.com, eddie.cai@rock-chips.com, John.Youn@synopsys.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, sergei.shtylyov@cogentembedded.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Dear Heiko & Balbi=EF=BC=8C


On 2016/7/8 21:29, Felipe Balbi wrote:
> Hi,
>
> Heiko Stuebner <heiko@sntech.de> writes:
>> Am Donnerstag, 7. Juli 2016, 10:54:24 schrieb William Wu:
>>> Add a quirk to configure the core to support the
>>> UTMI+ PHY with an 8- or 16-bit interface. UTMI+ PHY
>>> interface is hardware property, and it's platform
>>> dependent. Normall, the PHYIf can be configured
>>> during coreconsultant. But for some specific usb
>>> cores(e.g. rk3399 soc dwc3), the default PHYIf
>>> configuration value is fault, so we need to
>>> reconfigure it by software.
>>>
>>> And refer to the dwc3 databook, the GUSB2PHYCFG.USBTRDTIM
>>> must be set to the corresponding value according to
>>> the UTMI+ PHY interface.
>>>
>>> Signed-off-by: William Wu <william.wu@rock-chips.com>
>>> ---
>> [...]
>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt
>>> b/Documentation/devicetree/bindings/usb/dwc3.txt index 020b0e9..8d7=
317d
>>> 100644
>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>>> @@ -42,6 +42,10 @@ Optional properties:
>>>    - snps,dis-u2-freeclk-exists-quirk: when set, clear the
>>> u2_freeclk_exists in GUSB2PHYCFG, specify that USB2 PHY doesn't pro=
vide
>>>   			a free-running PHY clock.
>>> + - snps,phyif-utmi-quirk: when set core will set phyif UTMI+ inter=
face.
>>> + - snps,phyif-utmi: the value to configure the core to support a U=
TMI+
>>> PHY +			with an 8- or 16-bit interface. Value 0 select 8-bit
>>> +			interface, value 1 select 16-bit interface.
>> maybe
>> 	snps,phyif-utmi-width =3D <8> or <16>;
>>
>> devicetree is about describing the hardware, not the things that get=
 written
>> to registers :-) . The conversion from the described width to the re=
gister
>> value can easily be done in the driver.
Thanks for your suggestion:-)
Yes=EF=BC=8C =E2=80=9Csnps,phyif-utmi-width =3D <8> or <16>=E2=80=9D is=
 much clearer and easier to=20
understand.
And I have considered the same dts property for phyif-utmi, but I have=20
no good idea about
the conversion from described width to the registers value for the time=
=20
being.

About phyif utmi width configuration=EF=BC=8C we need to set two places=
 in=20
GUSB2PHYCFG register=EF=BC=8C
according to DWC3 USB3.0 controller databook version3.00a=EF=BC=8C6.3.4=
6=20
GUSB2PHYCFG

-----------------------------------------------------------------------=
-----------------------
     Bits   |  Name                 |     Description
-----------------------------------------------------------------------=
-----------------------
   13:10  |   USBTRDTIM       |     Sets the turnaround time in PHY clo=
cks.
             |                            |     4'h5: When the MAC=20
interface is 16-bit UTMI+
             |                            |     4'h9: When the MAC=20
interface is 8-bit UTMI+/ULPI.
-----------------------------------------------------------------------=
-----------------------
   3        |   PHYIF                |    If UTMI+ is selected, the=20
application uses this bit to configure
             |                            |    core to support a UTMI+=20
PHY with an 8- or 16-bit interface.
             |                            |    1'b0: 8 bits
             |                            |    1'b1: 16 bits
-----------------------------------------------------------------------=
-----------------------

And I think maybe I can try to do this:
change it in dts:
         snps,phyif-utmi-width =3D <8> or <16>;

Then convert to register value like this=EF=BC=9A
        device_property_read_u8(dev, "snps,phyif-utmi-width",
                                              &phyif_utmi_width);

        dwc->phyif_utmi =3D phyif_utmi_width >> 4;

  Ater the conversion=EF=BC=8C dwc->phyif_utmi value 0 means 8 bits, va=
lue 1=20
means 16 bits,
  and it's easier for us to config GUSB2PHYCFG.

Is it OK?

>>
>>
>> Also I don't think you need two properties for this. If the snps,phy=
if-utmi
>> property is specified it indicates that you want to manually set the=
 width
>> and if it is absent you want to use the IC default. All functions re=
ading
>> property-values indicate if the property is missing.
Ah, it seems very good to me. One dts property "snps,phyif-utmi" can he=
lp to
reconfig phyif utmi width. And it seems that Felipe likes it very much=20
too. :-D
>> But it looks like there is already a precendence in
>> snps,tx_de_emphasis(_quirk), so maybe Felipe has a different opinion=
 here?
>>
>>
>>
>>>    - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
>>>   			utmi_l1_suspend_n, false when asserts utmi_sleep_n
>>>    - snps,hird-threshold: HIRD threshold
>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>> index 0b7bfd2..94036b1 100644
>>> --- a/drivers/usb/dwc3/core.c
>>> +++ b/drivers/usb/dwc3/core.c
>>> @@ -408,6 +408,7 @@ static void dwc3_cache_hwparams(struct dwc3 *dw=
c)
>>>   static int dwc3_phy_setup(struct dwc3 *dwc)
>>>   {
>>>   	u32 reg;
>>> +	u32 usbtrdtim;
>>>   	int ret;
>>>
>>>   	reg =3D dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(0));
>>> @@ -503,6 +504,15 @@ static int dwc3_phy_setup(struct dwc3 *dwc)
>>>   	if (dwc->dis_u2_freeclk_exists_quirk)
>>>   		reg &=3D ~DWC3_GUSB2PHYCFG_U2_FREECLK_EXISTS;
>>>
>>> +	if (dwc->phyif_utmi_quirk) {
>>> +		reg &=3D ~(DWC3_GUSB2PHYCFG_PHYIF_MASK |
>>> +		       DWC3_GUSB2PHYCFG_USBTRDTIM_MASK);
>>> +		usbtrdtim =3D dwc->phyif_utmi ? USBTRDTIM_UTMI_16_BIT :
>>> +			    USBTRDTIM_UTMI_8_BIT;
>>> +		reg |=3D DWC3_GUSB2PHYCFG_PHYIF(dwc->phyif_utmi) |
>>> +		       DWC3_GUSB2PHYCFG_USBTRDTIM(usbtrdtim);
>>> +	}
>>> +
>>>   	dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
>>>
>>>   	return 0;
>>> @@ -834,6 +844,7 @@ static int dwc3_probe(struct platform_device *p=
dev)
>>>   	struct resource		*res;
>>>   	struct dwc3		*dwc;
>>>   	u8			lpm_nyet_threshold;
>>> +	u8			phyif_utmi;
>>>   	u8			tx_de_emphasis;
>>>   	u8			hird_threshold;
>>>
>>> @@ -880,6 +891,9 @@ static int dwc3_probe(struct platform_device *p=
dev)
>>>   	/* default to highest possible threshold */
>>>   	lpm_nyet_threshold =3D 0xff;
>>>
>>> +	/* default to UTMI+ 8-bit interface */
>>> +	phyif_utmi =3D 0;
>>> +
>>>   	/* default to -3.5dB de-emphasis */
>>>   	tx_de_emphasis =3D 1;
>>>
>>> @@ -929,6 +943,10 @@ static int dwc3_probe(struct platform_device *=
pdev)
>>>   				"snps,dis_rxdet_inp3_quirk");
>>>   	dwc->dis_u2_freeclk_exists_quirk =3D device_property_read_bool(d=
ev,
>>>   				"snps,dis-u2-freeclk-exists-quirk");
>>> +	dwc->phyif_utmi_quirk =3D device_property_read_bool(dev,
>>> +				"snps,phyif-utmi-quirk");
>>> +	 device_property_read_u8(dev, "snps,phyif-utmi",
>>> +				 &phyif_utmi);
>>
>> As described above device_property_read_u8 will return an error if t=
he
>> property is not present, so you could fill your dwc->phyif_utmi_quir=
k from
>> that:
>>
>> 	ret =3D device_property_read_u8(dev, "snps,phyif-utmi",
>> 				 &phyif_utmi);
>> 	dwc->phyif_utmi_quirk =3D (ret =3D=3D 0) ? true : false;
> I like this much better :-) Unfortunately can't fix tx_deemphasis due=
 to
> backwards compatibility :-s
I'll try to follow Heiko's suggestion and fix the dwc->phyif_utmi_quirk=
=20
next patch.

Best regards,
        William.wu
>
