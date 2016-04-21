From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: rockchip: add core dtsi file for RK3399 SoCs
Date: Thu, 21 Apr 2016 22:24:09 +0200
Message-ID: <2131452.5tyGOfVRfi@diego>
References: <1461122150-9042-1-git-send-email-jay.xu@rock-chips.com> <5718AFB8.5070004@rock-chips.com> <20160421123018.096d4a75@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160421123018.096d4a75-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: "Huang, Tao" <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, will.deacon-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 21. April 2016, 12:30:18 schrieb Marc Zyngier:
> On Thu, 21 Apr 2016 18:47:20 +0800
>=20
> "Huang, Tao" <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> > Hi, Mark:
> >=20
> > On 2016=E5=B9=B404=E6=9C=8821=E6=97=A5 18:19, Mark Rutland wrote:
> > > On Thu, Apr 21, 2016 at 11:58:12AM +0800, Jianqun Xu wrote:
> > >> +		cpu_l0: cpu@0 {
> > >> +			device_type =3D "cpu";
> > >> +			compatible =3D "arm,cortex-a53", "arm,armv8";
> > >> +			reg =3D <0x0 0x0>;
> > >> +			enable-method =3D "psci";
> > >> +			#cooling-cells =3D <2>; /* min followed by max */
> > >> +			clocks =3D <&cru ARMCLKL>;
> > >> +		};
> > >> +		cpu_b0: cpu@100 {
> > >> +			device_type =3D "cpu";
> > >> +			compatible =3D "arm,cortex-a72", "arm,armv8";
> > >> +			reg =3D <0x0 0x100>;
> > >> +			enable-method =3D "psci";
> > >> +			#cooling-cells =3D <2>; /* min followed by max */
> > >> +			clocks =3D <&cru ARMCLKB>;
> > >> +		};
> > >> +
> > >> +	arm-pmu {
> > >> +		compatible =3D "arm,armv8-pmuv3";
> > >> +		interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> > >> +	};
> > >=20
> > > This is wrong, and must go. There should be a separate node for t=
he PMU
> > > of each microarchitecture, with the appropriate compatible string=
 to
> > > represent that (see the juno dts).
> >=20
> > You are right. The first version we wrote is:
> >     pmu_a53 {
> >    =20
> >         compatible =3D "arm,cortex-a53-pmu";
> >         interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> >         interrupt-affinity =3D <&cpu_l0>,
> >        =20
> >                      <&cpu_l1>,
> >                      <&cpu_l2>,
> >                      <&cpu_l3>;
> >    =20
> >     };
> >    =20
> >     pmu_a72 {
> >    =20
> >         compatible =3D "arm,cortex-a72-pmu";
> >         interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> >         interrupt-affinity =3D <&cpu_b0>,
> >        =20
> >                      <&cpu_b1>;
> >    =20
> >     };
> >=20
> > but unfortunately, the arm pmu driver do not support PPI in two clu=
ster
> > well,
> > so we have to replace with this implementation.
> >=20
> > > In this case things are messier as the same PPI number is being u=
sed
> > > across clusters. Marc (Cc'd) has been working on PPI partitions, =
which
> > > should allow us to support that.
> >=20
> > Great! So what we can do right now? Wait this feature, and delete
> > arm-pmu node?
>=20
> I'd rather you have a look at the patches, test them with your HW,
> and comment on what doesn't work!

I would think we could do it in two tracks, testing and fixing but also=
 letting=20
the rk3399 devicetrees move forward without the pmu at first :-) .

>=20
> You can find the patches over there:
>=20
> https://lkml.org/lkml/2016/4/11/182
>=20
> and on the following branch:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
> irq/percpu-partition
>=20
> Of course, you'll have to hack a bit in the PMU code to make it
> understand per-PMU affinity together with percpu interrupts, but it
> wouldn't be fun if there was nothing to do...
>=20
> Thanks,
>=20
> 	M.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
