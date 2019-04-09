From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 29/31 v3] soc: ixp4xx: qmgr: Add DT bindings for IXP4xx
 qmgr
Date: Tue, 9 Apr 2019 08:12:02 -0500
Message-ID: <CAL_JsqLsX4r2-MJcbA7LLhyVFTFehL3tR28_=YMz5M0=oMjq=Q@mail.gmail.com>
References: <20190408062831.16422-1-linus.walleij@linaro.org>
 <20190408062831.16422-30-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190408062831.16422-30-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 8, 2019 at 1:29 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This adds device tree bindings for the Intel IXP4xx AHB
> Queue Manager.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Rebased on v5.1-rc1
> - Drop oneOf in compatible, just list items.
> - Drop description on reg, just use maxItems: 1
> - Set '#queue-cells' as required
> ---
>  .../misc/intel,ixp4xx-queue-manager.yaml      | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/intel,ixp4xx-queue-manager.yaml
>
> diff --git a/Documentation/devicetree/bindings/misc/intel,ixp4xx-queue-manager.yaml b/Documentation/devicetree/bindings/misc/intel,ixp4xx-queue-manager.yaml
> new file mode 100644
> index 000000000000..346707936a2f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/intel,ixp4xx-queue-manager.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 Linaro Ltd.
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/misc/intel-ixp4xx-ahb-queue-manager.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Intel IXP4xx AHB Queue Manager
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |
> +  The IXP4xx AHB Queue Manager maintains queues as circular buffers in
> +  an 8KB embedded SRAM along with hardware pointers. It is used by both
> +  the XScale processor and the NPEs (Network Processing Units) in the
> +  IXP4xx for accelerating queues, especially for networking. Clients pick
> +  queues from the queue manager with foo-queue = <&qmgr N> where the
> +  &qmgr is a phandle to the queue manager and N is the queue resource
> +  number. The queue resources available and their specific purpose
> +  on a certain IXP4xx system will vary.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: intel,ixp4xx-ahb-queue-manager
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Interrupt for queues 0-31
> +      - description: Interrupt for queues 32-63
> +
> +  '#queue-cells':
> +    const: 1

Not sure why I didn't notice this earlier... You don't need '#*-cells'
unless it's variable and this should have a vendor prefix as it could
collide with a generic binding if we came up with a 'queue' binding.
So I'd just drop it as it seems specific to this binding.

Rob
