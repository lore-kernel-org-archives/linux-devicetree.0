From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 21/36] dt-bindings: arm: Convert TI davinci board/soc
 bindings to json-schema
Date: Tue, 9 Oct 2018 17:29:06 +0530
Message-ID: <e8aeb321-9f9a-8636-2f1d-f5082e635fb1@ti.com>
References: <20181005165848.3474-1-robh@kernel.org>
 <20181005165848.3474-22-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181005165848.3474-22-robh@kernel.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Cc: Mark Rutland <mark.rutland@arm.com>, Tom Rini <trini@konsulko.com>, Kumar Gala <kumar.gala@linaro.org>, Grant Likely <glikely@secretlab.ca>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Olof Johansson <olof@lixom.net>, Frank Rowand <frowand.list@gmail.com>, Jonathan Cameron <jic23@kernel.org>
List-Id: devicetree@vger.kernel.org

On Friday 05 October 2018 10:28 PM, Rob Herring wrote:
> Convert TI Davinci SoC bindings to DT schema format using json-schema.
> 
> Cc: Sekhar Nori <nsekhar@ti.com>
> Cc: Kevin Hilman <khilman@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/davinci.txt       | 25 ------------------
>  .../bindings/arm/ti/ti,davinci.yaml           | 26 +++++++++++++++++++
>  2 files changed, 26 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/davinci.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/davinci.txt b/Documentation/devicetree/bindings/arm/davinci.txt
> deleted file mode 100644
> index 715622c36260..000000000000
> --- a/Documentation/devicetree/bindings/arm/davinci.txt
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -Texas Instruments DaVinci Platforms Device Tree Bindings
> ---------------------------------------------------------
> -
> -DA850/OMAP-L138/AM18x Evaluation Module (EVM) board
> -Required root node properties:
> -    - compatible = "ti,da850-evm", "ti,da850";
> -
> -DA850/OMAP-L138/AM18x L138/C6748 Development Kit (LCDK) board
> -Required root node properties:
> -    - compatible = "ti,da850-lcdk", "ti,da850";
> -
> -EnBW AM1808 based CMC board
> -Required root node properties:
> -    - compatible = "enbw,cmc", "ti,da850;
> -
> -LEGO MINDSTORMS EV3 (AM1808 based)
> -Required root node properties:
> -    - compatible = "lego,ev3", "ti,da850";
> -
> -Generic DaVinci Boards
> -----------------------
> -
> -DA850/OMAP-L138/AM18x generic board
> -Required root node properties:
> -    - compatible = "ti,da850";
> diff --git a/Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml b/Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml
> new file mode 100644
> index 000000000000..2675cae91a60
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml
> @@ -0,0 +1,26 @@
> +# SPDX-License-Identifier: None
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/arm/davinci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments DaVinci Platforms Device Tree Bindings
> +
> +maintainers:
> +  - Sekhar Nori <nsekhar@ti.com>
> +description: |
> +  DA850/OMAP-L138/AM18x based boards
> +
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    items:
> +      - enum:
> +          - ti,da850-evm
> +          - ti,da850-lcdk
> +          - enbw,cmc
> +          - lego,ev3

The boards had some reasonable human readable description earlier, which
has been lost now. Is there a way to bring that back?

Apart from that, looks good to me.

Thanks,
Sekhar

> +      - const: ti,da850
> +...
> -- 
> 2.17.1
> 
