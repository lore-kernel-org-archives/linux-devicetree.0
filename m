Return-Path: <SRS0=eRvF=NS=synopsys.com=thinh.nguyen@kernel.org>
From: Thinh Nguyen <thinh.nguyen@synopsys.com>
Subject: Re: [PATCH 1/3] usb: dwc3: Add reference clock properties
Date: Wed, 7 Nov 2018 04:11:17 +0000
Message-ID: <30102591E157244384E984126FC3CB4F639A080E@us01wembx1.internal.synopsys.com>
References: <cover.1541208283.git.thinhn@synopsys.com>
 <ca0957e58d1d7c1ed49b53345a5c4ed9209c0968.1541208283.git.thinhn@synopsys.com>
 <877ehqv44p.fsf@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Felipe Balbi <balbi@kernel.org>, Thinh Nguyen <thinh.nguyen@synopsys.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

Hi Felipe,=0A=
=0A=
On 11/6/2018 3:26 AM, Felipe Balbi wrote:=0A=
> hi,=0A=
>=0A=
> Thinh Nguyen <thinh.nguyen@synopsys.com> writes:=0A=
>> Add two new device properties to program the reference clock period and=
=0A=
>> to enable low power management using the reference clock. This allows a=
=0A=
>> higher demand to go in low power for Audio Device Class devices. This=0A=
>> feature is currently only valid for DWC_usb31 peripheral controller=0A=
>> v1.80a and higher.=0A=
>>=0A=
>> Set "snps,refclk-period-ns" to program the reference clock period. The=
=0A=
>> valid input periods are as follow:=0A=
>>  +-------------+-----------------+=0A=
>>  | Period (ns) | Freq (MHz)      |=0A=
>>  +-------------+-----------------+=0A=
>>  | 25          | 39.7/40         |=0A=
>>  | 41          | 24.4            |=0A=
>>  | 50          | 20              |=0A=
>>  | 52          | 19.2            |=0A=
>>  | 58          | 17.2            |=0A=
>>  | 62          | 16.1            |=0A=
>>  +-------------+-----------------+=0A=
>>=0A=
>> Set "snps,refclk-lpm" to enable low power scheduling of isochronous=0A=
>> transfers by running SOF/ITP counters using the reference clock. Both=0A=
>> "snps,dis_u2_susphy_quirk" and "snps,dis_enblslpm_quirk" must not be=0A=
>> set for this feature to be enabled.=0A=
>>=0A=
>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>=0A=
>> ---=0A=
>>  Documentation/devicetree/bindings/usb/dwc3.txt | 18 ++++++++++++++++++=
=0A=
>>  1 file changed, 18 insertions(+)=0A=
>>=0A=
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentat=
ion/devicetree/bindings/usb/dwc3.txt=0A=
>> index 636630fb92d7..712b344c3a31 100644=0A=
>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt=0A=
>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt=0A=
>> @@ -95,6 +95,24 @@ Optional properties:=0A=
>>  			this and tx-thr-num-pkt-prd to a valid, non-zero value=0A=
>>  			1-16 (DWC_usb31 programming guide section 1.2.3) to=0A=
>>  			enable periodic ESS TX threshold.=0A=
>> + - snps,refclk-period-ns: set to program the reference clock period. Th=
e valid=0A=
>> +   			input periods are as follow:=0A=
>> +			+-------------+-----------------+=0A=
>> +			| Period (ns) | Freq (MHz)      |=0A=
>> +			+-------------+-----------------+=0A=
>> +			| 25          | 39.7/40         |=0A=
>> +			| 41          | 24.4            |=0A=
>> +			| 50          | 20              |=0A=
>> +			| 52          | 19.2            |=0A=
>> +			| 58          | 17.2            |=0A=
>> +			| 62          | 16.1            |=0A=
>> +			+-------------+-----------------+=0A=
>> + - snps,enable-refclk-lpm: set to enable low power scheduling of isochr=
onous=0A=
>> +			transfers by running SOF/ITP counters using the=0A=
>> +			reference clock. Only valid for DWC_usb31 peripheral=0A=
>> +			controller v1.80a and higher. Both=0A=
>> +			"snps,dis_u2_susphy_quirk" and=0A=
>> +			"snps,dis_enblslpm_quirk" must not be set.=0A=
> sounds like you should rely on clk API here. Then on driver call=0A=
> clk_get_rate() to computer whatever you need to compute.=0A=
>=0A=
There's nothing to compute here. We can simply enable this feature with=0A=
"snps, enable-refclk-lpm" and the controller will use the default refclk=0A=
settings.=0A=
=0A=
Thinh=0A=
=0A=
