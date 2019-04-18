From: =?UTF-8?Q?Pablo_Sebasti=c3=a1n_Greco?= <pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
Subject: Re: Re: [PATCH v3 1/7] ARM: dts: sun8i: r40:
 bananapi-m2-ultra: Tie GMAC regulators to the PIO
Date: Thu, 18 Apr 2019 09:25:19 -0300
Message-ID: <666caeac-4297-17b0-065e-00b7fd9623b4@centosproject.org>
References: <1555492863-88860-1-git-send-email-pgreco@centosproject.org>
 <1555492863-88860-2-git-send-email-pgreco@centosproject.org>
 <20190417101757.traviffiulwnzr6x@flea>
Reply-To: pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBC53DWXR44JBBNWZ4HSQKGQETN4BXZI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190417101757.traviffiulwnzr6x@flea>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


El 17/4/19 a las 07:17, Maxime Ripard escribi=C3=B3:
> Hi,
>
> On Wed, Apr 17, 2019 at 06:20:56AM -0300, Pablo Greco wrote:
>> When the GMAC support was added to the bananapi-m2-ultra, regulators
>> weren't tied to the pinctrl. Fix that.
>>
>> Signed-off-by: Pablo Greco <pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/ar=
m/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
>> index c488aaa..3da3598 100644
>> --- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
>> +++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
>> @@ -201,6 +201,8 @@
>>   &pio {
>>   	pinctrl-names =3D "default";
>>   	pinctrl-0 =3D <&clk_out_a_pin>;
>> +	vcc-pa-supply =3D <&reg_aldo2>;
> You should list all the regulators that are needed for all the pin
> banks to operate properly, not just PA
Ok, I "think" I finally understand what you mean, so according to=20
schematics in=20
https://drive.google.com/file/d/0B4PAo2nW2KfndFpmZG1OOWJ5NEU/view, it=20
should look like this
diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts=20
b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
index c488aaa..699579d 100644
--- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
+++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
@@ -201,6 +201,12 @@
 =C2=A0&pio {
 =C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-names =3D "default";
 =C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&clk_out_a_pin>;
+=C2=A0=C2=A0=C2=A0 vcc-pa-supply =3D <&reg_aldo2>;
+=C2=A0=C2=A0=C2=A0 vcc-pc-supply =3D <&reg_dcdc1>;
+=C2=A0=C2=A0=C2=A0 vcc-pd-supply =3D <&reg_dcdc1>;
+=C2=A0=C2=A0=C2=A0 vcc-pe-supply =3D <&reg_eldo1>;
+=C2=A0=C2=A0=C2=A0 vcc-pf-supply =3D <&reg_dcdc1>;
+=C2=A0=C2=A0=C2=A0 vcc-pg-supply =3D <&reg_dldo1>;
 =C2=A0};

 =C2=A0&reg_aldo2 {
--=20

I couldn't find vcc-pb, vcc-ph or vcc-pi.
If this is ok, I'll generate a v4 based on v2, and throw v3 in the trash=20
where it belongs
>> +	vcc-gmac-phy-supply =3D <&reg_dc1sw>;
> I'm not sure what that is supposed to do?
>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
Pablo.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
