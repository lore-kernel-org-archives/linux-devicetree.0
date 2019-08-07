From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFCv2 9/9] dt-bindings: watchdog: meson-gxbb-wdt: convert to yaml
Date: Wed, 7 Aug 2019 10:59:42 -0700
Message-ID: <20190807175942.GA26331@roeck-us.net>
References: <20190805120320.32282-1-narmstrong@baylibre.com>
 <20190805120320.32282-10-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190805120320.32282-10-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, robh+dt@kernel.org, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 05, 2019 at 02:03:20PM +0200, Neil Armstrong wrote:
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic GXBB Watchdog timer over to a YAML schemas.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../watchdog/amlogic,meson-gxbb-wdt.yaml      | 37 +++++++++++++++++++
>  .../bindings/watchdog/meson-gxbb-wdt.txt      | 16 --------
>  2 files changed, 37 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
> new file mode 100644
> index 000000000000..d7352f709b37
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/watchdog/amlogic,meson-gxbb-wdt.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Meson GXBB SoCs Watchdog timer
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-gxbb-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      A phandle to the clock of this PHY
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +examples:
> +  - |
> +    watchdog@98d0 {
> +          compatible = "amlogic,meson-gxbb-wdt";
> +          reg = <0x98d0 0x10>;
> +          clocks = <&xtal>;
> +    };
> diff --git a/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt b/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
> deleted file mode 100644
> index c7fe36fa739c..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Meson GXBB SoCs Watchdog timer
> -
> -Required properties:
> -
> -- compatible : should be "amlogic,meson-gxbb-wdt"
> -- reg : Specifies base physical address and size of the registers.
> -- clocks : Should be a phandle to the Watchdog clock source, for GXBB the xtal
> -	   is the default clock source.
> -
> -Example:
> -
> -wdt: watchdog@98d0 {
> -	compatible = "amlogic,meson-gxbb-wdt";
> -	reg = <0 0x98d0 0x0 0x10>;
> -	clocks = <&xtal>;
> -};
