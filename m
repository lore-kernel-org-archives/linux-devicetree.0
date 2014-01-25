From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: DT include files
Date: Sat, 25 Jan 2014 10:25:22 +0800
Message-ID: <20140125022519.GA8759@S2101-09.ap.freescale.net>
References: <20140103023211.GA25079@S2101-09.ap.freescale.net>
 <201401122121.20084.arnd@arndb.de>
 <20140113021912.GB23525@S2101-09.ap.freescale.net>
 <2907925.DyxHkYtGr7@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2907925.DyxHkYtGr7@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 24, 2014 at 09:02:09AM +0100, Heiko St=FCbner wrote:
> Hi Shawn,
>=20
> did this topic get any final resolution - especially in terms of the =
pingrp.h=20
> header?
>=20
> As I'm currently preparing two board files (imx50 and imx6sl) this di=
scussion=20
> made me unsure if using the pin-group definitions is still the prefer=
red style.

Yes, we need to get a conclusion ASAP.  The whole imx-dt-3.14 pull
request has been held for a few weeks because of that, and I'm asking
for direction there [1].

Shawn

[1] http://thread.gmane.org/gmane.linux.drivers.devicetree/58685/focus=3D=
296761

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
