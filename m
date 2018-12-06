From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [RFC PATCH v2 03/15] dt-bindings: add binding for USBSS-DRD
 controller.
Date: Thu, 6 Dec 2018 10:26:28 +0000
Message-ID: <BYAPR07MB470979F18C0DAFEBD774A08BDDA90@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-4-git-send-email-pawell@cadence.com>
 <20181204224158.GA29726@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204224158.GA29726@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi,

>On Sun, Nov 18, 2018 at 10:08:59AM +0000, Pawel Laszczak wrote:
>> Thsi patch aim at documenting USB related dt-bindings for the
>
>typo
>
>> Cadence USBSS-DRD controller.
>>
>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>> ---
>>  .../devicetree/bindings/usb/cdns3-usb.txt       | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/usb/cdns3-usb.txt
>>
>> diff --git a/Documentation/devicetree/bindings/usb/cdns3-usb.txt b/Docum=
entation/devicetree/bindings/usb/cdns3-usb.txt
>> new file mode 100644
>> index 000000000000..f9e953f32d47
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/cdns3-usb.txt
>> @@ -0,0 +1,17 @@
>> +Binding for the Cadence USBSS-DRD controller
>> +
>> +Required properties:
>> +  - reg: Physical base address and size of the controller's register ar=
ea.
>
>1 or 3 regions? If 3, what is each one and the order?

I will add extra description.
>
>> +  - compatible: Should contain: "cdns,usb3"
>
>Only one version and one set of bugs?
Yes, currently we have only one version.=20

>
>> +  - interrupts: Interrupt specifier. Refer to interrupt bindings.
>
>How many interrupts?

Single line  for Device/Host/OTG

I will add description
>
>> +
>> +
>> +Example:
>> +	cdns3@f3000000 {
>
>usb@...
>
Ok.=20

>> +		compatible =3D "cdns,usb3";
>> +		interrupts =3D <USB_IRQ  7 IRQ_TYPE_LEVEL_HIGH>;
>> +		reg =3D <0xf3000000 0x10000	//memory area for OTG/DRD registers
>> +			0xf3010000 0x10000	//memory area for HOST registers
>> +			0xf3020000 0x10000>;	//memory area for Device registers
>> +	};
>> +
>> --
>> 2.17.1
>>

Thanks,
Cheers
Pawel
