From: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v10 2/4] ARM: dts: rockchip: add VPU device node for RK3288
Date: Thu, 22 Nov 2018 19:29:13 +0900
Message-ID: <CAAFQd5AsAsLbbJXN3+9urbZipcXn3WSpQp8G5r+Nj04wKpiy5w@mail.gmail.com>
References: <20181121191652.22814-1-ezequiel@collabora.com>
 <20181121191652.22814-3-ezequiel@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20181121191652.22814-3-ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Dufresne <nicolas.dufresne-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, myy-tmjzNUIc0P1+EYZtW95mkQ@public.gmane.org, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ezequiel,

On Thu, Nov 22, 2018 at 4:17 AM Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
>
> Add the Video Processing Unit node for RK3288 SoC.
>
> Fix the VPU IOMMU node, which was disabled and lacking
> its power domain property.
>
> Signed-off-by: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3288.dtsi | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 0840ffb3205c..40d203cdca09 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -1223,6 +1223,18 @@
>                 };
>         };
>
> +       vpu: video-codec@ff9a0000 {
> +               compatible = "rockchip,rk3288-vpu";
> +               reg = <0x0 0xff9a0000 0x0 0x800>;
> +               interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupt-names = "vepu", "vdpu";
> +               clocks = <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
> +               clock-names = "aclk", "hclk";
> +               power-domains = <&power RK3288_PD_VIDEO>;
> +               iommus = <&vpu_mmu>;
> +       };
> +
>         vpu_mmu: iommu@ff9a0800 {
>                 compatible = "rockchip,iommu";
>                 reg = <0x0 0xff9a0800 0x0 0x100>;
> @@ -1230,8 +1242,8 @@
>                 interrupt-names = "vpu_mmu";
>                 clocks = <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
>                 clock-names = "aclk", "iface";
> +               power-domains = <&power RK3288_PD_VIDEO>;
>                 #iommu-cells = <0>;
> -               status = "disabled";
>         };
>
>         hevc_mmu: iommu@ff9c0440 {

Reviewed-by: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Best regards,
Tomasz
