From: Eddie Cai <eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] ARM: dts: rockchip:remove hs200 support for firefly reload
Date: Fri, 26 May 2017 15:03:05 +0800
Message-ID: <CAJrj+DN+TcXGHp5HScLJrka9ESHh=8677VtU7g8fQaLPMBxe_g@mail.gmail.com>
References: <1495616267-5305-1-git-send-email-eddie.cai.linux@gmail.com> <354b634b-0ba6-682e-95fa-52b32e3cc94c@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <354b634b-0ba6-682e-95fa-52b32e3cc94c-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

2017-05-26 14:49 GMT+08:00 Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>:
> Hi Eddie,
>
> =E5=9C=A8 2017/5/24 16:57, Eddie Cai =E5=86=99=E9=81=93:
>>
>> due to layout limitation. not all of the reload board can support hs200.
>> so remove hs200 support to make all board can boot up.
>>
>> Signed-off-by: Eddie Cai <eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
>> b/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
>> index 4cfa109..56ac1e6f 100644
>> --- a/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
>> +++ b/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
>> @@ -75,8 +75,6 @@
>>         bus-width =3D <8>;
>>         cap-mmc-highspeed;
>>         disable-wp;
>> -       mmc-hs200-1_8v;
>
>
> On which tree were you basing? I can't git-am this one for today's
> linux-next?
It based on torvalds's tree
>
>
>>         non-removable;
>>         num-slots =3D <1>;
>>         pinctrl-names =3D "default";
>>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
