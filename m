From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 3/3] ARM: dts: Specify VMMC and VQMMC on rk3288-evb
Date: Wed, 11 Mar 2015 15:13:58 -0700
Message-ID: <CAD=FV=WXcYshHo5vUxyghHfnMDgObVXX7aWQ10OsCUzUfapfFQ@mail.gmail.com>
References: <1418689340-29517-1-git-send-email-dianders@chromium.org>
	<1418689340-29517-3-git-send-email-dianders@chromium.org>
	<1798568.RumoICfKOO@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1798568.RumoICfKOO@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seungwon Jeon <tgih.jun-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandru Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Heiko,

On Tue, Jan 6, 2015 at 9:44 AM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wr=
ote:
> Hi Doug,
>
> Am Montag, 15. Dezember 2014, 16:22:20 schrieb Doug Anderson:
>> Specifying these rails should eventually let us do UHS.
>>
>> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>> Changes in v3: None
>> Changes in v2:
>> - Fix subject line
>>
>>  arch/arm/boot/dts/rk3288-evb.dtsi | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi
>> b/arch/arm/boot/dts/rk3288-evb.dtsi index 3e067dd..d660fe6 100644
>> --- a/arch/arm/boot/dts/rk3288-evb.dtsi
>> +++ b/arch/arm/boot/dts/rk3288-evb.dtsi
>> @@ -114,6 +114,8 @@
>>       pinctrl-names =3D "default";
>>       pinctrl-0 =3D <&sdmmc_clk &sdmmc_cmd &sdmmc_cd &sdmmc_bus4>;
>>       status =3D "okay";
>> +     vmmc-supply =3D <&vcc_io>;
>
> according to the schematics there is a switch between the card and vc=
c_io with
> a controlling pin called SDMMC_PWR providing a supply called vcc_sd.
>
> So there should probably be a fixed-regulator get introduced for this=
, like the
> older rockchip boards do.

OK, I found the problem.  I've got a 1.0 board and the associated
schematics.  Supporting your 2.0 board with the extra regulator should
be no problem though.

Patch coming up shortly.

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
