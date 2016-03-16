From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v3 6/8] arm64: dts: rockchip: Add power key to GeekBox
Date: Wed, 16 Mar 2016 11:58:11 +0100
Message-ID: <56E93C43.1060500@suse.de>
References: <1457294038-14243-1-git-send-email-afaerber@suse.de>
 <1457294038-14243-7-git-send-email-afaerber@suse.de>
 <6BD669A2-4971-4702-8742-77C9994AA4E9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6BD669A2-4971-4702-8742-77C9994AA4E9@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Julien Chauveau <chauveau.julien@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, linux-rockchip <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Am 11.03.2016 um 00:04 schrieb Julien Chauveau:
>> Le 6 mars 2016 =C3=A0 20:53, Andreas F=C3=A4rber <afaerber@suse.de> =
a =C3=A9crit :
>>
>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>> ---
>> v2 -> v3:
>> * Adopted wakeup-source instead of gpio-key,wakeup (Julien)
>> * Dropped gpio-keys #address-cells and #size-cells properties (Julie=
n)
>> * Dropped power button reg property (Julien)
>> * Adopted KEY_POWER (Julien)
>> * Fixed power button pinctrl pull setting (Julien)
>>
>> v2: New
>>
>> arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts | 20 +++++++++++++++=
+++++
>> 1 file changed, 20 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts b/arch/=
arm64/boot/dts/rockchip/rk3368-geekbox.dts
>> index 098be3700a6f..7036b49c9206 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
>> @@ -42,6 +42,7 @@
>>
>> /dts-v1/;
>> #include "rk3368.dtsi"
>> +#include <dt-bindings/input/input.h>
>>
>> / {
>> 	model =3D "GeekBox";
>> @@ -70,6 +71,19 @@
>> 		pinctrl-0 =3D <&ir_int>;
>> 	};
>>
>> +	keys: gpio-keys {
>=20
> I think you don't need the "keys" label, because there=E2=80=99s no p=
handle that refers to this.

As discussed elsewhere, there are four additional keys on the
Landingship (you proposed as sub-node names key1-key4).
I prefer preparing the label now over adding it in a later patch.

>> +		compatible =3D "gpio-keys";
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&pwr_key>;
>> +
>> +		button@0 {
>=20
> Here you should use "power" instead of "button@0".

Done.

>> +			gpios =3D <&gpio0 2 GPIO_ACTIVE_LOW>;
>> +			label =3D "GPIO Power";
>> +			linux,code =3D <KEY_POWER>;
>=20
> According to Documentation/input/event-codes.txt, there=E2=80=99s a s=
pecial event type for the power button.
> Should we use it here for that purpose?
>=20
> 			linux,input-type =3D <EV_PWR>

The other RK3368 boards don't, so unless you can give a justification t=
o
convert all boards yet again and test how this makes a difference, I'd
rather not do experiments here but leave that to someone who knows what
they're doing and then do it consistently...

Thanks for the detailed review,

Andreas

>> +			wakeup-source;
>> +		};
>> +	};
>> +
>> 	leds: gpio-leds {
>> 		compatible =3D "gpio-leds";
>>
>> @@ -265,6 +279,12 @@
>> 		};
>> 	};
>>
>> +	keys {
>> +		pwr_key: pwr-key {
>> +			rockchip,pins =3D <0 2 RK_FUNC_GPIO &pcfg_pull_none>;
>> +		};
>> +	};
>> +
>> 	pmic {
>> 		pmic_sleep: pmic-sleep {
>> 			rockchip,pins =3D <0 0 RK_FUNC_2 &pcfg_pull_none>;

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG=
 N=C3=BCrnberg)
