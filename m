From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 0/4] arm64: add initial support for the Rockchip rk3368
Date: Fri, 26 Jun 2015 09:17:25 +0200
Message-ID: <2154359.YLevLOlh2Y@diego>
References: <1650408.ovnAjReNFJ@diego> <558CD6AE.7030505@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <558CD6AE.7030505-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bamvor Jian Zhang <bamv2005-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Bamvor,

Am Freitag, 26. Juni 2015, 12:35:58 schrieb Bamvor Jian Zhang:
> Could I test the code on rk3368 STB such as EKB368, CSA90?
> Is there some documents about it?

General information on flashing generic Rockchip devices can be found o=
n [0].=20
That didn't change for the rk3368 it seems - although a device _might_ =
be=20
locked down to prevent reflashing it seems.

You will of course also need a serial console on the device for the tim=
e=20
being, so finding the test-points and soldering is probably required.


Heiko


[0] http://linux-rockchip.info


> On 06/26/2015 02:12 AM, Heiko St=FCbner wrote:
> > This adds initial support for the new rk3368 ARM64 soc from Rockchi=
p.
> >=20
> > Overall it looks like someone dropped some A53 cores into a rk3288,=
 so
> > it shares a lot of peripherals that only differ in details. Therefo=
re
> > stuff like the mmc, usb, spi, i2c controllers work out of the box.
> > The support for the gmac already made it into the merge window as w=
ell
> > as the pinctrl support.
> >=20
> > Interestingly, in its core the rk3368 seems trying to be a model st=
udent
> > with psci for smp and using scpi for ddr frequency scaling, althoug=
h I
> > currently do not understand how the mailbox works yet. The display
> > controllers also are only minimally different so I'm hopefully to h=
ave
> > working graphics in the near-ish future :-)
> >=20
> >=20
> > As mentioned in the dts patch, this series depends on the dt-bindin=
g
> > header for the clock ids, so will need a shared branch once this is=
 ready.
> >=20
> > Heiko Stuebner (4):
> >    arm64: add Rockchip architecture entry
> >    arm64: defconfig: enable ARCH_ROCKCHIP
> >    arm64: dts: add Rockchip rk3368 core dtsi and board dts for the =
r88
> >   =20
> >      board
> >   =20
> >    dt-bindings: document rk3368 R89 board from Rockchip
> >  =20
> >   Documentation/devicetree/bindings/arm/rockchip.txt |   4 +
> >   arch/arm64/Kconfig                                 |  10 +
> >   arch/arm64/boot/dts/Makefile                       |   1 +
> >   arch/arm64/boot/dts/rockchip/Makefile              |   5 +
> >   arch/arm64/boot/dts/rockchip/rk3368-r88.dts        | 353 ++++++++
> >   arch/arm64/boot/dts/rockchip/rk3368.dtsi           | 900
> >   +++++++++++++++++++++ arch/arm64/configs/defconfig               =
     =20
> >    |   2 +
> >   7 files changed, 1275 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/rockchip/Makefile
> >   create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-r88.dts
> >   create mode 100644 arch/arm64/boot/dts/rockchip/rk3368.dtsi

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
