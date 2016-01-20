From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 1/3] dt-bindings: soc: Add documentation for the MediaTek
 GCE unit
Date: Wed, 20 Jan 2016 10:38:26 -0600
Message-ID: <20160120163826.GA23400@rob-hp-laptop>
References: <1453266881-16849-1-git-send-email-hs.liao@mediatek.com>
 <1453266881-16849-2-git-send-email-hs.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453266881-16849-2-git-send-email-hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, CK HU <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 20, 2016 at 01:14:38PM +0800, hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: HS Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> This adds documentation for the MediaTek Global Command Engine (GCE) unit
> found in MT8173 SoCs.
> 
> Signed-off-by: HS Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/soc/mediatek/gce.txt       |   33 ++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/gce.txt
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/gce.txt b/Documentation/devicetree/bindings/soc/mediatek/gce.txt
> new file mode 100644
> index 0000000..878b11e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/gce.txt
> @@ -0,0 +1,33 @@
> +MediaTek GCE
> +===============
> +
> +The Global Command Engine (GCE) is used to help read/write registers with
> +critical time limitation, such as updating display configuration during the
> +vblank. The GCE can be used to implement the Command Queue (CMDQ) driver.
> +Currently, the GCE only supports display related hardwares, but we expect
> +it can be extended to other hardwares for future requirements.

That's a hardware limitation or just s/w is only using it for display? 
If the latter, that's not really relevant to this binding and should be 
removed.

> +
> +Required properties:
> +- compatible: Must be "mediatek,mt8173-gce"
> +- reg: Address range of the GCE unit
> +- interrupts: The interrupt signal from the GCE block
> +- clock: Clocks according to the common clock binding
> +- clock-names: Must be "gce" to stand for GCE clock
> +
> +Example:
> +
> +	gce: gce@10212000 {
> +		compatible = "mediatek,mt8173-gce";
> +		reg = <0 0x10212000 0 0x1000>;
> +		interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&infracfg CLK_INFRA_GCE>;
> +		clock-names = "gce";
> +	};
> +
> +	mmsys: clock-controller@14000000 {
> +		compatible = "mediatek,mt8173-mmsys", "syscon";
> +		reg = <0 0x14000000 0 0x1000>;
> +		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> +		#clock-cells = <1>;
> +		mediatek,gce = <&gce>;

Not documented.

> +	};
> -- 
> 1.7.9.5
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
