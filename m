From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: media: Add Aspeed Video Engine binding
 documentation
Date: Mon, 3 Sep 2018 19:50:18 -0500
Message-ID: <20180904005015.GA5214@bogus>
References: <1535576973-8067-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1535576973-8067-4-git-send-email-eajames@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1535576973-8067-4-git-send-email-eajames@linux.vnet.ibm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, joel@jms.id.au, mchehab@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 29, 2018 at 04:09:32PM -0500, Eddie James wrote:
> Document the bindings.
> 
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---
>  .../devicetree/bindings/media/aspeed-video.txt     | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/aspeed-video.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/aspeed-video.txt b/Documentation/devicetree/bindings/media/aspeed-video.txt
> new file mode 100644
> index 0000000..58c056a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/aspeed-video.txt
> @@ -0,0 +1,23 @@
> +* Device tree bindings for Aspeed Video Engine
> +
> +The Video Engine (VE) embedded in the Aspeed AST2400 and AST2500 SOCs can
> +capture and compress video data from digital or analog sources.
> +
> +Required properties:
> + - compatible:		"aspeed,ast2400-video" or "aspeed,ast2500-video"

Maybe "video-engine" or "ve" would be more specific than just "video". 
Use what is closest to the name of the block.

> + - reg:			contains the offset and length of the VE memory region
> + - clocks:		pointers to the the "vclk" and "eclk" of the syscon

No pointers in DT. "Clock specifier"

> + - clock-names:		"vclk-gate", "eclk-gate"

Is that the name at or in the module? The fact that it is gated is 
really outside the block and a property of the clock controller.

> + - resets:		pointer to the VE reset of the syscon
> + - interrupts:		the interrupt associated with the VE on this platform
> +
> +Example:
> +
> +video: video@1e700000 {

video-codec@...

> +    compatible = "aspeed,ast2500-video";
> +    reg = <0x1e700000 0x20000>;
> +    clocks = <&syscon ASPEED_CLK_GATE_VCLK>, <&syscon ASPEED_CLK_GATE_ECLK>;
> +    clock-names = "vclk-gate", "eclk-gate";
> +    resets = <&syscon ASPEED_RESET_VIDEO>;
> +    interrupts = <7>;
> +};
> -- 
> 1.8.3.1
> 
