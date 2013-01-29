From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: SPEAr13xx: Pass generic DW DMAC platform data
 from DT
Date: Tue, 29 Jan 2013 13:46:05 +0530
Message-ID: <CAKohpokrvYDaMgB-5HV+bJh01YNU4H5UrSUnzxa_NpvE1qQqiA@mail.gmail.com>
References: <1359395857-1235-1-git-send-email-arnd@arndb.de>
 <1359410300-26113-1-git-send-email-arnd@arndb.de>
 <1359410300-26113-6-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1359410300-26113-6-git-send-email-arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

You forgot spear-devel for this series.

On 29 January 2013 03:28, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> This replaces an earlier patch from Viresh Kumar to move
> the spear platform over to the generic DMA binding. This
> version is now based on the merged multiplatform capable
> spear platform, rather than the separate spear13xx/3xx/6xx
> directories.
>
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> ---
>  arch/arm/boot/dts/spear1340.dtsi         |   3 +
>  arch/arm/boot/dts/spear13xx.dtsi         |  25 +++++-
>  arch/arm/mach-spear/generic.h            |   6 --
>  arch/arm/mach-spear/include/mach/spear.h |   2 -
>  arch/arm/mach-spear/spear1310.c          |  30 +-------
>  arch/arm/mach-spear/spear1340.c          |  32 +-------
>  arch/arm/mach-spear/spear13xx-dma.h      | 128 -------------------------------
>  arch/arm/mach-spear/spear13xx.c          |  58 --------------
>  8 files changed, 29 insertions(+), 255 deletions(-)
>  delete mode 100644 arch/arm/mach-spear/spear13xx-dma.h
>
> diff --git a/arch/arm/boot/dts/spear1340.dtsi b/arch/arm/boot/dts/spear1340.dtsi
> index 34da11a..e1786a0 100644
> --- a/arch/arm/boot/dts/spear1340.dtsi
> +++ b/arch/arm/boot/dts/spear1340.dtsi
> @@ -113,6 +113,9 @@
>                                 reg = <0xb4100000 0x1000>;
>                                 interrupts = <0 105 0x4>;
>                                 status = "disabled";
> +                               dmas = <&dwdma0 0x600 0 0 1>, /* 0xC << 11 */
> +                                       <&dwdma0 0x680 0 1 0>; /* 0xD << 7 */
> +                               dma-names = "tx", "rx";
>                         };
>
>                         thermal@e07008c4 {
> diff --git a/arch/arm/boot/dts/spear13xx.dtsi b/arch/arm/boot/dts/spear13xx.dtsi
> index b4ca60f..45597fd 100644
> --- a/arch/arm/boot/dts/spear13xx.dtsi
> +++ b/arch/arm/boot/dts/spear13xx.dtsi
> @@ -98,13 +98,24 @@
>                         reg = <0xb2800000 0x1000>;
>                         interrupts = <0 29 0x4>;
>                         status = "disabled";
> +                       dmas = <&dwdma0 0 0 0 0>;
> +                       dma-names = "data";
>                 };
>
> -               dma@ea800000 {
> +               dwdma0: dma@ea800000 {
>                         compatible = "snps,dma-spear1340";
>                         reg = <0xea800000 0x1000>;
>                         interrupts = <0 19 0x4>;
>                         status = "disabled";
> +
> +                       dma-channels = <8>;
> +                       #dma-cells = <3>;

4?
