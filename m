From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [RFCv2 1/9] dt-bindings: mailbox: meson-mhu: convert to yaml
Date: Wed, 7 Aug 2019 16:34:31 +0200
Message-ID: <20190807143431.6w6dg44mjiwtffi2@flea>
References: <20190805120320.32282-1-narmstrong@baylibre.com>
 <20190805120320.32282-2-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190805120320.32282-2-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, robh+dt@kernel.org, jassisinghbrar@gmail.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Aug 05, 2019 at 02:03:12PM +0200, Neil Armstrong wrote:
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic MHU controller over to a YAML schemas.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../mailbox/amlogic,meson-gxbb-mhu.yaml       | 53 +++++++++++++++++++
>  .../devicetree/bindings/mailbox/meson-mhu.txt | 34 ------------
>  2 files changed, 53 insertions(+), 34 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/meson-mhu.txt
>
> diff --git a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
> new file mode 100644
> index 000000000000..2536a0082cff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/mailbox/amlogic,meson-gxbb-mhu.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson Message-Handling-Unit Controller
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +description: |
> +  The Amlogic's Meson SoCs Message-Handling-Unit (MHU) is a mailbox controller
> +  that has 3 independent channels/links to communicate with remote processor(s).
> +  MHU links are hardwired on a platform. A link raises interrupt for any
> +  received data. However, there is no specified way of knowing if the sent
> +  data has been read by the remote. This driver assumes the sender polls
> +  STAT register and the remote clears it after having read the data.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-gxbb-mhu
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 3
> +    maxItems: 3

You don't need to specify both here. If one is missing, the tools will
fill it automatically with the other's value.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
