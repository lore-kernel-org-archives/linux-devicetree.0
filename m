From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: DTS: da850-evm: Add node for tlv320aic3106 codec
Date: Fri, 1 Aug 2014 08:22:23 +0300
Message-ID: <53DB240F.2030908@ti.com>
References: <1406801934-23334-1-git-send-email-peter.ujfalusi@ti.com>
	<1406801934-23334-6-git-send-email-peter.ujfalusi@ti.com>
	<53DA519A.4090905@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <53DA519A.4090905-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, nsekhar-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, khilman-1D3HCaltpLuhEniVeURVKkEOCMrvLtNR@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/31/2014 05:24 PM, Sergei Shtylyov wrote:
> Hello.
> =

> On 07/31/2014 02:18 PM, Peter Ujfalusi wrote:
> =

>> The board uses aic3106 for audio.
> =

>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/da850-evm.dts | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
> =

>> diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-e=
vm.dts
>> index 09118c72e83f..b9ef2be0b145 100644
>> --- a/arch/arm/boot/dts/da850-evm.dts
>> +++ b/arch/arm/boot/dts/da850-evm.dts
>> @@ -51,6 +51,20 @@
>>               tps: tps@48 {
>>                   reg =3D <0x48>;
>>               };
>> +            tlv320aic3106: tlv320aic3106@1b {
> =

>    The "reg" property is <0x18>, why the unit-address part of a name is
> different?

True, I have lifted the codec part from other dts file and overlooked the
unit-address.
I will resend the series with this fixed.


> Also, the ePAPR standard [1] says:
> =

> The name of a node should be somewhat generic, reflecting the function of=
 the
> device and not its precise programming model.

True. This is why the node for the audio support is named as 'sound'. For t=
he
components, like in this case I do not see issue to call the audio codec wi=
th
it's name.

> =

>> +                #sound-dai-cells =3D <0>;
>> +                compatible =3D "ti,tlv320aic3106";
>> +                reg =3D <0x18>;
>> +                status =3D "okay";
>> +
>> +                /* Regulators */
>> +                IOVDD-supply =3D <&vdcdc2_reg>;
>> +                /* Derived from VBAT: Baseboard 3.3V / 1.8V */
>> +                AVDD-supply =3D <&vbat>;
>> +                DRVDD-supply =3D <&vbat>;
>> +                DVDD-supply =3D <&vbat>;
>> +            };
>> +
> =

> [1] http://www.power.org/resources/downloads/Power_ePAPR_APPROVED_v1.0.pdf

BTW: there's a newer version available:
https://www.power.org/wp-content/uploads/2012/06/Power_ePAPR_APPROVED_v1.1.=
pdf

> =

> WBR, Sergei
> =



-- =

P=E9ter
