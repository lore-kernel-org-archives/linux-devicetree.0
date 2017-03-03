From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 3/4] dt-bindings: serial: add a new compatible string
 for SC9860
Date: Fri, 3 Mar 2017 00:21:49 -0600
Message-ID: <20170303062149.xeernsjqhipwk7tq@rob-hp-laptop>
References: <1488435730-6711-1-git-send-email-chunyan.zhang@spreadtrum.com>
 <1488435730-6711-4-git-send-email-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1488435730-6711-4-git-send-email-chunyan.zhang@spreadtrum.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, orson.zhai@spreadtrum.com, arnd@arndb.de, gregkh@linuxfoundation.org, sudeep.holla@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, zhang.lyra@gmail.com, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 02, 2017 at 02:22:09PM +0800, Chunyan Zhang wrote:
> SC9860 use the same serial device, so added a new compatible string to
> support SC9860 as well, also added an example of how to describe this
> serial device in DT.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
> ---
>  Documentation/devicetree/bindings/serial/sprd-uart.txt | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/sprd-uart.txt b/Documentation/devicetree/bindings/serial/sprd-uart.txt
> index 2aff0f2..8bd8144 100644
> --- a/Documentation/devicetree/bindings/serial/sprd-uart.txt
> +++ b/Documentation/devicetree/bindings/serial/sprd-uart.txt
> @@ -1,7 +1,20 @@
>  * Spreadtrum serial UART
>  
>  Required properties:
> -- compatible: must be "sprd,sc9836-uart"
> +- compatible must contain:
> +  * "sprd,sc9836-uart" for SC9836 and all Spreadtrum SoCs
> +  This also can be specific with:
> +  * "sprd,sc9860-uart" for SC9860

Just say:

- compatible: must be one of:
	"sprd,sc9836-uart"
	"sprd,sc9860-uart", "sprd,sc9836-uart"

> +
>  - reg: offset and length of the register set for the device
>  - interrupts: exactly one interrupt specifier
>  - clocks: phandles to input clocks.
> +
> +Example:
> +	uart0: serial@70000000 {
> +		compatible = "sprd,sc9860-uart",
> +			     "sprd,sc9836-uart";
> +		reg = <0x000000 0x100>;

unit address doesn't match the reg property.

> +		interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&ext_26m>;
> +	};
> -- 
> 2.7.4
> 
