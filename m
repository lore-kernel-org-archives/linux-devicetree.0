From: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/9] ARM: dts: rockchip: update compatible property for rk3228 timer
Date: Mon, 23 Jan 2017 19:13:06 +0300
Message-ID: <FD75C944-4CE5-4393-8E49-79E47101D77F@gmail.com>
References: <1480343486-25539-1-git-send-email-al.kochet@gmail.com> <1480436092-10728-1-git-send-email-al.kochet@gmail.com> <1480436092-10728-3-git-send-email-al.kochet@gmail.com> <20170123154046.GF2166@mai>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170123154046.GF2166@mai>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Daniel!

:
> +
> +&timer {
> +	compatible =3D "rockchip,rk3228-timer", "rockchip,rk3288-timer";
> +};

> 23 =D1=8F=D0=BD=D0=B2. 2017 =D0=B3., =D0=B2 18:40, Daniel Lezcano =
<daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=
=B0):
>=20
> I'm not sure this is correct, to which timer &timer will refer ?
>=20
>        timer {
>                compatible =3D "arm,armv7-timer";
> 		...
> 	}
>=20
>        timer: timer@110c0000 {
>                compatible =3D "rockchip,rk3288-timer";
> 		...
> 	}

The block '&timer { =E2=80=A6}' change compatible string for 'timer: =
timer@110c0000=E2=80=99 timer'. It refers to it using =E2=80=99timer:=E2=80=
=99 label.
'arm,armv7-timer=E2=80=99 has =E2=80=99timer=E2=80=99 node name without =
label and cannot be addressed in underline dts files.

> Why not change the compatible string in the timer definition in =
rk322x.dtsi ?

Initially my patch series was for rk3188 only. I declared rk3188 timer =
using rk3228 compatible string[1].
Heiko reviewed the series and suggest[2] to use another =
=E2=80=98compatible=3D=E2=80=98 binding for rk3188. And
suggest[3] to update rockchip,rk-timer.txt bindings, like =
mmc/rockchip-dw-mshc.txt does.
So I updated rockchip,rk-timer.txt. rk322x family has has two parts =
rk3228 and rk3229. So I replaced
rk322x to rk3228 and rk3229 and updated dts file to match bindings.

[1] =
http://lists.infradead.org/pipermail/linux-rockchip/2016-November/013152.h=
tml
[2] =
http://lists.infradead.org/pipermail/linux-rockchip/2016-November/013174.h=
tml
[3] =
http://lists.infradead.org/pipermail/linux-rockchip/2016-November/013174.h=
tml

> Same comment for the other patches doing these changes.
>=20
>  -- Daniel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
