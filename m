From: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 7/7] ARM: dts: ifc6410: add inforce LVDS panel support
Date: Tue, 28 Jul 2015 14:47:19 -0400
Message-ID: <CAF6AEGvps12_faC5kU-bVueFgK=EErXNYumgA9Rs9zRpTjy+7w@mail.gmail.com>
References: <1438087956-17307-1-git-send-email-srinivas.kandagatla@linaro.org>
	<1438088076-17606-1-git-send-email-srinivas.kandagatla@linaro.org>
	<55B7C0DC.2010501@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B7C0DC.2010501-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 28, 2015 at 1:50 PM, Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>=
 wrote:
> Am 28.07.2015 um 14:54 schrieb Srinivas Kandagatla:
>> This patch adds LVDS panel for IFC6410.
>>
>> Signed-off-by: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> [Rob Clark: WIP patch]
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 66 +++++++++++++++++++=
+++++++++++
>>  1 file changed, 66 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/b=
oot/dts/qcom-apq8064-ifc6410.dts
>> index 1ab71f1..3bdac02 100644
>> --- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
>> +++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
>> @@ -63,6 +63,12 @@
>>                                       qcom,switch-mode-frequency =3D=
 <3200000>;
>>                               };
>>
>> +                             pm8921_l2: l2 {
>> +                                     regulator-min-microvolt =3D <1=
200000>;
>> +                                     regulator-max-microvolt =3D <1=
200000>;
>> +                                     bias-pull-down;
>> +                             };
>> +
>>                               pm8921_l3: l3 {
>>                                       regulator-min-microvolt =3D <3=
050000>;
>>                                       regulator-max-microvolt =3D <3=
300000>;
>> @@ -96,6 +102,10 @@
>>                               pm8921_lvs1: lvs1 {
>>                                       bias-pull-down;
>>                               };
>> +
>> +                             pm8921_lvs7: lvs7 {
>> +                                     bias-pull-down;
>> +                             };
>>                       };
>>               };
>>
>> @@ -119,6 +129,41 @@
>>
>>               mdp: qcom,mdp@5100000 {
>>                       status =3D "okay";
>> +                     qcom,lvds-panel =3D <&panel>;
>
> In my testing this broke/uglified HDMI output. Since not everyone has
> that LVDS panel attached, or might have a different panel type, I don=
't
> think the panel node belongs in the generic -ifc6410.dts file.
> I suggest you add an -ifc6410+inforce-lvds.dts or so for that.

I think the problem is not so much the dt bindings, since we have an
i2c/ddc where we can probe the panel's edid and see if it is actually
attached.

Probably panel_simple_probe() should attempt to read edid (or at least
first block) if ddc is not null, and return an error if that times
out.  That way we could tell at runtime whether the panel is there or
not.

BR,
-R

>> +                     lvds-vccs-3p3v-supply =3D <&ext_3p3v>;
>> +                     lvds-pll-vdda-supply =3D <&pm8921_l2>;
>> +                     lvds-vdda-supply =3D <&pm8921_lvs7>;
>> +             };
>> +
>> +             panel_3p3v: panel_3p3v {
>
> s/_/-/ ?
>
>> +                     compatible =3D "regulator-fixed";
>> +                     pinctrl-0 =3D <&disp_en_gpios>;
>> +                     pinctrl-names =3D "default";
>> +                     regulator-min-microvolt =3D <3300000>;
>> +                     regulator-max-microvolt =3D <3300000>;
>> +                     regulator-name =3D "panel_en_3p3v";
>> +                     regulator-type =3D "voltage";
>> +                     startup-delay-us =3D <0>;
>> +                     gpio =3D <&pm8921_gpio 36 GPIO_ACTIVE_HIGH>;
>> +                     enable-active-high;
>> +                     regulator-boot-on;
>> +             };
>> +
>> +             backlight: backlight{
>> +                     pinctrl-0 =3D <&pwm_bl_gpios>;
>> +                     pinctrl-names =3D "default";
>> +                     compatible =3D "gpio-backlight";
>> +                     gpios =3D <&pm8921_gpio 26 GPIO_ACTIVE_HIGH>;
>> +                     default-on;
>> +             };
>> +
>> +             panel: auo,b101xtn01 {
>
> panel: panel { ?
>
> Regards,
> Andreas
>
>> +                     status =3D "okay";
>> +                     compatible =3D "auo,b101xtn01";
>> +
>> +                     ddc-i2c-bus =3D <&i2c3>;
>> +                     backlight =3D <&backlight>;
>> +                     power-supply =3D <&panel_3p3v>;
>>               };
>>
>>               gsbi3: gsbi@16200000 {
>> @@ -235,6 +280,27 @@
>>                               pm8921_gpio: gpio@150 {
>>                                       pinctrl-names =3D "default";
>>                                       pinctrl-0 =3D <&wlan_default_g=
pios>;
>> +
>> +                                     pwm_bl_gpios: pwm-bl-gpios {
>> +                                             pios {
>> +                                                     pins =3D "gpio=
26";
>> +                                                     bias-disable;
>> +                                                     function =3D "=
normal";
>> +                                                     qcom,drive-str=
ength =3D <PMIC_GPIO_STRENGTH_HIGH>;
>> +                                                     power-source =3D=
 <PM8921_GPIO_S4>;
>> +                                             };
>> +                                     };
>> +
>> +                                     disp_en_gpios: disp-en-gpios {
>> +                                             pios {
>> +                                                     pins =3D "gpio=
36";
>> +                                                     bias-disable;
>> +                                                     function =3D "=
normal";
>> +                                                     qcom,drive-str=
ength =3D <PMIC_GPIO_STRENGTH_HIGH>;
>> +                                                     power-source =3D=
 <PM8921_GPIO_S4>;
>> +                                             };
>> +                                     };
>> +
>>                                       wlan_default_gpios: wlan-gpios=
 {
>>                                               pios {
>>                                                       pins =3D "gpio=
43";
>>
>
>
> --
> SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Felix Imend=C3=B6rffer, Jane Smithard, Dilip Upmanyu, Graham Nort=
on; HRB
> 21284 (AG N=C3=BCrnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
