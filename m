From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] doc/devicetree: Add Aspeed VIC bindings
Date: Mon, 9 May 2016 16:20:04 +0100
Message-ID: <20160509152003.GA13842@leverpostej>
References: <1462797239-14765-1-git-send-email-joel@jms.id.au>
 <1462797239-14765-2-git-send-email-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1462797239-14765-2-git-send-email-joel@jms.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joel Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, arnd@arndb.de, marc.zyngier@arm.com, benh@kernel.crashing.org, jk@ozlabs.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, May 09, 2016 at 10:03:58PM +0930, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../interrupt-controller/aspeed,ast2400-vic.txt    | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt
> new file mode 100644
> index 000000000000..10ed0c20ee6f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt
> @@ -0,0 +1,24 @@
> +Aspeed Vectored Interrupt Controller
> +
> +These bindings are for the Aspeed AST2400 interrupt controller register layout.
> +The SoC has an legacy register layout, but this driver does not support that
> +mode of operation.
> +
> +Required properties:
> +
> +- compatible : should be "aspeed,ast2400-vic".
> +
> +- interrupt-controller : Identifies the node as an interrupt controller
> +- #interrupt-cells : Specifies the number of cells needed to encode an
> +  interrupt source. The value shall be 1.
> +- valid-sources : bitmask of valid irq sources

Generally we steer clear of this kind of bitmap encoding in DT.

Is this actually necessary? What does htis gain us?

Why can we not just register with the full set of possible interrupts?

Thanks,
Mark.

> +
> +Example:
> +
> + vic: interrupt-controller {
> +      compatible = "aspeed,ast2400-new-vic";
> +      interrupt-controller;
> +      #interrupt-cells = <1>;
> +      valid-sources = < 0xffffffff 0x0007ffff>;
> +      reg = <0x1e6c0080 0x80>;
> + };
> -- 
> 2.8.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
