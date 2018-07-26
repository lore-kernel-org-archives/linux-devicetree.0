From: Anurag Kumar Vulisha <anuragku@xilinx.com>
Subject: RE: [PATCH] usb: dwc3: core: Add quirk for enabling AutoRetry feature
 in the controller
Date: Thu, 26 Jul 2018 02:35:16 +0000
Message-ID: <MWHPR02MB2816DDEAE84716F88B08EB46A72B0@MWHPR02MB2816.namprd02.prod.outlook.com>
References: <1532168920-3269-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
 <20180725200325.GA21007@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180725200325.GA21007@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "balbi@kernel.org" <balbi@kernel.org>, "v.anuragkumar@gmail.com" <v.anuragkumar@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for your comments, please see my comments inline

>-----Original Message-----
>From: Rob Herring [mailto:robh@kernel.org]
>Sent: Thursday, July 26, 2018 1:33 AM
>To: Anurag Kumar Vulisha <anuragku@xilinx.com>
>Cc: gregkh@linuxfoundation.org; mark.rutland@arm.com; balbi@kernel.org;
>v.anuragkumar@gmail.com; linux-usb@vger.kernel.org; devicetree@vger.kernel=
.org;
>linux-kernel@vger.kernel.org
>Subject: Re: [PATCH] usb: dwc3: core: Add quirk for enabling AutoRetry fea=
ture in the
>controller
>
>On Sat, Jul 21, 2018 at 03:58:40PM +0530, Anurag Kumar Vulisha wrote:
>> By default when core sees any transaction error(CRC or overflow)
>> it replies with terminating retry ACK (Retry=3D1 and Nump =3D=3D 0).
>> Enabling this Auto Retry feature in controller, on seeing any
>> transaction errors makes the core to send an non-terminating ACK
>> transaction packet (that is, ACK TP with Retry=3D1 and Nump !=3D 0).
>> Doing so will give controller a chance to recover from the error
>> condition.
>>
>> Signed-off-by: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
>> ---
>>  Documentation/devicetree/bindings/usb/dwc3.txt |  5 +++++
>>  drivers/usb/dwc3/core.c                        | 16 ++++++++++++++++
>>  drivers/usb/dwc3/core.h                        |  6 ++++++
>>  3 files changed, 27 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt
>b/Documentation/devicetree/bindings/usb/dwc3.txt
>> index 7f13ebe..2ba2bc2 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>> @@ -94,6 +94,11 @@ Optional properties:
>>  			this and tx-thr-num-pkt-prd to a valid, non-zero value
>>  			1-16 (DWC_usb31 programming guide section 1.2.3) to
>>  			enable periodic ESS TX threshold.
>> + - snps,enable_auto_retry: Set to enable Auto retry Feature to make the
>
>s/_/-/
Sorry, I am not able to understand what needs to fixed here. Please help me=
 in
understanding, so that I can fix it in v2.
>
>> +			controller operating in Host mode on seeing transaction
>> +			errors(CRC errors or internal overrun scenerios) on IN
>> +			transfers to reply to the device with a non-terminating
>> +			retry ACK (i.e, an ACK TP with Retry=3D1 & Nump !=3D 0)
>
>Seems like the property is unnecessary. When would you not want this
>retry behavior? Why not just enable unconditionally in the driver?
>
There is no harm in adding this fix always but I think this Retry feature s=
hould be added
depending on the user and type of the application. For example, applying th=
is feature in
a streaming application where isochronous transfers  are used might end up =
in retrying
in failed packet until timeout happens, this might reduce the performance. =
And there may
be cases where the user want to know when the transfer error occurred. Enab=
ling this feature
always will fail in both the above mentioned cases. Because of this reason =
added this quirk,
so that user can decide when to apply and not. Please correct me if I am wr=
ong=20

Thanks,
Anurag Kumar Vulisha
