From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: veyron: enable the tsadc on pinky board
Date: Sun, 27 Mar 2016 23:30:21 +0200
Message-ID: <2666341.7YP6MciD7F@diego>
References: <1450607434-6733-1-git-send-email-wxt@rock-chips.com> <2324215.uYLQVgh5FL@diego> <56F48D19.1050702@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56F48D19.1050702-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <caesar.upstream-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Caesar,

Am Freitag, 25. M=C3=A4rz 2016, 08:58:01 schrieb Caesar Wang:
> =E5=9C=A8 2016=E5=B9=B403=E6=9C=8825=E6=97=A5 05:12, Heiko St=C3=BCbn=
er =E5=86=99=E9=81=93:
> > Am Sonntag, 20. Dezember 2015, 18:30:34 schrieb Caesar Wang:
> >> I think the tsadc is fakly hand on pinky board,
> >> maybe that's fixed in newest kernel.
> >> As the following patch is a example:
> >> https://patchwork.kernel.org/patch/7472051/
> >>=20
> >> I don't have meet this issue on pinky board.
> >> Let me know if that's still hanging on pinky board.
> >>=20
> >> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >=20
> > I just gave that a try again on my pinky-rev2. And while the tsadc =
did
> > produce some results and didn't hang the system in my tries, the
> > temperature values seemed to be frozen (only changing once on every
> > reboot).
> >=20
> > Running the same kernel on a Jerry produced the expected results of=
 the
> > temperature changing over time and differing cpu frequencies.
> >=20
> > Pinky also is a sort of dinosaur and only you and me seem to still =
like
> > them>=20
> > :-) . And something is definitly strange here, and I'd tend to keep=
 the
> > :tsadc>=20
> > disabled for the time being.
>=20
> I remember the same issue on
> https://code.google.com/p/chrome-os-partner/issues/detail?id=3D35060 =
in
> the past
>=20
> "thermal can 't work if  the hardware C1106 isn't removed in the
> attachment."
>=20
> So I think you can change this early board.

As I'm a total noob when it comes to soldering (especially on such a ti=
ny=20
scale), I don't think that is an option ;-) .

Reading that bug report again, brought back memories, that exactly this=
 was=20
the issue why suspend didn't work correctly for me then.

So I still think I'll keep the tsadc on pinky as it is now - as I said =
before,=20
it looks like you and me are the only people still caring for pinky and=
=20
everybody else most likely put theirs into the trash already, so nothin=
g=20
terrible important is affected by this :-)


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
