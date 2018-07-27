From: Anurag Kumar Vulisha <anuragku@xilinx.com>
Subject: RE: [PATCH] usb: dwc3: core: Add quirk for enabling AutoRetry feature
 in the controller
Date: Fri, 27 Jul 2018 07:29:35 +0000
Message-ID: <MWHPR02MB2816FFCAB118C07C7754BF58A72A0@MWHPR02MB2816.namprd02.prod.outlook.com>
References: <1532168920-3269-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
 <20180725200325.GA21007@rob-hp-laptop>
 <MWHPR02MB2816DDEAE84716F88B08EB46A72B0@MWHPR02MB2816.namprd02.prod.outlook.com>
 <877eli1c72.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <877eli1c72.fsf@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, Rob Herring <robh@kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "v.anuragkumar@gmail.com" <v.anuragkumar@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


Hi Felipe,

>-----Original Message-----
>From: Felipe Balbi [mailto:balbi@kernel.org]
>Sent: Thursday, July 26, 2018 4:44 PM
>To: Anurag Kumar Vulisha <anuragku@xilinx.com>; Rob Herring <robh@kernel.o=
rg>
>Cc: gregkh@linuxfoundation.org; mark.rutland@arm.com;
>v.anuragkumar@gmail.com; linux-usb@vger.kernel.org; devicetree@vger.kernel=
.org;
>linux-kernel@vger.kernel.org
>Subject: RE: [PATCH] usb: dwc3: core: Add quirk for enabling AutoRetry fea=
ture in the
>controller
>
>
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt
>>>b/Documentation/devicetree/bindings/usb/dwc3.txt
>>>> index 7f13ebe..2ba2bc2 100644
>>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>>>> @@ -94,6 +94,11 @@ Optional properties:
>>>>  			this and tx-thr-num-pkt-prd to a valid, non-zero value
>>>>  			1-16 (DWC_usb31 programming guide section 1.2.3) to
>>>>  			enable periodic ESS TX threshold.
>>>> + - snps,enable_auto_retry: Set to enable Auto retry Feature to make
>>>> + the
>>>
>>>s/_/-/
>> Sorry, I am not able to understand what needs to fixed here. Please
>> help me in understanding, so that I can fix it in v2.
>
>replace _ with -
>
>>>> +			controller operating in Host mode on seeing transaction
>>>> +			errors(CRC errors or internal overrun scenerios) on IN
>>>> +			transfers to reply to the device with a non-terminating
>>>> +			retry ACK (i.e, an ACK TP with Retry=3D1 & Nump !=3D 0)
>>>
>>>Seems like the property is unnecessary. When would you not want this
>>>retry behavior? Why not just enable unconditionally in the driver?
>>>
>> There is no harm in adding this fix always but I think this Retry
>> feature should be added depending on the user and type of the
>> application. For example, applying this feature in a streaming
>> application where isochronous transfers are used might end up in
>
>read the docs. Auto Retry in only for non-isochronous IN endpoints. You do=
n't need
>any quirk for this. Just enable it unconditionally. Actually, you wanna ma=
ke sure the
>core can run in Host mode before setting this, but that's it. No need for =
a quirk.
>
Thanks for making me understand. Will remove this quirk and send v2

Best Regards,
Anurag Kumar Vulisha
