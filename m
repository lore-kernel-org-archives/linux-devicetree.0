From: =?UTF-8?B?5p2O5pu45biG?= <leechu729@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: rt1711h device tree binding document
Date: Tue, 20 Mar 2018 16:53:55 +0800
Message-ID: <CAFaeLdTC72KY+pfVhDXNxEZ-wBCj0jJKr-Ky-EJyUS9Udhnruw@mail.gmail.com>
References: <1521431375-23207-1-git-send-email-leechu729@gmail.com>
 <1521431375-23207-3-git-send-email-leechu729@gmail.com> <20180319162903.GB17189@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180319162903.GB17189@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Greg KH <greg@kroah.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, =?UTF-8?B?c2h1ZmFuX2xlZSjmnY7mm7jluIYp?= <shufan_lee@richtek.com>, =?UTF-8?B?Y3lfaHVhbmco6buD5ZWf5Y6fKQ==?= <cy_huang@richtek.com>, Jun Li <jun.li@nxp.com>, Mats Karrman <mats.dev.list@gmail.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Guenter,

2018-03-20 0:29 GMT+08:00 Guenter Roeck <linux@roeck-us.net>:
> On Mon, Mar 19, 2018 at 11:49:35AM +0800, ShuFan Lee wrote:
>> From: ShuFan Lee <shufan_lee@richtek.com>
>>
>> Add device tree binding document for Richtek RT1711H Type-C chip driver
>
> Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
> is missing. Added here but it might make sense to resend.
Thank you for reminding, I'll resend it.

>
>>
>> Signed-off-by: ShuFan Lee <shufan_lee@richtek.com>
>> ---
>>  .../devicetree/bindings/usb/richtek,rt1711h.txt    | 30 +++++++++++++++=
+++++++
>>  1 file changed, 30 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/usb/richtek,rt1711=
h.txt
>>
>>  changelogs between v2 & v3
>>  - add dt-bindings document for rt1711h typec chip driver
>>
>> diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt b=
/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
>> new file mode 100644
>> index 000000000000..7da4dac78ea7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
>> @@ -0,0 +1,30 @@
>> +Richtek RT1711H TypeC PD Controller.
>> +
>> +Required properties:
>> + - compatible : Must be "richtek,rt1711h".
>> + - reg : Must be 0x4e, it's slave address of RT1711H.
>> +
>> +Recommended properties :
>> + - interrupt-parent : the phandle for the interrupt controller that
>> +   provides interrupts for this device.
>> + - interrupts : <a b> where a is the interrupt number and b represents =
an
>> +   encoding of the sense and level information for the interrupt.
>> +
>> +Optional properties :
>> + - rt,intr-gpios : IRQ GPIO pin that's connected to RT1711H interrupt.
>> +   if interrupt-parent & interrupts are not defined, use this property =
instead.
>> +
>> +Example :
>> +rt1711h@4e {
>> +     compatible =3D "richtek,rt1711h";
>> +     reg =3D <0x4e>;
>> +     interrupt-parent =3D <&gpio26>;
>> +     interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
>> +};
>> +
>> +Example using rt,intr-gpios :
>> +rt1711h@4e {
>> +     compatible =3D "richtek,rt1711h";
>> +     reg =3D <0x4e>;
>> +     rt,intr-gpios =3D <&gpio26 0 0x0>;
>> +};
>> --
>> 1.9.1
>>



--=20
Best Regards,
=E6=9B=B8=E5=B8=86
