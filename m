Return-Path: <SRS0=wQ8N=O4=synopsys.com=thinh.nguyen@kernel.org>
From: Thinh Nguyen <thinh.nguyen@synopsys.com>
Subject: Re: [PATCH v2 3/4] usb: dwc3: Add property snps,enable-refclk-sof
Date: Wed, 19 Dec 2018 00:19:53 +0000
Message-ID: <30102591E157244384E984126FC3CB4F639AB1A6@us01wembx1.internal.synopsys.com>
References: <cover.1544235317.git.thinhn@synopsys.com>
 <a156d9779fe56ea7b5cc628c90b52d0162b5ae68.1544235317.git.thinhn@synopsys.com>
 <20181218164128.GA14552@bogus>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>, Thinh Nguyen <thinh.nguyen@synopsys.com>
Cc: Felipe Balbi <balbi@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,=0A=
=0A=
On 12/18/2018 8:41 AM, Rob Herring wrote:=0A=
> On Fri, Dec 07, 2018 at 06:27:43PM -0800, Thinh Nguyen wrote:=0A=
>> This patch adds a property to enable the controller to track the=0A=
>> frame number based on the reference clock.=0A=
>>=0A=
>> When operating in USB 2.0 mode, the peripheral controller uses the USB2=
=0A=
>> PHY clocks to track the frame number. This prevents the controller from=
=0A=
>> suspending the USB2 PHY when the device goes into low power. Version=0A=
>> 1.80a of the DWC_usb31 peripheral controller introduces a way to track=
=0A=
>> frame number based on the reference clock instead. This feature allows=
=0A=
>> the controller to suspend the USB2 PHY when the device goes into low=0A=
>> power. This improves power saving for devices that have isochronous=0A=
>> endpoints.=0A=
>>=0A=
>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>=0A=
>> ---=0A=
>> Changes in v2:=0A=
>> - Revise property description=0A=
>> - Rename property from snps,enable-refclk-lpm to snps,enable-refclk-sof=
=0A=
>>=0A=
>>  Documentation/devicetree/bindings/usb/dwc3.txt | 3 +++=0A=
>>  1 file changed, 3 insertions(+)=0A=
>>=0A=
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentat=
ion/devicetree/bindings/usb/dwc3.txt=0A=
>> index b7e67edff9b2..01b948fff0eb 100644=0A=
>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt=0A=
>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt=0A=
>> @@ -101,6 +101,9 @@ Optional properties:=0A=
>>  			enable periodic ESS TX threshold.=0A=
>>   - snps,refclk-period-ns: if set, this value informs the controller of =
the=0A=
>>  			reference clock period in nanoseconds.=0A=
>> + - snps,enable-refclk-sof: set to enable reference clock based frame nu=
mber=0A=
>> +			tracking while in low power, allowing the controller to=0A=
>> +			suspend the PHY during low power states.=0A=
> This should be implied by the compatible string.=0A=
=0A=
Can you clarify further how that will work? (I think I may misunderstand=0A=
what you mean)=0A=
=0A=
Thanks for the review!=0A=
Thinh=0A=
