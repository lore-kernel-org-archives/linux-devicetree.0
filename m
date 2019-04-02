From: "Andrew Jeffery" <andrew@aj.id.au>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: Add ASPEED GFX bindings document
Date: Mon, 01 Apr 2019 23:08:04 -0400
Message-ID: <d67700c0-c302-403b-b765-555484e85eca@www.fastmail.com>
References: <20190402021933.13071-1-joel@jms.id.au>
 <20190402021933.13071-2-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190402021933.13071-2-joel@jms.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joel Stanley <joel@jms.id.au>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, dri-devel@lists.freedesktop.org, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On Tue, 2 Apr 2019, at 12:49, Joel Stanley wrote:
> This describes the ASPEED BMC SoC's display controller.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../devicetree/bindings/gpu/aspeed-gfx.txt    | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpu/aspeed-gfx.txt 
> b/Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
> new file mode 100644
> index 000000000000..a74033332668
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
> @@ -0,0 +1,41 @@
> +Device tree configuration for the GFX display deivce on the AST2500 
> SoCs.
> +
> +Required properties:
> +  - compatible
> +    * Must be one of the following:
> +      + aspeed,ast2500-gfx
> +      + aspeed,ast2400-gfx
> +    * In addition, the ASPEED pinctrl bindings require the 'syscon' 
> property to
> +      be present

Lets remove [1] now that we have this document as what you've described
here is a super-set. Happy for that to be a follow-up patch, so:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

[1] Documentation/devicetree/bindings/mfd/aspeed-gfx.txt

> +
> +  - reg: Physical base address and length of the GFX registers
> +
> +  - interrupts: interrupt number for the GFX device
> +
> +  - clocks: clock number used to generate the pixel clock
> +
> +  - resets: reset line that must be released to use the GFX device
> +
> +  - memory-region:
> +    Phandle to a memory region to allocate from, as defined in
> +    
> Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> +
> +
> +Example:
> +
> +gfx: display@1e6e6000 {
> +	compatible = "aspeed,ast2500-gfx", "syscon";
> +	reg = <0x1e6e6000 0x1000>;
> +	reg-io-width = <4>;
> +	clocks = <&syscon ASPEED_CLK_GATE_D1CLK>;
> +	resets = <&syscon ASPEED_RESET_CRT1>;
> +	interrupts = <0x19>;
> +	memory-region = <&gfx_memory>;
> +};
> +
> +gfx_memory: framebuffer {
> +	size = <0x01000000>;
> +	alignment = <0x01000000>;
> +	compatible = "shared-dma-pool";
> +	reusable;
> +};
> -- 
> 2.20.1
> 
>
