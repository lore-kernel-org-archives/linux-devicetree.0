From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/2] ARM: Exynos: Add DT based I/O mapping for Chip-ID
 controller
Date: Thu, 04 Apr 2013 15:57:23 +0900
Message-ID: <27ea01ce3101$a8dae850$fa90b8f0$%kim@samsung.com>
References: <1361174099-18749-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1361174099-18749-1-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com
List-Id: devicetree@vger.kernel.org

Thomas Abraham wrote:
> 
> This patch series allows device tree enabled platforms to setup a runtime
> I/O mapping for the chip-id controller. This helps to remove statically
> defined I/O mapping for the Chip-ID controller.
> 
> Thomas Abraham (2):
>   ARM: Exynos: Create virtual I/O mapping for Chip-ID controller using
> device tree
>   ARM: dts: Add chip-id controller node on Exynos4/5 SoC
> 
>  .../arm/samsung/samsung,exynos4210-chipid.txt      |   15 ++++++
>  arch/arm/boot/dts/exynos4.dtsi                     |    5 ++
>  arch/arm/boot/dts/exynos5250.dtsi                  |    5 ++
>  arch/arm/mach-exynos/common.c                      |   53
+++++++++++---------
>  arch/arm/mach-exynos/include/mach/map.h            |    1 -
>  5 files changed, 55 insertions(+), 24 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/arm/samsung/samsung,exynos4210-
> chipid.txt
> 
> --
> 1.7.5.4

Thomas,

Can you update this series can support exynos5440 as well? It should be done
together.

- Kukjin
