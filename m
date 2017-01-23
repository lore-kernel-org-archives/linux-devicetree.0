From: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/9] Implement clocksource for rockchip SoC using rockchip timer
Date: Mon, 23 Jan 2017 20:24:47 +0300
Message-ID: <58B283B0-02F6-4342-A6D2-7E082E04863E@gmail.com>
References: <1480343486-25539-1-git-send-email-al.kochet@gmail.com> <E6DD9335-0D2D-47CB-8098-5F96C2E08139@gmail.com> <20170123144744.GE2166@mai> <1793912.WfGyM7qEjy@diego>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1793912.WfGyM7qEjy@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Heiko, Daniel, thanks a lot for review!
I=E2=80=99ll send v5 series this week.

Heiko, Daniel, may I add 'Reviewed-by:=E2=80=99 to patch series?

Reviewed-by: Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> ?
Reviewed-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> ?

Regards,
Alexander.

> 23 =D1=8F=D0=BD=D0=B2. 2017 =D0=B3., =D0=B2 20:12, Heiko St=C3=BCbner =
<heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=B0):
>=20
> Am Montag, 23. Januar 2017, 15:47:44 CET schrieb Daniel Lezcano:
>> On Wed, Dec 21, 2016 at 05:21:05PM +0300, Alexander Kochetkov wrote:
>>> Hello Heiko, Daniel!
>>>=20
>>> Are there any reasons why the patches [1][2] are not applied yet =
into
>>> kernel? How can I help in applying patches?
>>=20
>> Hi Alexander,
>>=20
>> sorry for the delay. Let me review them before taking the patchset.
>>=20
>> Heiko, can you have a look to them also ?
>=20
> somehow this series moved down to much in my inbox, sorry.
>=20
> Devicetree changes look good, except where I commented.
> I guess it would be best (least intrusive) if I queue up the (then =
fixed)=20
> devicetree changes after you are satisfied with the code parts.
>=20
> I've also looked over the code changes again, test-build them and =
found the=20
> build error mentioned separately. Overall they look good though.
>=20
>=20
> Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
