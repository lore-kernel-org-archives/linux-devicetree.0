From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v6 2/3] dt-bindings: iommu: Add documentation for rockchip iommu
Date: Tue, 28 Oct 2014 15:36:21 +0100
Message-ID: <1857030.bPXkUHlXFx@diego>
References: <1414413448-15819-1-git-send-email-djkurtz@chromium.org> <1414413448-15819-3-git-send-email-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414413448-15819-3-git-send-email-djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Grant Grundler <grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Simon Xue <xxm-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:DOCUMENTATION" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Montag, 27. Oktober 2014, 20:37:27 schrieb Daniel Kurtz:
> Add binding documentation for Rockchip IOMMU.
> 
> Signed-off-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Simon Xue <xxm-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

> ---
>  .../devicetree/bindings/iommu/rockchip,iommu.txt   | 26
> ++++++++++++++++++++++ 1 file changed, 26 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/iommu/rockchip,iommu.txt
> 
> diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.txt
> b/Documentation/devicetree/bindings/iommu/rockchip,iommu.txt new file mode
> 100644
> index 0000000..9a55ac3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/rockchip,iommu.txt
> @@ -0,0 +1,26 @@
> +Rockchip IOMMU
> +==============
> +
> +A Rockchip DRM iommu translates io virtual addresses to physical addresses
> for +its master device.  Each slave device is bound to a single master
> device, and +shares its clocks, power domain and irq.
> +
> +Required properties:
> +- compatible      : Should be "rockchip,iommu"
> +- reg             : Address space for the configuration registers
> +- interrupts      : Interrupt specifier for the IOMMU instance
> +- interrupt-names : Interrupt name for the IOMMU instance
> +- #iommu-cells    : Should be <0>.  This indicates the iommu is a
> +                    "single-master" device, and needs no additional
> information +                    to associate with its master device.  See:
> +                    Documentation/devicetree/bindings/iommu/iommu.txt
> +
> +Example:
> +
> +	vopl_mmu: iommu@ff940300 {
> +		compatible = "rockchip,iommu";
> +		reg = <0xff940300 0x100>;
> +		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "vopl_mmu";
> +		#iommu-cells = <0>;
> +	};

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
