From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 0/7] Another posting of the Dove PMU series
Date: Sat, 25 Jul 2015 22:17:23 +0200
Message-ID: <20150725201723.GD604@lunn.ch>
References: <20150715185859.GC7557@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150715185859.GC7557-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 15, 2015 at 07:58:59PM +0100, Russell King - ARM Linux wrot=
e:
> What it says in the subject.  Not hopeful of a successful outcome, so=
 I'm
> not going to bother wasting time writing stuff here.

Hi Gregory

I took at look at Russell's patches. I rebased them onto -rc1. There
were a few minor merge problems, all easy to fix. I added
Signed-off-by: since i did make changes, but 99.9% of the credit for
these patches is definitely to Russell.

The last patch, which is converting mach-dove to use the new PMU
driver however does not build. With mvebu_v7_defconfig i get:

  CC      drivers/soc/dove/pmu.o
drivers/soc/dove/pmu.c: In function dove_init_pmu_legacy=E2:
drivers/soc/dove/pmu.c:400:46: error: IRQ_DOVE_PMU_START undeclared (fi=
rst use in this function)
   irq_domain_associate_many(pmu->irq_domain, IRQ_DOVE_PMU_START,
                                              ^
drivers/soc/dove/pmu.c:400:46: note: each undeclared identifier is repo=
rted only once for each function it appears in

and dove_defconfig:

  CC      arch/arm/mach-dove/common.o
arch/arm/mach-dove/common.c:381:15: error: PWR_VPU_PWR_DWN_MASK undecla=
red here (not in a function)
   .pwr_mask =3D PMU_PWR_VPU_PWR_DWN_MASK,
               ^
arch/arm/mach-dove/common.c:382:15: error: PMU_SW_RST_VIDEO_MASK undecl=
ared here (not in a function)
   .rst_mask =3D PMU_SW_RST_VIDEO_MASK,
               ^
arch/arm/mach-dove/common.c:383:15: error: PMU_ISO_VIDEO_MASK undeclare=
d here (not in a function)
   .iso_mask =3D PMU_ISO_VIDEO_MASK,
               ^
arch/arm/mach-dove/common.c:386:15: error: PMU_PWR_GPU_PWR_DWN_MASK und=
eclared here (not in a function)
   .pwr_mask =3D PMU_PWR_GPU_PWR_DWN_MASK,
               ^
arch/arm/mach-dove/common.c:387:15: error: PMU_SW_RST_GPU_MASK undeclar=
ed here (not in a function)
   .rst_mask =3D PMU_SW_RST_GPU_MASK,
               ^
arch/arm/mach-dove/common.c:388:15: error: PMU_ISO_GPU_MASK undeclared =
here (not in a function)
   .iso_mask =3D PMU_ISO_GPU_MASK,

So i've dropped the last patch.

I boot tested mvebu_v7_defconfig with these patches, and ran the
rtctest, which shows the RTC interrupt it working. The vpu and gpu
power domains are in /sys, but i don't have anything connected to the
HDMI port in order to test them.

You can find the patches here:

https://github.com/lunn/linux.git v4.2-rc1-dove-pmu

	  Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
