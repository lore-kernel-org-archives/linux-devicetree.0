From: Naoki FUKAUMI <naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: rockchip: add dts for ChipSPARK Rayeager
 PX2 board
Date: Fri, 16 Jan 2015 22:05:08 +0900
Message-ID: <CAFnsNoTitoUk2n2WWqzo_=7_VN4YXdKuGC-_fF3c4tNbasQjEQ@mail.gmail.com>
References: <1421289659-16627-1-git-send-email-naobsd@gmail.com>
	<1421289659-16627-4-git-send-email-naobsd@gmail.com>
	<2706590.Kkspa3JYVn@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2706590.Kkspa3JYVn@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

thank you for your review!

On Fri, Jan 16, 2015 at 1:19 AM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
>> +     vcc_sata: sata-regulator {
>> +             compatible =3D "regulator-fixed";
>> +             enable-active-high;
>> +             gpio =3D <&gpio4 22 GPIO_ACTIVE_HIGH>;
>> +             pinctrl-names =3D "default";
>> +             pinctrl-0 =3D <&sata_pwr>;
>> +             regulator-name =3D "usb_5v";
>
> why is it named "usb_5v"?

it's came from schematic.

I think it follows same rule as "vcc_host { regulator-name =3D
"host-pwr"; }" in rk3188-radxarock.dts.

I'll include rest of your comments in v2.

Regards,
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
