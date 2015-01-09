From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 0/7] Pinctrl support for Zynq
Date: Fri, 9 Jan 2015 07:25:02 -0800
Message-ID: <ba4ac5f77c7549f2a264a5a5b1318dc8@BN1BFFO11FD009.protection.gbl>
References: <1d59c0972da04ec89dec6c09724986a1@BY2FFO11FD010.protection.gbl>
 <4d544fe425694a4e8043ddbf604db062@BN1AFFO11FD033.protection.gbl>
 <CACRpkdaKH21qz_RAcDtw6ycsw+5FD0RXQQs91_tZV53EuKVusQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaKH21qz_RAcDtw6ycsw+5FD0RXQQs91_tZV53EuKVusQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Alessandro Rubini <rubini-9wsNiZum9E8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2015-01-09 at 09:45AM +0100, Linus Walleij wrote:
> On Fri, Dec 12, 2014 at 5:37 PM, S=C3=B6ren Brinkmann
> <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>=20
> > Argh, this went through the wrong SMTP. I suspect threading is brok=
en
> > due to that. Let me know if you want me to resend this with intact
> > threading.
>=20
> I don't care much about the threading, but all messages are quoted-pr=
intable
> which doesn't apply :(
>=20
> i.e.:
>=20
> Content-Transfer-Encoding: quoted-printable
> (...)
>=20
> + const char *subnode_target_type =3D3D "pins";
> =3D20
> (...)
>=20
> Can you resent with more sane encoding? I don't know where this
> comes from but suspect the Microsoft Exchange SMTP server
> does this when you use diacritics and german letters...

Okay, I'll rebase to the latest pinctrl/devel branch (if needed) and
send an updated version bypassing exchange. I hope that works then.

	Thanks,
	S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
