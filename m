From: Naoki FUKAUMI <naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/3] ARM: dts: rockchip: add dts for Firefly
 Firefly-RK3288 boards
Date: Mon, 19 Jan 2015 10:16:50 +0900
Message-ID: <CAFnsNoSY=Zu2tZ7h7uJKHPyZ3cAW=HxDRTJc2BGvSrNwM5N3gQ@mail.gmail.com>
References: <1421464140-29903-1-git-send-email-naobsd@gmail.com>
	<1421464140-29903-3-git-send-email-naobsd@gmail.com>
	<8724226.Kbpk2bALNd@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8724226.Kbpk2bALNd@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Jan 19, 2015 at 8:36 AM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
>> +     ext_gmac: external-gmac-clock {
>> +             compatible =3D "fixed-clock";
>> +             #clock-cells =3D <0>;
>> +             clock-frequency =3D <125000000>;
>> +             clock-output-names =3D "phy_clkout125";
>
> This should be named "ext_gmac". See the rockchip,rk3288-cru.txt bind=
ing
> document.

I'll revert this to use "ext_gmac".

>> +&gmac {
>> +     assigned-clocks =3D <&cru SCLK_MAC>;
>> +     assigned-clock-parents =3D <&ext_gmac>;
>> +     clock_in_out =3D "input";
>> +     pinctrl-names =3D "default";
>> +     pinctrl-0 =3D <&rgmii_pins>, <&phy_rst>, <&phy_pmeb>, <&phy_in=
t>;
>> +     phy_regulator =3D "vcc_lan";
>
> This is wrong in the dwmac-rk implementation at the moment which Roma=
in Perier
> was/is trying to rectify. I.e. there is an established devicetree api=
 for
> handling regulators, thus the approach the current net-code takes is =
just
> wrong and thus this will need to change after.

I see.

>> +     hym8563: hym8563@51 {
>> +             compatible =3D "haoyu,hym8563";
>> +             reg =3D <0x51>;
>> +             #clock-cells =3D <0>;
>> +             clock-frequency =3D <32768>;
>> +             clock-output-names =3D "rtc_clkout";
>
> this should be named "xin32k" . See radxarock.dts (as a rk3188 based =
similar
> example) and the rk3288 clock controller devicetree binding.

I'll revert this to use "xin32k".

> This is due to the fact that this is also the input for the suspend c=
lock and
> the core clock code expects the specific naming according to the soc
> documentation.

can I assume clock named "xin32k" is always enabled?
no need to describe consumer explicitly?

>> +&sdio0 {
>> +     broken-cd;
>> +     bus-width =3D <4>;
>> +     clocks =3D <&hym8563>;
>> +     clock-names =3D "lpo";
>
> why are you _overriding_ the clocks of the sdio controller?

sorry, I was just wrong. I'll remove clocks and clock-names from here.

>> +&spi2 {
>> +     pinctrl-names =3D "default";
>> +     pinctrl-0 =3D <&spi2_clk>, <&spi2_cs0>;
>
> you're enabling only the clk and chipselect, what about the data sign=
als?

no idea, I just follow schematic. if it's really unusable on mainline,
I'll disable(remove) spi2.

>> +&tsadc {
>> +     clocks =3D <&hym8563>;
>> +     clock-names =3D "clkin_32k";
>
> The tsadc driver only recognizes the clocks "tsadc", "apb_pclk" so I'=
m not
> sure what you're doing with the clkin_32k name here? Also you're agai=
n
> overwriting the existing property.

I was wrong here too. I'll remove clocks and clock-names from here.
and if it makes tsadc non-working, I'll remove tsadc too for now.

Regards,
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
