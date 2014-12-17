From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 0/4] Add basic support for Mediatek MT8173 SoC
Date: Wed, 17 Dec 2014 15:35:35 +0100
Message-ID: <1808813.15ih7rDt4r@wuerfel>
References: <1418825853-10934-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418825853-10934-1-git-send-email-eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 17 December 2014 22:17:29 Eddie Huang wrote:
> MT8173 is a SoC based on 64bit ARMv8 architecture. It contains 2 CA53 + 2 CA57 cores. MT8173 share many HW IP with MT8135 and other MT65xx series. This patchset was tested on MT8173 engineer sample, and boot to shell ok.
> 
> This series contains document bindings, device tree, defconfig, and one sysirq modification for MT8173.
> 
> Changes in v2:
> 
> 1. Modify mt8173.dtsi and mt8173-evb.dts according to Mark Rutland's comment, change cpu-maps, psci, clock, GIC properties.
> 2. Modify irq-mtk-sysirq.c according to Arnd Bergmann's comment to calculate irq number from reg range.
> 
> 

Looks good to me,

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

In the 3.19 merge window, we had a few problems with new arm64 platforms,
as it wasn't entirely clear to us who is a maintainer and whether patches
were sent for review or inclusion. I see no problem including your series
in 3.20, but we probably need to figure out the best process for making
sure we don't miss it.

For now, I'd suggest we do this the same way as the arm32 patches, and
you send them to Matthias for inclusion in his tree, who will then
send a pull request for an arm64 branch.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
