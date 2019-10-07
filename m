From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: iio: light: Add binding for ADUX1020
Date: Mon, 07 Oct 2019 18:10:50 +0530
Message-ID: <4EC23AB5-B8BE-4E45-8E5B-FCCD5B1508BA@linaro.org>
References: <20191007101027.8383-1-manivannan.sadhasivam@linaro.org> <20191007101027.8383-2-manivannan.sadhasivam@linaro.org> <a60fb9ea8922c1eb532e0b7ef0a69abcc9306255.camel@analog.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a60fb9ea8922c1eb532e0b7ef0a69abcc9306255.camel@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, "lars@metafoo.de" <lars@metafoo.de>, "jic23@kernel.org" <jic23@kernel.org>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "knaack.h@gmx.de" <knaack.h@gmx.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Ardelean,=20

On 7 October 2019 3:51:16 PM IST, "Ardelean, Alexandru" <alexandru=2EArdel=
ean@analog=2Ecom> wrote:
>On Mon, 2019-10-07 at 15:40 +0530, Manivannan Sadhasivam wrote:
>> [External]
>>=20
>> Add devicetree binding for Analog Devices ADUX1020 Photometric
>> sensor=2E
>>=20
>
>Hey,
>
>Thanks for the patches=2E
>
>This dt-binding docs is in text format=2E
>dt-binding docs now need to be in YAML format=2E
>

Sure=2E I can convert to YAML binding=2E=20

>Also, patches for dt-bindings docs usually come after the driver is
>added=2E
>So, this patch should be the second in the series, not the first=2E
>

I don't think so=2E The convention is to put dt-bindings patch upfront for=
 all subsystems=2E Not sure if IIO differs here=2E=20

Thanks,=20
Mani
>Alex
>
>> Signed-off-by: Manivannan Sadhasivam
><manivannan=2Esadhasivam@linaro=2Eorg>
>> ---
>>  =2E=2E=2E/bindings/iio/light/adux1020=2Etxt           | 22
>+++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>  create mode 100644
>> Documentation/devicetree/bindings/iio/light/adux1020=2Etxt
>>=20
>> diff --git a/Documentation/devicetree/bindings/iio/light/adux1020=2Etxt
>> b/Documentation/devicetree/bindings/iio/light/adux1020=2Etxt
>> new file mode 100644
>> index 000000000000=2E=2Ee896dda30e36
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/light/adux1020=2Etxt
>> @@ -0,0 +1,22 @@
>> +Analog Devices ADUX1020 Photometric sensor
>> +
>> +Link to datasheet:=20
>>
>https://www=2Eanalog=2Ecom/media/en/technical-documentation/data-sheets/A=
DUX1020=2Epdf
>> +
>> +Required properties:
>> +
>> + - compatible: should be "adi,adux1020"
>> + - reg: the I2C address of the sensor
>> +
>> +Optional properties:
>> +
>> + - interrupts: interrupt mapping for IRQ as documented in
>> + =20
>Documentation/devicetree/bindings/interrupt-controller/interrupts=2Etxt
>> +
>> +Example:
>> +
>> +adux1020@64 {
>> +	compatible =3D "adi,adux1020";
>> +	reg =3D <0x64>;
>> +	interrupt-parent =3D <&msmgpio>;
>> +	interrupts =3D <24 IRQ_TYPE_LEVEL_HIGH>;
>> +};

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
