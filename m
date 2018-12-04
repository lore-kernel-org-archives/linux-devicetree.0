From: Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [PATCH v2 29/34] dt-bindings: arm: Convert ST STi board/soc
 bindings to json-schema
Date: Tue, 4 Dec 2018 08:10:52 +0000
Message-ID: <158f1163-3489-3a02-3a37-0ef54148ac59@st.com>
References: <20181203213223.16986-1-robh@kernel.org>
 <20181203213223.16986-30-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181203213223.16986-30-robh@kernel.org>
Content-Language: en-US
Content-ID: <C6D86D7874CABE4FAA6CEA8DA4BD5091@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Kumar Gala <kumar.gala@linaro.org>, "arm@kernel.org" <arm@kernel.org>, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Rob

On 12/3/18 10:32 PM, Rob Herring wrote:
> Convert ST STi SoC bindings to DT schema format using json-schema.
> 
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/sti.txt | 23 -------------------
>  .../devicetree/bindings/arm/sti.yaml          | 23 +++++++++++++++++++
>  2 files changed, 23 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/sti.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/sti.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/sti.txt b/Documentation/devicetree/bindings/arm/sti.txt
> deleted file mode 100644
> index 8d27f6b084c7..000000000000
> --- a/Documentation/devicetree/bindings/arm/sti.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -ST STi Platforms Device Tree Bindings
> ----------------------------------------
> -
> -Boards with the ST STiH415 SoC shall have the following properties:
> -Required root node property:
> -compatible = "st,stih415";
> -
> -Boards with the ST STiH416 SoC shall have the following properties:
> -Required root node property:
> -compatible = "st,stih416";
> -
> -Boards with the ST STiH407 SoC shall have the following properties:
> -Required root node property:
> -compatible = "st,stih407";
> -
> -Boards with the ST STiH410 SoC shall have the following properties:
> -Required root node property:
> -compatible = "st,stih410";
> -
> -Boards with the ST STiH418 SoC shall have the following properties:
> -Required root node property:
> -compatible = "st,stih418";
> -
> diff --git a/Documentation/devicetree/bindings/arm/sti.yaml b/Documentation/devicetree/bindings/arm/sti.yaml
> new file mode 100644
> index 000000000000..47f9b8eebaa0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/sti.yaml
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/sti.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ST STi Platforms Device Tree Bindings
> +
> +maintainers:
> +  - Patrice Chotard <patrice.chotard@st.com>
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    items:
> +      - enum:
> +          - st,stih415
> +          - st,stih416
> +          - st,stih407
> +          - st,stih410
> +          - st,stih418
> +...
> 

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
