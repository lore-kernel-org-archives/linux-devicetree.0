From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v10 1/4] media: dt-bindings: Document the Rockchip VPU
 bindings
Date: Thu, 22 Nov 2018 10:42:13 +0100
Message-ID: <c452bffd-7fd5-cb06-85d3-c82f35a94e22@xs4all.nl>
References: <20181121191652.22814-1-ezequiel@collabora.com>
 <20181121191652.22814-2-ezequiel@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20181121191652.22814-2-ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nicolas Dufresne <nicolas.dufresne-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Miouyouyou <myy-tmjzNUIc0P1+EYZtW95mkQ@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/21/2018 08:16 PM, Ezequiel Garcia wrote:
> Add devicetree binding documentation for Rockchip Video Processing
> Unit IP.
> 
> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>

This one has been merged already.

Regards,

	Hans

> ---
>  .../bindings/media/rockchip-vpu.txt           | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-vpu.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.txt b/Documentation/devicetree/bindings/media/rockchip-vpu.txt
> new file mode 100644
> index 000000000000..35dc464ad7c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip-vpu.txt
> @@ -0,0 +1,29 @@
> +device-tree bindings for rockchip VPU codec
> +
> +Rockchip (Video Processing Unit) present in various Rockchip platforms,
> +such as RK3288 and RK3399.
> +
> +Required properties:
> +- compatible: value should be one of the following
> +		"rockchip,rk3288-vpu";
> +		"rockchip,rk3399-vpu";
> +- interrupts: encoding and decoding interrupt specifiers
> +- interrupt-names: should be "vepu" and "vdpu"
> +- clocks: phandle to VPU aclk, hclk clocks
> +- clock-names: should be "aclk" and "hclk"
> +- power-domains: phandle to power domain node
> +- iommus: phandle to a iommu node
> +
> +Example:
> +SoC-specific DT entry:
> +	vpu: video-codec@ff9a0000 {
> +		compatible = "rockchip,rk3288-vpu";
> +		reg = <0x0 0xff9a0000 0x0 0x800>;
> +		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "vepu", "vdpu";
> +		clocks = <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
> +		clock-names = "aclk", "hclk";
> +		power-domains = <&power RK3288_PD_VIDEO>;
> +		iommus = <&vpu_mmu>;
> +	};
> 
