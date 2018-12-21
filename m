Return-Path: <SRS0=ZgtJ=O6=synopsys.com=thinh.nguyen@kernel.org>
From: Thinh Nguyen <thinh.nguyen@synopsys.com>
Subject: Re: [PATCH v2 1/4] usb: dwc3: Add property snps,refclk-period-ns
Date: Fri, 21 Dec 2018 00:21:58 +0000
Message-ID: <30102591E157244384E984126FC3CB4F639ABA8B@us01wembx1.internal.synopsys.com>
References: <cover.1544235317.git.thinhn@synopsys.com>
 <83adc98adc1760a0fad87d81d171e1dac783e7e5.1544235317.git.thinhn@synopsys.com>
 <20181218163858.GA12336@bogus>
 <30102591E157244384E984126FC3CB4F639AB1BC@us01wembx1.internal.synopsys.com>
 <CAL_JsqKiRHwRYXqJmADpRXp8zpqrPTPtgbmG8aB-2=_SW358Fw@mail.gmail.com>
 <30102591E157244384E984126FC3CB4F639AB64F@us01wembx1.internal.synopsys.com>
 <87va3ou21i.fsf@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Felipe Balbi <balbi@kernel.org>, Thinh Nguyen <thinh.nguyen@synopsys.com>, Rob Herring <robh@kernel.org>
Cc: Linux USB List <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

Hi,=0A=
=0A=
On 12/19/2018 10:48 PM, Felipe Balbi wrote:=0A=
> Hi,=0A=
>=0A=
> Thinh Nguyen <thinh.nguyen@synopsys.com> writes:=0A=
>>>> On 12/18/2018 8:39 AM, Rob Herring wrote:=0A=
>>>>> On Fri, Dec 07, 2018 at 06:27:30PM -0800, Thinh Nguyen wrote:=0A=
>>>>>> This patch introduces property "snps,refclk-period-ns" to inform the=
=0A=
>>>>>> controller of the reference clock period. If the reference clock per=
iod=0A=
>>>>>> is different from the default Core Consultant setting, then this=0A=
>>>>>> property can be set to the reference clock period.=0A=
>>>>>>=0A=
>>>>>> This property does not control the reference clock rate. The control=
ler=0A=
>>>>>> uses this value to perform internal timing calculations that are bas=
ed=0A=
>>>>>> on the reference clock.=0A=
>>>>>>=0A=
>>>>>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>=0A=
>>>>>> ---=0A=
>>>>>> Changes in v2:=0A=
>>>>>> - Split from "usb: dwc3: Add reference clock properties"=0A=
>>>>>> - Revise commit message and property description=0A=
>>>>>>=0A=
>>>>>>  Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++=0A=
>>>>>>  1 file changed, 2 insertions(+)=0A=
>>>>>>=0A=
>>>>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Docume=
ntation/devicetree/bindings/usb/dwc3.txt=0A=
>>>>>> index 8e5265e9f658..b7e67edff9b2 100644=0A=
>>>>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt=0A=
>>>>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt=0A=
>>>>>> @@ -99,6 +99,8 @@ Optional properties:=0A=
>>>>>>                      this and tx-thr-num-pkt-prd to a valid, non-zer=
o value=0A=
>>>>>>                      1-16 (DWC_usb31 programming guide section 1.2.3=
) to=0A=
>>>>>>                      enable periodic ESS TX threshold.=0A=
>>>>>> + - snps,refclk-period-ns: if set, this value informs the controller=
 of the=0A=
>>>>>> +                    reference clock period in nanoseconds.=0A=
>>>>> Shouldn't you be able to retrieve the refclk frequency and then=0A=
>>>>> calculate the period?=0A=
>>>> The thing is we cannot determine the ref_clk frequency for some device=
s=0A=
>>>> that don't specify their clocks. So I think we should have an option t=
o=0A=
>>>> inform the controller of the ref_clk period for those devices.=0A=
>>> Specifying the clock should be mandatory (if you want/need this=0A=
>>> feature). It just requires a fixed-clock node at a minimum.=0A=
>> Depending on the design of the controller, the ref_clk frequency is not=
=0A=
>> something that the OS can read/control. So we cannot make it mandatory=
=0A=
>> for every device to have a clock node.=0A=
> We can make it mandatory to everyone who wants to use the feature. It's=
=0A=
> no different than making snps,refclk-period-ns mandatory to everyone who=
=0A=
> wants to use the feature you're introducing.=0A=
>=0A=
=0A=
But not every design has access to the clock with an actual address for=0A=
the OS to read. Only the developers will know the frequency of the=0A=
ref_clk, and they can inform the controller via this property.=0A=
=0A=
We cannot force the developers to change their design requirement simply=0A=
to inform the controller of the ref_clk period.=0A=
=0A=
Thinh=0A=
