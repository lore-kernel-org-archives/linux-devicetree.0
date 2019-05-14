From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: [PATCH v2 3/3] usb: dwc3: gadget: Add support for disabling U1
 and U2 entries
Date: Tue, 14 May 2019 21:40:50 +0000
Message-ID: <30102591E157244384E984126FC3CB4F639F7681@us01wembx1.internal.synopsys.com>
References: <1557302091-7455-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
 <1557302091-7455-4-git-send-email-anurag.kumar.vulisha@xilinx.com>
 <30102591E157244384E984126FC3CB4F639E9823@us01wembx1.internal.synopsys.com>
 <BL0PR02MB5587B28B6CCAC0FD790F8335A7330@BL0PR02MB5587.namprd02.prod.outlook.com>
 <30102591E157244384E984126FC3CB4F639E9E8F@us01wembx1.internal.synopsys.com>
 <BYAPR02MB55913E2D6F6865202DE88514A70C0@BYAPR02MB5591.namprd02.prod.outlook.com>
 <30102591E157244384E984126FC3CB4F639EA444@us01wembx1.internal.synopsys.com>
 <BYAPR02MB5591B928413B5118142841BDA70F0@BYAPR02MB5591.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anurag Kumar Vulisha <anuragku@xilinx.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, "Claus H. Stovgaard" <cst@phaseone.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "v.anuragkumar@gmail.com" <v.anuragkumar@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Anurag,=0A=
=0A=
Anurag Kumar Vulisha wrote:=0A=
> Hi Thinh,=0A=
>=0A=
>> -----Original Message-----=0A=
>> From: Thinh Nguyen [mailto:Thinh.Nguyen@synopsys.com]=0A=
>> Sent: Saturday, May 11, 2019 7:18 AM=0A=
>> To: Anurag Kumar Vulisha <anuragku@xilinx.com>; Thinh Nguyen=0A=
>> <Thinh.Nguyen@synopsys.com>; Greg Kroah-Hartman=0A=
>> <gregkh@linuxfoundation.org>; Rob Herring <robh+dt@kernel.org>; Mark Rut=
land=0A=
>> <mark.rutland@arm.com>; Felipe Balbi <balbi@kernel.org>; Claus H. Stovga=
ard=0A=
>> <cst@phaseone.com>=0A=
>> Cc: linux-usb@vger.kernel.org; devicetree@vger.kernel.org; linux-=0A=
>> kernel@vger.kernel.org; v.anuragkumar@gmail.com=0A=
>> Subject: Re: [PATCH v2 3/3] usb: dwc3: gadget: Add support for disabling=
 U1 and U2=0A=
>> entries=0A=
>>=0A=
>> Hi,=0A=
>>=0A=
>> Anurag Kumar Vulisha wrote:=0A=
>>> Hi Thinh,=0A=
>>>=0A=
>>>> -----Original Message-----=0A=
>>>> From: Thinh Nguyen [mailto:Thinh.Nguyen@synopsys.com]=0A=
>>>> Sent: Friday, May 10, 2019 5:30 AM=0A=
>>>> To: Anurag Kumar Vulisha <anuragku@xilinx.com>; Thinh Nguyen=0A=
>>>> <Thinh.Nguyen@synopsys.com>; Greg Kroah-Hartman=0A=
>>>> <gregkh@linuxfoundation.org>; Rob Herring <robh+dt@kernel.org>; Mark R=
utland=0A=
>>>> <mark.rutland@arm.com>; Felipe Balbi <balbi@kernel.org>; Claus H. Stov=
gaard=0A=
>>>> <cst@phaseone.com>=0A=
>>>> Cc: linux-usb@vger.kernel.org; devicetree@vger.kernel.org; linux-=0A=
>>>> kernel@vger.kernel.org; v.anuragkumar@gmail.com=0A=
>>>> Subject: Re: [PATCH v2 3/3] usb: dwc3: gadget: Add support for disabli=
ng U1 and=0A=
>> U2=0A=
>>>> entries=0A=
>>>>=0A=
>>>> Hi Anurag,=0A=
>>>>=0A=
>>>> Anurag Kumar Vulisha wrote:=0A=
>>>>>>> +		return -EINVAL;=0A=
>>>>>>>=0A=
>>>>>>>  	reg =3D dwc3_readl(dwc->regs, DWC3_DCTL);=0A=
>>>>>>>  	if (set)=0A=
>>>>>>> @@ -626,7 +630,10 @@ static int dwc3_ep0_set_config(struct dwc3 *dw=
c,=0A=
>>>> struct=0A=
>>>>>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c=
=0A=
>>>>>>> index e293400..f2d3112 100644=0A=
>>>>>>> --- a/drivers/usb/dwc3/gadget.c=0A=
>>>>>>> +++ b/drivers/usb/dwc3/gadget.c=0A=
>>>>>>> @@ -2073,6 +2073,24 @@ static int dwc3_gadget_stop(struct usb_gadge=
t *g)=0A=
>>>>>>>  	return 0;=0A=
>>>>>>>  }=0A=
>>>>>>>=0A=
>>>>>>> +static void dwc3_gadget_config_params(struct usb_gadget *g,=0A=
>>>>>>> +				      struct usb_dcd_config_params *params)=0A=
>>>>>>> +{=0A=
>>>>>>> +	struct dwc3		*dwc =3D gadget_to_dwc(g);=0A=
>>>>>>> +=0A=
>>>>>>> +	/* U1 Device exit Latency */=0A=
>>>>>>> +	if (dwc->dis_u1_entry_quirk)=0A=
>>>>>>> +		params->bU1devExitLat =3D 0;=0A=
>>>>>> It doesn't make sense to have exit latency of 0. Rejecting=0A=
>>>>>> SET_FEATURE(enable U1/U2) should already let the host know that the=
=0A=
>>>>>> device doesn't support U1/U2.=0A=
>>>>>>=0A=
>>>>> I am okay to remove this, but I feel that it is better to report zero=
 value instead=0A=
>>>>> of a non-zero value in exit latency of BOS when U1 or U2 entries are =
not=0A=
>> supported.=0A=
>>>>> Advantage of reporting 0 is that some hosts doesn't even send=0A=
>>>> SET_FEATURE(U1/U2)=0A=
>>>>> requests on seeing zero value in BOS descriptor. Also there can be ca=
ses where=0A=
>> U1 is=0A=
>>>>> disabled and U2 entry is allowed or vice versa, for these kind of cas=
es the driver=0A=
>> can=0A=
>>>>> set zero exit latency value for U1 and non-zero exit latency value fo=
r U2 . Based=0A=
>> on=0A=
>>>> this=0A=
>>>>> I think it would be better to report 0 when U1/U2 states are not enab=
led. Please=0A=
>>>> provide=0A=
>>>>> your opinion on this.=0A=
>>>> Hm... I assume you're testing against linux usb stack and xhci host. I=
f=0A=
>>>> that's the case, it looks like host will still request the device to=
=0A=
>>>> enter U1/U2 despite the device rejecting SET_FEATURE(enable U1/U2). Th=
is=0A=
>>>> needs to be fixed. I think what you have is fine to workaround this is=
sue.=0A=
>>> Thanks . Will send the next series with the other fixes that you have s=
uggested=0A=
>>>=0A=
>>> Best Regards,=0A=
>>> Anurag Kumar Vulisha=0A=
>>>=0A=
>> I want to try something. Can you see if this helps with your performance=
=0A=
>> test without setting the U1/U2 exit latency to 0?=0A=
>> (No need to change what you have in your patch. This is just for testing=
).=0A=
>>=0A=
> With your patch , the link doesn't enter into U1/U2 and I am also getting=
=0A=
> better performance=0A=
>=0A=
> Thanks,=0A=
> Anurag Kumar Vulisha=0A=
=0A=
Thanks for testing.=0A=
=0A=
BR,=0A=
Thinh=0A=
