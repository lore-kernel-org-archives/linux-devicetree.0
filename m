From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [RFC PATCH v2 03/15] dt-bindings: add binding for USBSS-DRD
 controller.
Date: Sun, 25 Nov 2018 07:33:33 +0000
Message-ID: <BYAPR07MB47096DA8D0A23B585F731111DDD60@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-4-git-send-email-pawell@cadence.com>
 <5BF7DC12.4060600@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5BF7DC12.4060600@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi Roger

>On 18/11/18 12:08, Pawel Laszczak wrote:
>> Thsi patch aim at documenting USB related dt-bindings for the
>
>s/Thsi/This
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
>> +  - compatible: Should contain: "cdns,usb3"
>> +  - interrupts: Interrupt specifier. Refer to interrupt bindings.
>
>Do you also comply with USB generic bindings for dr_mode, speed, etc?
>i.e. Documentation/devicetree/bindings/usb/generic.txt
>
>If yes it must be mentioned in Optional properties:

I took a look at this document and I think that only dr_mode and maximum-sp=
eed make sense=20
as optional parameters.
I will add these two as optional.=20

Thanks.

>
>> +
>> +
>> +Example:
>> +	cdns3@f3000000 {
>> +		compatible =3D "cdns,usb3";
>> +		interrupts =3D <USB_IRQ  7 IRQ_TYPE_LEVEL_HIGH>;
>> +		reg =3D <0xf3000000 0x10000	//memory area for OTG/DRD registers
>> +			0xf3010000 0x10000	//memory area for HOST registers
>> +			0xf3020000 0x10000>;	//memory area for Device registers
>> +	};
>> +
>>
>
>cheers,
>-roger
>--
>Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

Cheers,
Pawel
