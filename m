From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [PATCH 1/1] MIPS: DTS: cavium-octeon: provide model attribute
Date: Mon, 15 Feb 2016 18:52:20 +0100
Message-ID: <56C21054.4070702@gmx.de>
References: <1455513977-934-1-git-send-email-xypron.glpk@gmx.de>
 <56C1B3A0.4090301@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56C1B3A0.4090301@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02/15/2016 12:16 PM, Sergei Shtylyov wrote:
> Hello.
>=20
> On 2/15/2016 8:26 AM, Heinrich Schuchardt wrote:
>=20
>> Downstream packages like Debian flash-kernel rely on
>> /proc/device-tree/model
>> to determine how to install an updated kernel image.
>>
>> Most dts files provide this property.
>> It is suggested by IEEE Std 1275-1994.
>>
>> This patch adds a model attribute for Octeon CPUs.
>>
>> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>> ---
>>   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts | 1 +
>>   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts | 1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git a/arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts
>> b/arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts
>> index 9c48e05..a746678 100644
>> --- a/arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts
>> +++ b/arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts
>> @@ -8,6 +8,7 @@
>>    */
>>   / {
>>       compatible =3D "cavium,octeon-3860";
>> +    model =3D "Cavium Octeon 3XXX";
>>       #address-cells =3D <2>;
>>       #size-cells =3D <2>;
>>       interrupt-parent =3D <&ciu>;
>> diff --git a/arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts
>> b/arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts
>> index 79b46fc..c8a292a 100644
>> --- a/arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts
>> +++ b/arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts
>> @@ -8,6 +8,7 @@
>>    */
>>   / {
>>       compatible =3D "cavium,octeon-6880";
>> +    model =3D "Cavium Octeon 68XX";
>>       #address-cells =3D <2>;
>>       #size-cells =3D <2>;
>>       interrupt-parent =3D <&ciu2>;
>=20
>     The ePAPR 1.1 standard says:
>=20
> 2.3.2 model
>=20
> Property: model
> Value type: <string>
> Description:
>     The model property value is a <string> that specifies the
>      manufacturer=92s model number of the device.
>=20
>     The recommended format is: =93manufacturer,model=94, where manufa=
cturer
>     is a string describing the name of the manufacturer (such as a st=
ock
>     ticker symbol), and model specifies the model number.
>=20
> Example:
>     model =3D =93fsl,MPC8349EMITX=94;
>=20
> MBR, Sergei
>=20
>=20

Hello Sergei, hello Arnd,

thank you for reviewing.

IEEE Std 1275-1994 says stock symbols should be in upper case.

I guess international standards should have precedence over papers vali=
d
for a single architecture (power.org).

Would you support a patch having the following strings?

model =3D "CAVM, Octeon 3860";
model =3D "CAVM, Octeon 6880";

Otherwise, please, make a suggestion.

Best regards

Heinrich Schuchardt
