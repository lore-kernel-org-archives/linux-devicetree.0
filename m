From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v12 0/3] ARM: rk3288: Add PM Domain support
Date: Fri, 28 Nov 2014 10:57 +0100
Message-ID: <1454366.cVgT9MeyeC@diego>
References: <1416217842-4716-1-git-send-email-caesar.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416217842-4716-1-git-send-email-caesar.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <caesar.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, fzf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, chris.zhong-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxm-TNX95d0MmH7DzftRWevZcw@public.gmane.org, chm-TNX95d0MmH7DzftRWevZcw@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, "jinkun.hong" <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jack Dai <jack.dai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Montag, 17. November 2014, 17:50:38 schrieb Caesar Wang:
>     Add power domain drivers based on generic power domain for
>     Rockchip platform, and support RK3288.
>=20
>     https://chromium-review.googlesource.com/#/c/220253/9
>     This is the GPU driver, add the following information in DT,
>     and it can support the PMDOMAIN

I'm not sure what to do with this series. Kevin had concerns about the =
clocks=20
being part of the power-domains and I don't see them actually addressed=
 and/or=20
Kevin being satisfied - actually he isn't even on the recipients list o=
f this=20
version of the series.


@Ceasar: you should include people being part of important previous=20
conversations in new versions of patchsets - especially when they have =
voiced=20
concerns.


I've added Tomasz whom I remember having previous experience on the Exy=
nos=20
Powerdomains, so maybe he can add some other perspective - new ideas.


@Tomasz: this is the part of Kevin's concerns from v10 of the powerdoma=
in=20
series:

Am Donnerstag, 13. November 2014, 12:24:47 schrieben Kevin Hilman:
> Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> writes:
> > Am Dienstag, 11. November 2014, 08:53:13 schrieb Kevin Hilman:
> >> I still don't like having lists of clocks in the power-domain DT.
> >>=20
> >> DT is supposed to describe the hardware, and clocks are properties=
 of
> >> devices, not power-domains, so the DT description should follow fr=
om
> >> that.
> >=20
> > on the policy side one could argue that if the clock needs to be en=
abled
> > to
> > achieve sucessful domain state-changes, that it is also a property =
of the
> > domain itself in addition to the device.
>=20
> You could, but from a hardware perspective, the clock is a property o=
f
> the device.
>=20
> > And on the pratical side we don't have drivers nor bindings for a b=
ig part
> > of the domain users - and this will probably be true for quite some=
 time.
> > This of course makes it very impractical (or impossible) to collect=
 the
> > clocks for parts like the gpu (mali), hevc, vcodec (video
> > encoder/decoder), rga (2d stuff), iep, isp.
>=20
> This doesn't sound impossible at all.
>=20
> You have to collect the clocks anyways.  The only debate is whether t=
o
> list them in the device node or the power-domain node.
>=20
> Even for devices without drivers, you just need a minimal node in the=
 DT if
> which lists the clocks and has a phandle to the parent power domain.
>=20
> Sounds rather simple to me, and since the DT is supposed to describe =
the
> hardware, doing it this way makes looking at the DT actually help
> understand the hardware.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
