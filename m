From: Anurag Kumar Vulisha <anuragku@xilinx.com>
Subject: RE: [PATCH v2 3/3] usb: dwc3: gadget: Add support for disabling U1
 and U2 entries
Date: Mon, 13 May 2019 14:15:07 +0000
Message-ID: <BYAPR02MB5591B928413B5118142841BDA70F0@BYAPR02MB5591.namprd02.prod.outlook.com>
References: <1557302091-7455-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
 <1557302091-7455-4-git-send-email-anurag.kumar.vulisha@xilinx.com>
 <30102591E157244384E984126FC3CB4F639E9823@us01wembx1.internal.synopsys.com>
 <BL0PR02MB5587B28B6CCAC0FD790F8335A7330@BL0PR02MB5587.namprd02.prod.outlook.com>
 <30102591E157244384E984126FC3CB4F639E9E8F@us01wembx1.internal.synopsys.com>
 <BYAPR02MB55913E2D6F6865202DE88514A70C0@BYAPR02MB5591.namprd02.prod.outlook.com>
 <30102591E157244384E984126FC3CB4F639EA444@us01wembx1.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <30102591E157244384E984126FC3CB4F639EA444@us01wembx1.internal.synopsys.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, "Claus H. Stovgaard" <cst@phaseone.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "v.anuragkumar@gmail.com" <v.anuragkumar@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Thinh,

>-----Original Message-----
>From: Thinh Nguyen [mailto:Thinh.Nguyen@synopsys.com]
>Sent: Saturday, May 11, 2019 7:18 AM
>To: Anurag Kumar Vulisha <anuragku@xilinx.com>; Thinh Nguyen
><Thinh.Nguyen@synopsys.com>; Greg Kroah-Hartman
><gregkh@linuxfoundation.org>; Rob Herring <robh+dt@kernel.org>; Mark Rutla=
nd
><mark.rutland@arm.com>; Felipe Balbi <balbi@kernel.org>; Claus H. Stovgaar=
d
><cst@phaseone.com>
>Cc: linux-usb@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; v.anuragkumar@gmail.com
>Subject: Re: [PATCH v2 3/3] usb: dwc3: gadget: Add support for disabling U=
1 and U2
>entries
>
>Hi,
>
>Anurag Kumar Vulisha wrote:
>> Hi Thinh,
>>
>>> -----Original Message-----
>>> From: Thinh Nguyen [mailto:Thinh.Nguyen@synopsys.com]
>>> Sent: Friday, May 10, 2019 5:30 AM
>>> To: Anurag Kumar Vulisha <anuragku@xilinx.com>; Thinh Nguyen
>>> <Thinh.Nguyen@synopsys.com>; Greg Kroah-Hartman
>>> <gregkh@linuxfoundation.org>; Rob Herring <robh+dt@kernel.org>; Mark Ru=
tland
>>> <mark.rutland@arm.com>; Felipe Balbi <balbi@kernel.org>; Claus H. Stovg=
aard
>>> <cst@phaseone.com>
>>> Cc: linux-usb@vger.kernel.org; devicetree@vger.kernel.org; linux-
>>> kernel@vger.kernel.org; v.anuragkumar@gmail.com
>>> Subject: Re: [PATCH v2 3/3] usb: dwc3: gadget: Add support for disablin=
g U1 and
>U2
>>> entries
>>>
>>> Hi Anurag,
>>>
>>> Anurag Kumar Vulisha wrote:
>>>>>> +		return -EINVAL;
>>>>>>
>>>>>>  	reg =3D dwc3_readl(dwc->regs, DWC3_DCTL);
>>>>>>  	if (set)
>>>>>> @@ -626,7 +630,10 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc=
,
>>> struct
>>>>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>>>>> index e293400..f2d3112 100644
>>>>>> --- a/drivers/usb/dwc3/gadget.c
>>>>>> +++ b/drivers/usb/dwc3/gadget.c
>>>>>> @@ -2073,6 +2073,24 @@ static int dwc3_gadget_stop(struct usb_gadget=
 *g)
>>>>>>  	return 0;
>>>>>>  }
>>>>>>
>>>>>> +static void dwc3_gadget_config_params(struct usb_gadget *g,
>>>>>> +				      struct usb_dcd_config_params *params)
>>>>>> +{
>>>>>> +	struct dwc3		*dwc =3D gadget_to_dwc(g);
>>>>>> +
>>>>>> +	/* U1 Device exit Latency */
>>>>>> +	if (dwc->dis_u1_entry_quirk)
>>>>>> +		params->bU1devExitLat =3D 0;
>>>>> It doesn't make sense to have exit latency of 0. Rejecting
>>>>> SET_FEATURE(enable U1/U2) should already let the host know that the
>>>>> device doesn't support U1/U2.
>>>>>
>>>> I am okay to remove this, but I feel that it is better to report zero =
value instead
>>>> of a non-zero value in exit latency of BOS when U1 or U2 entries are n=
ot
>supported.
>>>> Advantage of reporting 0 is that some hosts doesn't even send
>>> SET_FEATURE(U1/U2)
>>>> requests on seeing zero value in BOS descriptor. Also there can be cas=
es where
>U1 is
>>>> disabled and U2 entry is allowed or vice versa, for these kind of case=
s the driver
>can
>>>> set zero exit latency value for U1 and non-zero exit latency value for=
 U2 . Based
>on
>>> this
>>>> I think it would be better to report 0 when U1/U2 states are not enabl=
ed. Please
>>> provide
>>>> your opinion on this.
>>> Hm... I assume you're testing against linux usb stack and xhci host. If
>>> that's the case, it looks like host will still request the device to
>>> enter U1/U2 despite the device rejecting SET_FEATURE(enable U1/U2). Thi=
s
>>> needs to be fixed. I think what you have is fine to workaround this iss=
ue.
>> Thanks . Will send the next series with the other fixes that you have su=
ggested
>>
>> Best Regards,
>> Anurag Kumar Vulisha
>>
>
>I want to try something. Can you see if this helps with your performance
>test without setting the U1/U2 exit latency to 0?
>(No need to change what you have in your patch. This is just for testing).
>

With your patch , the link doesn't enter into U1/U2 and I am also getting
better performance

Thanks,
Anurag Kumar Vulisha

>diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
>index 2f94568ba385..619351c581cf 100644
>--- a/drivers/usb/core/hub.c
>+++ b/drivers/usb/core/hub.c
>@@ -4057,8 +4057,18 @@ static void usb_enable_link_state(struct usb_hcd
>*hcd, struct usb_device *udev,
>                /* Only a configured device will accept the Set Feature
>                 * U1/U2_ENABLE
>                 */
>-               if (udev->actconfig)
>-                       usb_set_device_initiated_lpm(udev, state, true);
>+               if (udev->actconfig) {
>+                       if (usb_set_device_initiated_lpm(udev, state,
>true)) {
>+                               /*
>+                                * Don't request U1/U2 entry if the device
>+                                * cannot enable U1/U2.
>+                                */
>+                               usb_set_lpm_timeout(udev, state, 0);
>+
>hcd->driver->disable_usb3_lpm_timeout(hcd, udev,
>+
>state);
>+                               return;
>+                       }
>+               }
>
>                /* As soon as usb_set_lpm_timeout(timeout) returns 0, the
>                 * hub-initiated LPM is enabled. Thus, LPM is enabled no
>
>
