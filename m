From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4 3/8] Documentation: devicetree: rockchip: Document GeekBox
Date: Thu, 31 Mar 2016 19:02:01 +0200
Message-ID: <1913373.6hKqMKImXt@phil>
References: <1458136727-32075-1-git-send-email-afaerber@suse.de> <56FAE95E.6060900@suse.de> <1682289.HWd4yLL18I@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1682289.HWd4yLL18I@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 29. M=E4rz 2016, 23:21:51 schrieb Heiko St=FCbner:
> Am Dienstag, 29. M=E4rz 2016, 22:45:18 schrieb Andreas F=E4rber:
> > Am 29.03.2016 um 22:13 schrieb Heiko St=FCbner:
> > > Am Mittwoch, 16. M=E4rz 2016, 14:58:41 schrieb Andreas F=E4rber:
> > >> Use "geekbuying,geekbox" compatible string.
> > >>=20
> > >> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > >> Signed-off-by: Andreas F=E4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
> > >=20
> > > I've folded this patch into the geekbox dts patch, carrying Rob's=
 Ack
> > > for
> > > the binding over.
> >=20
> > Either you just made a mistake in my name or
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tr=
ee/Do
> > cume ntation/devicetree/bindings/submitting-patches.txt needs an up=
date.
> > It clearly says:
> >=20
> > "1) The Documentation/ portion of the patch should be a separate pa=
tch."
> >=20
> > That's why I always do it this way.
>=20
> looking at the dt-bindings git log, it seems that is handled in a var=
iety
> of ways :-) . Personally I'm doing completely new bindings separately=
 but
> the 125th addition of a board just inside the dts patch.
>=20
> But I guess we can also move it out again into a separate patch if yo=
u
> prefer that :-) .

I've split out that documentation addition again and applied this separ=
ate=20
patch instead :-) .


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
