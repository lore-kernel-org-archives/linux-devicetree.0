From: =?UTF-8?Q?Hern=C3=A1n_Gonzalez?= <hernan@vanguardiasur.com.ar>
Subject: Re: [PATCH v2 11/14] staging: iio: ad7746: Add devicetree bindings documentation
Date: Mon, 16 Apr 2018 11:55:04 -0300
Message-ID: <CALfa3vFWuethdCs1qeZLM+u9xpmuUn0tADCVozw84NjkKoOA4g@mail.gmail.com>
References: <1523637411-8531-1-git-send-email-hernan@vanguardiasur.com.ar>
 <1523637411-8531-12-git-send-email-hernan@vanguardiasur.com.ar> <20180415163743.2fa992f9@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180415163743.2fa992f9@archlinux>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: knaack.h@gmx.de, lars@metafoo.de, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, gregkh@linuxfoundation.org, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Apr 15, 2018 at 12:37 PM, Jonathan Cameron <jic23@kernel.org> wrote=
:
> On Fri, 13 Apr 2018 13:36:48 -0300
> Hern=C3=A1n Gonzalez <hernan@vanguardiasur.com.ar> wrote:
>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Hern=C3=A1n Gonzalez <hernan@vanguardiasur.com.ar>
> A few comments inline.
>
> Thanks,
>
> Jonathan
>
>> ---
>>  .../devicetree/bindings/staging/iio/cdc/ad7746.txt | 34 +++++++++++++++=
+++++++
>>  1 file changed, 34 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/staging/iio/cdc/ad=
7746.txt
>>
>> diff --git a/Documentation/devicetree/bindings/staging/iio/cdc/ad7746.tx=
t b/Documentation/devicetree/bindings/staging/iio/cdc/ad7746.txt
>> new file mode 100644
>> index 0000000..7740f05
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/staging/iio/cdc/ad7746.txt
>> @@ -0,0 +1,34 @@
>> +Analog Devices AD7746/5/7 capacitive sensor driver
>> +
>> +Required properties:
>> +     - compatible: Should be one of
>> +             * "adi,ad7745"
>> +             * "adi,ad7746"
>> +       * "adi,ad7747"
>> +     - reg: The 7-bits long I2c address of the device
>> +
>> +Optional properties:
>> +     - adi,exclvl: This property defines the excitation voltage level f=
or the
>> +    capacitance to be measured. Possible values are:
>> +      * 0 =3D +-VDD/8
>> +      * 1 =3D +-VDD/4
>> +      * 2 =3D +-VDD * 3/8
>> +      * 3 =3D +-VDD/2 (Default)
>> +     - adi,nexca_en: Invert excitation output A.
>
> The naming is rather odd.  Why _en?
>

Just sticking to the original pdata naming. I'll rename it on next series.

>> +     - adi,nexcb_en: Invert excitation output B.
>> +
>> +Example:
>> +Here exclvl would be 1 (VDD/4), Excitation pin A would be inverted and
>> +Excitation pin B would NOT be inverted.
>> +
>> +i2c2 {
>> +
>> +      < . . . >
> What does this spacer add to the example?
> Sure, there can be other devices, but no need to illustrate that here.
>
>> +
>> +      ad7746: ad7746@60 {
>> +              compatible =3D "ad7746";
>> +              reg =3D <0x60>;
>> +              adi,exclvl =3D <1>;
>> +              adi,nexca_en;
>> +      };
>> +};
>
