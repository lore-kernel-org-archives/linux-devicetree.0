From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RFCv2 4/9] dt-bindings: reset: amlogic,meson-reset: convert to
 yaml
Date: Tue, 06 Aug 2019 09:41:04 +0200
Message-ID: <1565077264.4951.4.camel@pengutronix.de>
References: <20190805120320.32282-1-narmstrong@baylibre.com>
 <20190805120320.32282-5-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190805120320.32282-5-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>, robh+dt@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 2019-08-05 at 14:03 +0200, Neil Armstrong wrote:
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic Reset controller over to a YAML schemas.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Let me know if you want me to pick up this patch, otherwise

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

to merge with the rest of the series.

regards
Philipp

> ---
>  .../bindings/reset/amlogic,meson-reset.txt    | 19 ----------
>  .../bindings/reset/amlogic,meson-reset.yaml   | 37 +++++++++++++++++++
>  2 files changed, 37 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
>  create mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
> deleted file mode 100644
> index 28ef6c295c76..000000000000
> --- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Amlogic Meson SoC Reset Controller
> -=======================================
> -
> -Please also refer to reset.txt in this directory for common reset
> -controller binding usage.
> -
> -Required properties:
> -- compatible: Should be "amlogic,meson8b-reset", "amlogic,meson-gxbb-reset" or
> -	"amlogic,meson-axg-reset".
> -- reg: should contain the register address base
> -- #reset-cells: 1, see below
> -
> -example:
> -
> -reset: reset-controller {
> -	compatible = "amlogic,meson-gxbb-reset";
> -	reg = <0x0 0x04404 0x0 0x20>;
> -	#reset-cells = <1>;
> -};
> diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> new file mode 100644
> index 000000000000..00917d868d58
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson SoC Reset Controller
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
> +      - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
> +      - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#reset-cells"
> +
> +examples:
> +  - |
> +    reset-controller@c884404 {
> +          compatible = "amlogic,meson-gxbb-reset";
> +          reg = <0xc884404 0x20>;
> +          #reset-cells = <1>;
> +    };
