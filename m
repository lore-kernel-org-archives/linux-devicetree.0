From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 3/6] ARM: sun8i: r40: add 5V regulator for
 Banana Pi M2 Ultra
Date: Tue, 10 Oct 2017 07:25:41 +0800
Message-ID: <61E002C8-4046-44E4-8E1A-43C8AF74257C@aosc.io>
References: <20171008042906.46779-1-icenowy@aosc.io> <20171008042906.46779-4-icenowy@aosc.io> <20171009210407.ueharyifho3s6xvu@flea.home>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB6UK6DHAKGQERVVP6MY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171009210407.ueharyifho3s6xvu-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B410=E6=9C=8810=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=885=
:04:07, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0=
:
>On Sun, Oct 08, 2017 at 04:29:03AM +0000, Icenowy Zheng wrote:
>> On newer revisions of the Banana Pi M2 Ultra boards, the 5V power
>output
>> (used by HDMI, SATA and USB) is controller via a GPIO.
>>=20
>> Add the regulator node for it.
>>=20
>> Older revisions just have the 5V power output always on, and the GPIO
>is
>> reserved on these boards. So it won't affect the older revisions.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
>b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
>> index 7b52608cebe6..035599d870b9 100644
>> --- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
>> +++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
>> @@ -78,6 +78,15 @@
>>  		};
>>  	};
>> =20
>> +	reg_vcc5v0: vcc5v0 {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "vcc5v0";
>> +		regulator-min-microvolt =3D <5000000>;
>> +		regulator-max-microvolt =3D <5000000>;
>> +		gpio =3D <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
>> +		enable-active-high;
>
>This is redundant with the GPIO flag

I remember someone suggested me to add this
property (maybe wens). It's said that the driver may not
process the GPIO_ACTIVE_HIGH correctly.

>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
