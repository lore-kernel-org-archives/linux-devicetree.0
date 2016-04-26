From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM64: dts: rockchip: add dts file for RK3399
 evaluation board
Date: Tue, 26 Apr 2016 13:53:58 -0700
Message-ID: <CAD=FV=Wgnz-vBo71f3mqFxcOpL7fJX58hXPJ+vk9uHpymqdN5Q@mail.gmail.com>
References: <1461638206-20473-1-git-send-email-jay.xu@rock-chips.com>
	<1461638206-20473-5-git-send-email-jay.xu@rock-chips.com>
	<9945516.Q6LYCrkl5z@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9945516.Q6LYCrkl5z@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, lintao <lintao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Riley <davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Apr 26, 2016 at 5:37 AM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
>> +     model =3D "Rockchip RK3399 Evaluation Board";
>> +     compatible =3D "rockchip,rk3399-evb", "rockchip,rk3399",
>> +                  "google,rk3399evb-rev2", google,rk3399evb-rev1",
>> +                  "google,rk3399evb-rev0" ;
>
> can you check against which compatibles that coreboot really matches?
>
> As we said that the evb changed between rev1 and rev2, I would expect=
 the
> compatible to be something like
>
>         compatible =3D "rockchip,rk3399-evb",  "google,rk3399evb-rev2=
",
>                         "rockchip,rk3399";
>
> leaving out the rev1 and rev0

What Heiko suggests seems reasonable to me.

It all depends on what your bootloader is doing and what you guys want
to do.  Chrome OS designs that I've worked on have had board
strappings that you can read a board ID from and that's how the BIOS
(like coreboot) will figure out which board ID it is running on.  I'm
not aware of such strappings on rk3399-evb.  Do they exist?

Of course, even without strappings it's possible to get the bootloader
to work sanely.  You can either define the revision number at build
time or you can store the revision number somewhere non-volatile.


-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
