From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM: rockchip: convert smp bringup to CPU_METHOD_OF_DECLARE
Date: Wed, 26 Mar 2014 13:03:18 +0100
Message-ID: <2151573.evmqdkWnet@diego>
References: <1632873.urGeGsUMPH@diego> <20140326110024.GR10341@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140326110024.GR10341-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 26. M=E4rz 2014, 11:00:24 schrieb Mark Rutland:
> On Wed, Mar 26, 2014 at 10:27:35AM +0000, Heiko St=FCbner wrote:
> > With the newly introduced CPU_METHOD_OF_DECLARE is not necessary an=
ymore
> > to reference the relevant smp_ops in the board file, but instead it=
 can
> > simply be set by the enable-method property of the cpu nodes.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > ---
> >=20
> >  Documentation/devicetree/bindings/arm/cpus.txt | 1 +
> >  arch/arm/boot/dts/rk3066a.dtsi                 | 1 +
> >  arch/arm/boot/dts/rk3188.dtsi                  | 1 +
> >  arch/arm/mach-rockchip/core.h                  | 2 --
> >  arch/arm/mach-rockchip/platsmp.c               | 3 ++-
> >  arch/arm/mach-rockchip/rockchip.c              | 1 -
> >  6 files changed, 5 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/cpus.txt
> > b/Documentation/devicetree/bindings/arm/cpus.txt index 333f4ae..250=
1d5d
> > 100644
> > --- a/Documentation/devicetree/bindings/arm/cpus.txt
> > +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> > @@ -185,6 +185,7 @@ nodes to be present and contain the properties
> > described below.>=20
> >  			    "qcom,gcc-msm8660"
> >  			    "qcom,kpss-acc-v1"
> >  			    "qcom,kpss-acc-v2"
> >=20
> > +			    "rockchip,rk3066-smp"
>=20
> We should document what what these actually mean, so as to be a hardw=
are
> description and not a Linux internals description.

is something like
				"rockchip,rk3066-smp" - cpu-core handling used by SoCs
								from Rockchip starting with rk3066

enough, or should it contain more data?


Thanks
Heiko


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
