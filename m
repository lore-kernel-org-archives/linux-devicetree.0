From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v1 1/2] dt-bindings: add binding for USBSS-DRD controller.
Date: Sat, 22 Dec 2018 22:24:42 +0000
Message-ID: <BYAPR07MB4709910A6EE4B54BA455E713DDB90@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1544445555-17325-1-git-send-email-pawell@cadence.com>
 <1544445555-17325-2-git-send-email-pawell@cadence.com>
 <20181220200111.GA27998@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181220200111.GA27998@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "balbi@kernel.org" <balbi@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

>On Mon, Dec 10, 2018 at 12:39:14PM +0000, Pawel Laszczak wrote:
>> This patch aim at documenting USB related dt-bindings for the
>> Cadence USBSS-DRD controller.
>>
>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>> ---
>>  .../devicetree/bindings/usb/cdns3-usb.txt     | 31 +++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/usb/cdns3-usb.txt
>>
>> diff --git a/Documentation/devicetree/bindings/usb/cdns3-usb.txt b/Docum=
entation/devicetree/bindings/usb/cdns3-usb.txt
>> new file mode 100644
>> index 000000000000..ae4a255f0b10
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/cdns3-usb.txt
>
>cdns-usb3.txt?

In all functions we use prefix cdns3, so it was a reason for cdns3-usb.txt.
I agree  with you and I think that cdns-usb3.txt in this place will be bett=
er.
3 in cdns3  could be associated with  company name, but that's not true.=20

>
>> @@ -0,0 +1,31 @@
>> +Binding for the Cadence USBSS-DRD controller
>> +
>> +Required properties:
>> +  - reg: Physical base address and size of the controller's register ar=
eas.
>> +	 Controller has 3 different regions:
>> +	 region 1 - HOST registers area
>> +	 region 2 - DEVICE registers area
>> +	 region 3 - OTG/DRD registers area
>> +  - compatible: Should contain: "cdns,usb3"
>
>Only 1 version of the IP block?

I will add one more. Now I know that we should have=20
at least one additional version.=20
Controller version will be recognized at runtime, but in my opinion=20
we should also  have information  about this in dt-binding documentation.=20
>
>> +  - interrupts: Interrupt specifier. Refer to interrupt bindings.
>> +		Driver supports only single interrupt line.
>> +                This single interrupt is shared between Device,
>> +		host and OTG/DRD part of driver.
>> +
>> +Optional propertiesi:
>
>typo
Thank, I know that already. Someone has already reported me this typo.=20
"i" - insert mode in vim :)
>
>> + - maximum-speed : valid arguments are "super-speed", "high-speed" and
>> +                   "full-speed"; refer to usb/generic.txt
>> + - dr_mode: Should be one of "host", "peripheral" or "otg".
>> + - phys: reference to the USB PHY
>> + - phy-names: name of the USB PHY, should be "cdns3,usbphy"
>
>Don't need -names when there is only one.

But in the future probably we will need to add next phy version.
So maybe it's better to leave this name ?

>
>> +
>> +
>> +Example:
>> +	usb@f3000000 {
>> +		compatible =3D "cdns,usb3";
>> +		interrupts =3D <USB_IRQ  7 IRQ_TYPE_LEVEL_HIGH>;
>> +		reg =3D <0xf3000000 0x10000	//memory area for HOST registers
>> +			0xf3010000 0x10000	//memory area for DEVICE registers
>> +			0xf3020000 0x10000>;	//memory area for OTG/DRD registers
>> +	};
>> +
>> --
>> 2.17.1
>>

Thanks for comments=20
Cheers,
Pawel
