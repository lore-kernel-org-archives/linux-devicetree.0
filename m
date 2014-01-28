From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/9] ARM: dts: imx6sl: remove the use of pingrp macros
Date: Tue, 28 Jan 2014 19:20:49 +0800
Message-ID: <20140128112047.GC20583@S2101-09.ap.freescale.net>
References: <1390668191-20289-1-git-send-email-shawn.guo@linaro.org>
 <1390668191-20289-3-git-send-email-shawn.guo@linaro.org>
 <5923680.sl3G3EgCsY@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5923680.sl3G3EgCsY@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 28, 2014 at 11:17:22AM +0100, Heiko St=FCbner wrote:
> [... and so on for the other groups ... ]
>=20
> I'm confused now :-) . Current linux-next [0] shows the pin-settings =
as part=20
> of imx6sl.dtsi - a way a lot of other architectures organize their pi=
ngroups=20
> too, with the board file only referencing the relevant pingroups from=
 the=20
> predefined ones of the soc.
>=20
> So I guess your move to the pingrp-header moved them out of the imx6s=
l.dtsi to=20
> the .h and is not part of linux-next;

Yes, my for-next branch was excluded from linux-next temporarily for
some reason.  I will ask Stephen to add it back once v3.14-rc1 is out.
That said, you can see nothing we developed in this cycle on linux-next
for now.

> but this patch (and the others in this=20
> series) now moves the definitions into the individual board files. Ca=
n't you=20
> just move them back to the soc-dtsi files to prevent each board dupli=
cating=20
> them?

No.  That will bring back the problem we try to solve from the
beginning [1].

Shawn

[1] http://thread.gmane.org/gmane.linux.ports.arm.kernel/275912/

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
