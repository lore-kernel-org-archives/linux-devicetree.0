From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v10] reset: Add driver for gpio-controlled reset pins
Date: Fri, 2 Aug 2013 10:28:23 +0100
Message-ID: <20130802092823.GA2884@e106331-lin.cambridge.arm.com>
References: <1374139586-6344-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1374139586-6344-1-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>, Fabio Estevam <fabio.estevam@freescale.com>, Mike Turquette <mturquette@linaro.org>, Len Brown <len.brown@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Rafael J. Wysocki" <rjw@sisk.pl>, Pavel Machek <pavel@ucw.cz>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 18, 2013 at 10:26:26AM +0100, Philipp Zabel wrote:
> This driver implements a reset controller device that toggle a gpio
> connected to a reset pin of a peripheral IC. The delay between assertion
> and de-assertion of the reset signal can be configured via device tree.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Stephen Warren <swarren@nvidia.com>
> ---
> Changes since v9:
>  - Use gpio_set_value_cansleep unconditionally. reset_controller_assert/deassert
>    should not be called from atomic context.
> ---
>  .../devicetree/bindings/reset/gpio-reset.txt       |  35 ++++
>  drivers/reset/Kconfig                              |  11 ++
>  drivers/reset/Makefile                             |   1 +
>  drivers/reset/gpio-reset.c                         | 184 +++++++++++++++++++++
>  4 files changed, 231 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/gpio-reset.txt
>  create mode 100644 drivers/reset/gpio-reset.c
> 
> diff --git a/Documentation/devicetree/bindings/reset/gpio-reset.txt b/Documentation/devicetree/bindings/reset/gpio-reset.txt
> new file mode 100644
> index 0000000..bca5348
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/gpio-reset.txt
> @@ -0,0 +1,35 @@
> +GPIO reset controller
> +=====================
> +
> +A GPIO reset controller controls a single GPIO that is connected to the reset
> +pin of a peripheral IC. Please also refer to reset.txt in this directory for
> +common reset controller binding usage.
> +
> +Required properties:
> +- compatible: Should be "gpio-reset"
> +- reset-gpios: A gpio used as reset line. The gpio specifier for this property
> +               depends on the gpio controller that provides the gpio.
> +- #reset-cells: 0, see below
> +
> +Optional properties:
> +- reset-delay-us: delay in microseconds. The gpio reset line will be asserted for
> +                  this duration to reset.
> +- initially-in-reset: boolean. If not set, the initial state should be a
> +                      deasserted reset line. If this property exists, the
> +                      reset line should be kept in reset.
> +
> +example:
> +
> +sii902x_reset: gpio-reset {
> +	compatible = "gpio-reset";
> +	reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
> +	reset-delay-us = <10000>;
> +	initially-in-reset;
> +	#reset-cells = <0>;
> +};
> +
> +/* Device with nRESET pin connected to GPIO5_0 */
> +sii902x@39 {
> +	/* ... */
> +	resets = <&sii902x_reset>; /* active-low GPIO5_0, 10 ms delay */
> +};

I don't like the approach here. The reset GPIO line is not a device in
itself, and surely the way in which it must be toggled to reset a device
is a property of that device, not the GPIO. We're leaking a Linux
internal abstraction rather than describing teh hardware.

I think thie linkage of the gpio would be better described on the node
for the device with the reset input, in a binding-specific property for
the device (e.g. names for the specific input line on the device):

I'd imagine the delay required would be fixed for a device (or possibly
influenced by clock inputs), and can either be knwon by the driver
without dt information, or discovered elsewhere (e.g. dervied from the
rates of clock inputs). We shuold be able to derive that from the
compatible string in most cases.

I think this should look more like the below:

/* Device with nRESET pin connected to GPIO5_0 */
sii902x@39 {
	/* named for the actual input line */
	nreset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
	/* 
	 * If there's some configurable property relating to the reset
	 * line, we can describe it
	 */
	vendor,some-optional-reset-gpio-property;
	...
};

If we want a separate device in the Linux driver model to abstract this,
that's fine, but it should not be described in the dt. The device driver
can call some generic helpers to handle creating said reset device in
the driver model.

Thanks,
Mark.
