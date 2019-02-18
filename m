From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 09/17 v1] irqchip: ixp4xx: Add DT bindings
Date: Mon, 18 Feb 2019 15:25:15 -0600
Message-ID: <CAL_Jsq+XZewc60DhVTC6Zaj2qSBseT7DV3+XUS-7AQRjUm-uJA@mail.gmail.com>
References: <20190203214205.13594-1-linus.walleij@linaro.org>
 <20190203214205.13594-10-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190203214205.13594-10-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, Tim Harvey <tharvey@gateworks.com>, Krzysztof Halasa <khalasa@piap.pl>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, Imre Kaloz <kaloz@openwrt.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 3, 2019 at 3:42 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This adds device tree bindings for the IXP4xx interrupt
> controller. It's a standard 2-cell controller.

Not required, but writing as a schema would be great. Looks like it
would be straight forward.

> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> irqchip maintainers: I am requesting an ACK for this once
> you're happy with the bindings, as I intend to merge all of
> this IXP4xx rework through ARM SoC.
> ---
>  .../intel,ixp4xx-interrupt.txt                | 33 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.txt
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.txt b/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.txt
> new file mode 100644
> index 000000000000..70ee93b9a6c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.txt
> @@ -0,0 +1,33 @@
> +* Intel IXP4xx XScale Networking Processors Interrupt Controller
> +
> +This interrupt controller is found in the Intel IXP4xx processors.
> +Some processors have 32 interrupts, some have up to 64 interrupts.
> +The exact number of interrupts is determined from the compatible
> +string.
> +
> +The distinct IXP4xx families with different interrupt controller
> +variations are IXP42x, IXP43x, IXP45x and IXP46x. Those four
> +families were the only ones to reach the developer and consumer
> +market.
> +
> +Required properties:
> +- compatible: must be one of
> +  "intel,ixp42x-interrupt"
> +  "intel,ixp43x-interrupt"
> +  "intel,ixp45x-interrupt"
> +  "intel,ixp46x-interrupt"

While we normally don't allow wildcards, I'm guessing this is all so
old^W mature that it will be fine.

Reviewed-by: Rob Herring <robh@kernel.org>
