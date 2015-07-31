From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 0/7] Another posting of the Dove PMU series
Date: Fri, 31 Jul 2015 11:58:20 +0100
Message-ID: <20150731105820.GU7557@n2100.arm.linux.org.uk>
References: <20150715185859.GC7557@n2100.arm.linux.org.uk>
 <20150725201723.GD604@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150725201723.GD604-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 25, 2015 at 10:17:23PM +0200, Andrew Lunn wrote:
> I took at look at Russell's patches. I rebased them onto -rc1. There
> were a few minor merge problems, all easy to fix. I added
> Signed-off-by: since i did make changes, but 99.9% of the credit for
> these patches is definitely to Russell.

Thanks.

If you're committing patches into git to be sent upstream, you _should_
_always_ add your signed-off-by.  Signed-off-by not only tracks who has
touched the patch, but also the people who were responsible for it
being committed into git.

So, by committing patches into git, you should always add your S-o-b.

> With mvebu_v7_defconfig i get:
>=20
>   CC      drivers/soc/dove/pmu.o
> drivers/soc/dove/pmu.c: In function dove_init_pmu_legacy=E2:
> drivers/soc/dove/pmu.c:400:46: error: IRQ_DOVE_PMU_START undeclared (=
first use in this function)
>    irq_domain_associate_many(pmu->irq_domain, IRQ_DOVE_PMU_START,
>                                               ^
> drivers/soc/dove/pmu.c:400:46: note: each undeclared identifier is re=
ported only once for each function it appears in
>=20
> and dove_defconfig:
>=20
>   CC      arch/arm/mach-dove/common.o
> arch/arm/mach-dove/common.c:381:15: error: PWR_VPU_PWR_DWN_MASK undec=
lared here (not in a function)
>    .pwr_mask =3D PMU_PWR_VPU_PWR_DWN_MASK,
>                ^
> arch/arm/mach-dove/common.c:382:15: error: PMU_SW_RST_VIDEO_MASK unde=
clared here (not in a function)
>    .rst_mask =3D PMU_SW_RST_VIDEO_MASK,
>                ^
> arch/arm/mach-dove/common.c:383:15: error: PMU_ISO_VIDEO_MASK undecla=
red here (not in a function)
>    .iso_mask =3D PMU_ISO_VIDEO_MASK,
>                ^
> arch/arm/mach-dove/common.c:386:15: error: PMU_PWR_GPU_PWR_DWN_MASK u=
ndeclared here (not in a function)
>    .pwr_mask =3D PMU_PWR_GPU_PWR_DWN_MASK,
>                ^
> arch/arm/mach-dove/common.c:387:15: error: PMU_SW_RST_GPU_MASK undecl=
ared here (not in a function)
>    .rst_mask =3D PMU_SW_RST_GPU_MASK,
>                ^
> arch/arm/mach-dove/common.c:388:15: error: PMU_ISO_GPU_MASK undeclare=
d here (not in a function)
>    .iso_mask =3D PMU_ISO_GPU_MASK,
>=20
> So i've dropped the last patch.

That's fine.  I'll work on resolving those.

Thanks.

--=20
=46TTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps u=
p
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
