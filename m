From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/8] This is a second edition of a series
 that implements voltage
Date: Tue, 11 Dec 2018 07:46:54 +0000
Message-ID: <20181211074654.GF4497@dell>
References: <cover.4110554ae84987dedb8b58888a8a63d6b7f98c72.1544466940.git-series.plaes@plaes.org>
 <20181211071137.k3rqwctnibg6tyc2@plaes.org>
Reply-To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBB4WWXXQAKGQEKAYEWQQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181211071137.k3rqwctnibg6tyc2-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 11 Dec 2018, Priit Laes wrote:

> On Mon, Dec 10, 2018 at 08:42:11PM +0200, Priit Laes wrote:
> > ramping for AXP209 DCDC2 and LDO3 regulators and software
> > based soft-start for AXP209 LDO3 regulator.
>=20
> Ugh.. managed to botch this series. I'll send a fixed one
> today.

While you're at it, please don't forget to add the version number in
the patch subject lines.  Each patch should have read "[PATCH v2]
<...>" in this submission.

> > Both features are needed to work around a PMIC shutdown when
> > toggling LDO3 on certain boards with high capacitance on the
> > LDO3 output.
> >=20
> > Similar features (or workarounds) have been also implemented
> > on u-boot side [1].
> >=20
> > Changes since v1:
> > - Rebased on top of next and dropped already merged patches.
> > - Dropped LDO4 full range devicetree change for Lime2 (prev patch 9)
> >   in favor of general pin-bank regulator dependency [2].
> > - Fixed paths in devicetree bindings (patch 3)
> > - Added note about software based soft-start for LDO3 (patch 5)
> >=20
> > [1] https://lists.denx.de/pipermail/u-boot/2018-November/348612.html
> > [2] http://lists.infradead.org/pipermail/linux-arm-kernel/2018-December=
/618459.html
> >=20
> > Olliver Schinagl (8):
> >   mfd: axp20x: name voltage ramping define properly
> >   regulator: axp20x: add support for set_ramp_delay for AXP209
> >   dt-bindings: mfd: axp20x: add support for regulator-ramp-delay for AX=
P209
> >   regulator: axp20x: add software based soft_start for AXP209 LDO3
> >   dt-bindings: mfd: axp20x: Add software based soft_start for AXP209 LD=
O3
> >   regulator: dts: enable soft-start and ramp delay for the OLinuXino Li=
me2
> >   mfd: axp20x: Clean up included headers
> >   mfd: axp20x: use explicit bit defines
> >=20
> >  Documentation/devicetree/bindings/mfd/axp20x.txt |   9 +-
> >  arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts  |   2 +-
> >  drivers/mfd/axp20x.c                             |  13 +-
> >  drivers/regulator/axp20x-regulator.c             | 142 +++++++++++++++=
-
> >  include/linux/mfd/axp20x.h                       |   4 +-
> >  5 files changed, 161 insertions(+), 9 deletions(-)
> >=20
> > base-commit: 14cf8c1d5b90a0cf6a8ba51ef59db8da8c7a2622

--=20
Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
Linaro Services Technical Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
