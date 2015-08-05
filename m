From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/5] Add SMP bringup support for mt65xx socs
Date: Wed, 05 Aug 2015 20:44:11 +0200
Message-ID: <4831607.pyCH8elj8i@ubix>
References: <1436851111-2369-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1436851111-2369-1-git-send-email-yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday, July 14, 2015 01:18:26 PM Yingjoe Chen wrote:
> This series add SMP brinup support for MediaTek SoCs. This is based
> on v4.2-rc1 and Matthias' next branch (for dts parts).
> 
> There are similar but different SMP bringup up methods on MediaTek
> mt65xx and mt81xx. On MT8135 & MT8127, system boots with a trustzone
> firmware. Others, like MT6589, doesn't have trustzone, and run kernel
> directly in secure world.
> 
> Patch 1 enable arch timer support.
> Patch 2,3 add support for cpu enable-method "mediatek,mt6589-smp" and
> "mediatek,mt81xx-tz-smp", which support Mediatek SMP bringup for non-TZ
> and TZ platform.
> Patch 4,5 finally enable SMP bringup for mt8135 and mt8127.
> 
> Changes in v3:
> - The first 2 patches in v2 are merged in v4.2-rc1.
> - Patch 3~4 in v2 are moved to another series [1]
> - platsmp.c changes based on Stephen's suggestion
> - Change cpu enable-method name to "mediatek,mt6589-smp"
> 
> Changes in v2:
> - Fix boot issue for THUMB2 kernel.
> - Not enable GPT_CLK_EVT when setup to fix GPT spurious interrupt issue
> - Change platsmp.c according to Matthias' suggestion
> http://lists.infradead.org/pipermail/linux-mediatek/2015-May/000714.html
> 
> v1:
> http://lists.infradead.org/pipermail/linux-mediatek/2015-May/000528.html
> 
> [1]
> http://lists.infradead.org/pipermail/linux-mediatek/2015-July/001544.html
> 
> Matthias Brugger (1):
>   ARM: mediatek: enable gpt6 on boot up to make arch timer working
> 
> Yingjoe Chen (4):
>   devicetree: bindings: add new SMP enable method Mediatek SoC
>   ARM: mediatek: add smp bringup code
>   ARM: dts: mt8135: enable basic SMP bringup for mt8135
>   ARM: dts: mt8127: enable basic SMP bringup for mt8127
> 
>  Documentation/devicetree/bindings/arm/cpus.txt |   2 +
>  arch/arm/boot/dts/mt8127.dtsi                  |  16 +++
>  arch/arm/boot/dts/mt8135.dtsi                  |  16 +++
>  arch/arm/mach-mediatek/Makefile                |   3 +
>  arch/arm/mach-mediatek/mediatek.c              |  27 +++++
>  arch/arm/mach-mediatek/platsmp.c               | 144
> +++++++++++++++++++++++++ 6 files changed, 208 insertions(+)
>  create mode 100644 arch/arm/mach-mediatek/platsmp.c

Applied to v4.2-next/soc-2 and v4.2-next/dts-2 

Thanks,
Matthias
