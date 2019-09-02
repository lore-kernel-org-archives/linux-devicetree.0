From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: sound: Add Xilinx
 logicPD-I2S FPGA IP bindings
Date: Mon, 02 Sep 2019 14:39:09 +0100
Message-ID: <20190902044231.GA17348@bogus>
References: <20190830210607.22644-1-miquel.raynal@bootlin.com>
 <20190830210607.22644-2-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <20190830210607.22644-2-miquel.raynal@bootlin.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, alexandre@bootlin.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 30, 2019 at 11:06:06PM +0200, Miquel Raynal wrote:
> Document the logicPD I2S FPGA block bindings in yaml.
> 
> Syntax verified with dt-doc-validate.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/sound/xlnx,logicpd-i2s.yaml      | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/xlnx,logicpd-i2s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/xlnx,logicpd-i2s.yaml b/Documentation/devicetree/bindings/sound/xlnx,logicpd-i2s.yaml
> new file mode 100644
> index 000000000000..cbff641af199
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/xlnx,logicpd-i2s.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/xlnx,logicpd-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Device-Tree bindings for Xilinx logicPD I2S FPGA block
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +description: |
> +  The IP supports I2S playback/capture audio. It acts as a slave and
> +  clocks should come from the codec. It only supports two channels and
> +  S16_LE format.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: xlnx,logicpd-i2s
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Base address and size of the IP core instance.
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description: tx interrupt
> +      - description: rx interrupt
> +    description:
> +      Either the Tx interruption or the Rx interruption or both.

The schema says either tx or both. Doesn't really matter here as it's 
just numbers.

> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - const: tx
> +      - const: rx

But here it does matter.

The easiest way to express this is:

oneOf:
  - items:
      - enum: [ tx, rx ]
  - items:
      - const: tx
      - const: rx

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupts-controller
> +
> +examples:
> +  - |
> +    logii2s_dai: logii2s-dai@43c10000 {
> +        reg = <0x43c10000 0x1000>;
> +        compatible = "xlnx,logicpd-i2s-dai";
> +        interrupt-parent = <&intc>;
> +        interrupts = <0 29 IRQ_TYPE_LEVEL_HIGH>, <0 30 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "rx", "tx";
> +    };
> -- 
> 2.20.1
> 
