From: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 3/8] ARM: dts: rockchip: add timer entries to rk3188 SoC
Date: Mon, 30 Jan 2017 16:13:07 +0300
Message-ID: <046978C2-808F-4EC3-9429-063BC1A7CE7B@gmail.com>
References: <1485260203-14216-1-git-send-email-al.kochet@gmail.com> <1485260203-14216-4-git-send-email-al.kochet@gmail.com> <20170130110428.GC2206@mai> <A5940770-B960-4409-8DA4-BE39EF9A6325@gmail.com> <20170130120444.GE2206@mai>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170130120444.GE2206@mai>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> 30 =D1=8F=D0=BD=D0=B2. 2017 =D0=B3., =D0=B2 15:04, Daniel Lezcano =
<daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=
=B0):
>=20
> There is no case when the rockchip timer is used for the clockevent.
The is already timer entry for rk3228 in the DT. And it act as =
clockevent. I guess it work as backup,
but I cannot test it also. In order to not break DT compatibility I had =
to provide one timer to be
initialized as clockevent. And implemented implicit rule the driver =
(first DT timer - clockevent,
second DT timer - clocksource) already exists for other timers.

> If I'm not wrong, you can check /proc/interrupts and see there is no =
interrupt
> on the rockchip timer.

Yes, you right here. I=E2=80=99ve temporary disable smp_twd to test =
rockchip timer interrupts.
There is no interrupt on the rockchip timer during normal work.

> - when the CPU enters a deep idle state. But such state does not exist =
on rk3188
ARM chip/revision specific?

> - when the system goes to suspend. But the timers are stopped in any =
case and
>   CPU0 is always on.
There is timer for rk3228 in the DT. I guess there are situations where =
it can be used.
May be the situations are also acceptable for rk3188? May be something =
like suspend to RAM or
suspend to HDD? I am not expert in that questions. I can do some tests =
if you give hint/link.

So, as I understood you suggest to leave only one timer what can be used =
as clocksource
only. I can implement that, but there should be DT rule what allow to =
setup timer
as clocksource only. I cannot do more without timer framework support.
Looks, like I have to wait your patch to implement that.

Alexander.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
