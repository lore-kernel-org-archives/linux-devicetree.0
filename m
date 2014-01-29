From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/9] ARM: dts: imx6sl: remove the use of pingrp macros
Date: Wed, 29 Jan 2014 11:42:11 +0100
Message-ID: <8644666.oTYOihNRNU@phil>
References: <1390668191-20289-1-git-send-email-shawn.guo@linaro.org> <5923680.sl3G3EgCsY@phil> <20140128112047.GC20583@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140128112047.GC20583-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday, 28. January 2014 19:20:49 Shawn Guo wrote:
> On Tue, Jan 28, 2014 at 11:17:22AM +0100, Heiko St=FCbner wrote:
> > [... and so on for the other groups ... ]
> >=20
> > I'm confused now :-) . Current linux-next [0] shows the pin-setting=
s as
> > part of imx6sl.dtsi - a way a lot of other architectures organize t=
heir
> > pingroups too, with the board file only referencing the relevant
> > pingroups from the predefined ones of the soc.
> >=20
> > So I guess your move to the pingrp-header moved them out of the
> > imx6sl.dtsi to the .h and is not part of linux-next;
>=20
> Yes, my for-next branch was excluded from linux-next temporarily for
> some reason.  I will ask Stephen to add it back once v3.14-rc1 is out=
=2E
> That said, you can see nothing we developed in this cycle on linux-ne=
xt
> for now.
>=20
> > but this patch (and the others in this
> > series) now moves the definitions into the individual board files. =
Can't
> > you just move them back to the soc-dtsi files to prevent each board
> > duplicating them?
>=20
> No.  That will bring back the problem we try to solve from the
> beginning [1].
>
> [1] http://thread.gmane.org/gmane.linux.ports.arm.kernel/275912/

Thanks for the pointer, I think I understand the issue now :-) .

So for the short term, I should probably also define the pingroups in m=
y board-
dts then.


But as an insane idea that I just had, because the issue will probably =
affect=20
more architectures at some point when their pingroups or other common-n=
odes=20
grow, how about introducing something like a "/delete-if-unreferenced/"=
 prefix=20
in dtc?

As I could see in [0], adding something to dtc is not as far off as I t=
hought.

In essence one would add the pingroups to the soc dtsi, like

		ecspi1 {
			/delete-if-unreferenced/ pinctrl_ecspi1_1: ecspi1grp-1 {
				fsl,pins =3D <
					MX6SL_PAD_ECSPI1_MISO__ECSPI1_MISO 0x100b1
					MX6SL_PAD_ECSPI1_MOSI__ECSPI1_MOSI 0x100b1
					MX6SL_PAD_ECSPI1_SCLK__ECSPI1_SCLK 0x100b1
				>;
			};
		};

and dtc would then be tasked with checking if the node gets referenced =
in a=20
phandle somewhere in the dts and if not removing it.

I don't know if this is at all sane to think about or doable in dtc.


Heiko

[0] http://www.spinics.net/lists/arm-kernel/msg300936.html

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
