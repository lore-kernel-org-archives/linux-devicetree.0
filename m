From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] imx27: dt: only map 1 Kbyte for fec registers
Date: Tue, 12 May 2015 09:01:17 +0200
Message-ID: <20150512070117.GV12671@pengutronix.de>
References: <1431204870-17233-1-git-send-email-tremyfr@gmail.com>
 <20150511120101.GA25495@tiger>
 <55511E34.5040908@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55511E34.5040908-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philippe Reynes <tremyfr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On Mon, May 11, 2015 at 11:25:08PM +0200, Philippe Reynes wrote:
> On 11/05/15 14:01, Shawn Guo wrote:
> >On Sat, May 09, 2015 at 10:54:30PM +0200, Philippe Reynes wrote:
> >>According to the imx27 documentation, fec has a 1 Kbyte
> >>memory space map, spitted in two regions of 512 bytes.
> >>The first one for control/status registers, and the
> >>second one for event/statistic registers. So, we don't
> >>need to map 16 Kbyte for registers, 1 Kbyte is enough.
> >>
> >>Signed-off-by: Philippe Reynes<tremyfr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>---
> >>  arch/arm/boot/dts/imx27.dtsi |    2 +-
> >>  1 files changed, 1 insertions(+), 1 deletions(-)
> >>
> >>diff --git a/arch/arm/boot/dts/imx27.dtsi b/arch/arm/boot/dts/imx27=
=2Edtsi
> >>index 6951b66..56bb917 100644
> >>--- a/arch/arm/boot/dts/imx27.dtsi
> >>+++ b/arch/arm/boot/dts/imx27.dtsi
> >>@@ -533,7 +533,7 @@
> >>
> >>  			fec: ethernet@1002b000 {
> >>  				compatible =3D "fsl,imx27-fec";
> >>-				reg =3D<0x1002b000 0x4000>;
> >>+				reg =3D<0x1002b000 0x400>;
> >
> >No.  Per MCIMX27RM.pdf, Table 2-7. AIPI2 Memory Map, it should be 4K=
iB.
>=20
> I agree, this table show that 4KiB is reserved for fec registers.
> But, in paragraph 29.6.1, there is :
> "The FEC implementation requires a 1-Kbyte memory map space"
> So I've thought that 1 Kbye is enough for the register memory space.
The table 2-7 suggests that 4 KiB are routed to the fec even though the
fec module might only make use of the first 1 KiB. That's no
contradiction. The convention used in the device trees is that the firs=
t
amount is used.

> I'm pleased to understand that we're both agree that 16 Kbyte is too =
large.
>=20
> If you prefer 4 Kbyte, I'll send a v2 of this patch with this value.
Yes please. In the commit log you might want to point out that a length
of 16 KiB overlaps with the (currently unused?) Security Controller
(SCC) of the i.MX27.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
