From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: add sama5d2 PIOBU support
Date: Mon, 12 Nov 2018 12:57:33 -0600
Message-ID: <5bea0ec9.1c69fb81.db750.9b4e@mx.google.com>
References: <1541603580-17448-1-git-send-email-andrei.stefanescu@microchip.com>
 <1541603580-17448-2-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1541603580-17448-2-git-send-email-andrei.stefanescu@microchip.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrei.Stefanescu@microchip.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Ludovic.Desroches@microchip.com, linux-arm-kernel@lists.infradead.org, Cristian.Birsan@microchip.com
List-Id: devicetree@vger.kernel.org

On Wed, Nov 07, 2018 at 03:12:32PM +0000, Andrei.Stefanescu@microchip.com wrote:
> This patch describes the compatible and the device tree
> bindings necessary for the sama5d2 PIOBU GPIO
> controller driver.

Bindings describe the h/w, not drivers.

> 
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@microchip.com>
> ---
>  .../bindings/gpio/gpio-sama5d2-piobu.txt           | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sama5d2-piobu.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-sama5d2-piobu.txt b/Documentation/devicetree/bindings/gpio/gpio-sama5d2-piobu.txt
> new file mode 100644
> index 0000000..791ac51
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-sama5d2-piobu.txt
> @@ -0,0 +1,23 @@
> +GPIO controller for SAMA5D2 PIOBU pins.
> +
> +This pins have the property of not losing their voltage
> +during Backup/Self-refresh mode.
> +
> +These bindings should be set to a node in the dtsi file.
> +
> +Required properties:
> +- compatible:		"syscon", "microchip,sama5d2-piobu"

Why the syscon?

syscon should be last if it remains.

> +- #gpio-cells:		There are 2. The pin number is the
> +			first, the second represents additional
> +			parameters such as GPIO_ACTIVE_HIGH/LOW.
> +- gpio-controller:	Marks the port as GPIO controller.

No interrupt capability?

> +
> +Example:
> +
> +	secumod@fc040000 {

gpio@...

> +		compatible = "syscon", "microchip,sama5d2-piobu";
> +		reg = <0xfc040000 0x100>;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> -- 
> 2.7.4
> 
