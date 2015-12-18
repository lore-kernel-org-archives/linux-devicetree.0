From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v1 1/6] ARM: dts: fix the correct pinctrl control for
 rk3036
Date: Fri, 18 Dec 2015 09:29:58 +0800
Message-ID: <56736196.8050007@rock-chips.com>
References: <1450362112-8075-1-git-send-email-wxt@rock-chips.com>
 <1450362112-8075-2-git-send-email-wxt@rock-chips.com>
 <1838222.r8GKl7OzB9@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1838222.r8GKl7OzB9@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, leozwang-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Heiko,

=E5=9C=A8 2015=E5=B9=B412=E6=9C=8818=E6=97=A5 07:28, Heiko St=C3=BCbner=
 =E5=86=99=E9=81=93:
> Am Donnerstag, 17. Dezember 2015, 22:21:47 schrieb Caesar Wang:
>> The pinctrl gpio pull up/down is incorrect since the rk3036 SoCs
>> can't set the status in the internal.
>>
>> We should keep the default status for enable the gpio status,
>> In fact, the pull_none is the disable the gpio pull up/down.
>>
>> Signed-off-by: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>  From the signed-off-by's I guess this change was created by Xing (au=
thor),
> right?

The original patch:

-		pcfg_pull_up: pcfg-pull-up {
-			bias-pull-up;
-		};
-
-		pcfg_pull_down: pcfg-pull-down {
-			bias-pull-down;
+		pcfg_pull_default: pcfg_pull_default {
+			bias-pull-pin-default;

I'm re-writing the patch to fit the others.

Yep, the seem should change commit author as the

Signed-off-by: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>



>
> Heiko
>
>> ---
>>
>>   arch/arm/boot/dts/rk3036.dtsi | 34 +++++++++++++++----------------=
---
>>   1 file changed, 15 insertions(+), 19 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk303=
6.dtsi
>> index f8758bf..620e6e0 100644
>> --- a/arch/arm/boot/dts/rk3036.dtsi
>> +++ b/arch/arm/boot/dts/rk3036.dtsi
>> @@ -427,12 +427,8 @@
>>   			#interrupt-cells =3D <2>;
>>   		};
>>
>> -		pcfg_pull_up: pcfg-pull-up {
>> -			bias-pull-up;
>> -		};
>> -
>> -		pcfg_pull_down: pcfg-pull-down {
>> -			bias-pull-down;
>> +		pcfg_pull_default: pcfg_pull_default {
>> +			bias-pull-pin-default;
>>   		};
>>
>>   		pcfg_pull_none: pcfg-pull-none {
>> @@ -473,18 +469,18 @@
>>   			};
>>
>>   			emmc_cmd: emmc-cmd {
>> -				rockchip,pins =3D <2 1 RK_FUNC_2 &pcfg_pull_none>;
>> +				rockchip,pins =3D <2 1 RK_FUNC_2 &pcfg_pull_default>;
>>   			};
>>
>>   			emmc_bus8: emmc-bus8 {
>> -				rockchip,pins =3D <1 24 RK_FUNC_2 &pcfg_pull_none>,
>> -						<1 25 RK_FUNC_2 &pcfg_pull_none>,
>> -						<1 26 RK_FUNC_2 &pcfg_pull_none>,
>> -						<1 27 RK_FUNC_2 &pcfg_pull_none>,
>> -						<1 28 RK_FUNC_2 &pcfg_pull_none>,
>> -						<1 29 RK_FUNC_2 &pcfg_pull_none>,
>> -						<1 30 RK_FUNC_2 &pcfg_pull_none>,
>> -						<1 31 RK_FUNC_2 &pcfg_pull_none>;
>> +				rockchip,pins =3D <1 24 RK_FUNC_2 &pcfg_pull_default>,
>> +						<1 25 RK_FUNC_2 &pcfg_pull_default>,
>> +						<1 26 RK_FUNC_2 &pcfg_pull_default>,
>> +						<1 27 RK_FUNC_2 &pcfg_pull_default>,
>> +						<1 28 RK_FUNC_2 &pcfg_pull_default>,
>> +						<1 29 RK_FUNC_2 &pcfg_pull_default>,
>> +						<1 30 RK_FUNC_2 &pcfg_pull_default>,
>> +						<1 31 RK_FUNC_2 &pcfg_pull_default>;
>>   			};
>>   		};
>>
>> @@ -522,12 +518,12 @@
>>
>>   		uart0 {
>>   			uart0_xfer: uart0-xfer {
>> -				rockchip,pins =3D <0 16 RK_FUNC_1 &pcfg_pull_up>,
>> +				rockchip,pins =3D <0 16 RK_FUNC_1 &pcfg_pull_default>,
>>   						<0 17 RK_FUNC_1 &pcfg_pull_none>;
>>   			};
>>
>>   			uart0_cts: uart0-cts {
>> -				rockchip,pins =3D <0 18 RK_FUNC_1 &pcfg_pull_up>;
>> +				rockchip,pins =3D <0 18 RK_FUNC_1 &pcfg_pull_default>;
>>   			};
>>
>>   			uart0_rts: uart0-rts {
>> @@ -537,7 +533,7 @@
>>
>>   		uart1 {
>>   			uart1_xfer: uart1-xfer {
>> -				rockchip,pins =3D <2 22 RK_FUNC_1 &pcfg_pull_none>,
>> +				rockchip,pins =3D <2 22 RK_FUNC_1 &pcfg_pull_default>,
>>   						<2 23 RK_FUNC_1 &pcfg_pull_none>;
>>   			};
>>   			/* no rts / cts for uart1 */
>> @@ -545,7 +541,7 @@
>>
>>   		uart2 {
>>   			uart2_xfer: uart2-xfer {
>> -				rockchip,pins =3D <1 18 RK_FUNC_2 &pcfg_pull_none>,
>> +				rockchip,pins =3D <1 18 RK_FUNC_2 &pcfg_pull_default>,
>>   						<1 19 RK_FUNC_2 &pcfg_pull_none>;
>>   			};
>>   			/* no rts / cts for uart2 */
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


--=20
caesar wang | software engineer | wxt-TNX95d0MmH73oGB3hsPCZA@public.gmane.org


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
