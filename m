From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH v2 2/4] media: dt-bindings: rockchip: Document
 RK3399 Video Decoder bindings
Date: Fri, 11 Oct 2019 07:50:16 -0500
Message-ID: <CAL_JsqL_6xPyb4kTDR3dbLc4Uptwox=1F4zaGjHVmahNyk25=w@mail.gmail.com>
References: <20191011093342.3471-1-boris.brezillon@collabora.com>
 <20191011093342.3471-3-boris.brezillon@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20191011093342.3471-3-boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Boris Brezillon <boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jonas Karlman <jonas-uIzNG4q0ceqzQB+pC5nmwQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Nicolas Dufresne <nicolas-dDhyB4GVkw9AFePFGvp55w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 11, 2019 at 4:33 AM Boris Brezillon
<boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
>
> Document the Rockchip RK3399 Video Decoder bindings.

You need some more headers for the example (or drop defines):

Error: Documentation/devicetree/bindings/media/rockchip,vdec.example.dts:23.28-29
syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:321: recipe for target
'Documentation/devicetree/bindings/media/rockchip,vdec.example.dt.yaml'
failed
make[1]: *** [Documentation/devicetree/bindings/media/rockchip,vdec.example.dt.yaml]
Error 1
Makefile:1282: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

>
> Signed-off-by: Boris Brezillon <boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>  .../bindings/media/rockchip,vdec.yaml         | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> new file mode 100644
> index 000000000000..7167c3d6a389
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip,vdec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip Video Decoder (VDec) Device Tree Bindings
> +
> +maintainers:
> +  - Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> +
> +description: |-
> +  The Rockchip rk3399 has a stateless Video Decoder that can decodes H.264,
> +  HEVC an VP9 streams.
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3399-vdec
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: The Video Decoder AXI interface clock
> +      - description: The Video Decoder AHB interface clock
> +      - description: The Video Decoded CABAC clock
> +      - description: The Video Decoder core clock
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: iface
> +      - const: cabac
> +      - const: core
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    vdec: video-codec@ff660000 {
> +        compatible = "rockchip,rk3399-vdec";
> +        reg = <0x0 0xff660000 0x0 0x400>;
> +        interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks = <&cru ACLK_VDU>, <&cru HCLK_VDU>,
> +                 <&cru SCLK_VDU_CA>, <&cru SCLK_VDU_CORE>;
> +        clock-names = "aclk", "iface", "cabac", "core";
> +        power-domains = <&power RK3399_PD_VDU>;
> +        iommus = <&vdec_mmu>;
> +    };
> +
> +...
> --
> 2.21.0
>
