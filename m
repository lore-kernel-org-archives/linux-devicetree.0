From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 5/5] RFC: ARM64: dts: Add Low-Speed Connector to ZCU100
Date: Tue, 19 Jun 2018 08:55:10 -0600
Message-ID: <CAL_JsqL8ZRHCwE4Mqr9qP+JZmao8fmjc34xrqOHucfopkL7pvw@mail.gmail.com>
References: <20180618074556.6944-1-linus.walleij@linaro.org>
 <20180618074556.6944-6-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180618074556.6944-6-linus.walleij@linaro.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michal Simek <michal.simek@xilinx.com>, dev@lists.96boards.org, Mark Brown <broonie@kernel.org>, John Stultz <john.stultz@linaro.org>, Andy Shevchenko <andy@infradead.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

+David G

On Mon, Jun 18, 2018 at 1:45 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> This adds the low-speed connector to the ZCU100 rev C device
> tree (also known as the Ultra96 board).
>
> This is a proof-of-concept only, showing how it is possible
> to populate a Secure96 board using the other patches in the
> series.
>
> If you comment out or delete the board {} node, you can
> populate/depopulate the board from sysfs instead.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../boot/dts/xilinx/zynqmp-zcu100-revC.dts    | 27 +++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> index d62276e0e0a9..fc30497f248d 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> @@ -110,6 +110,28 @@
>                 compatible = "mmc-pwrseq-simple";
>                 reset-gpios = <&gpio 7 GPIO_ACTIVE_LOW>; /* WIFI_EN */
>         };
> +
> +       lscon: connector {
> +               compatible = "96boards,low-speed-connector";
> +               i2c0 = <&i2csw_0>;
> +               i2c1 = <&i2csw_1>;
> +               spi = <&spi0>;

David had suggested having an aliases node here for mapping things
like SPI and I2C. That actually seems like a good use for aliases
compared to the usual abuse to make Linux provide fixed numbering.

> +               gpios = <&gpio 36 GPIO_ACTIVE_HIGH>, /* GPIO-A */

Why aren't you using gpio-map? This is what it was defined for.

> +                       <&gpio 37 GPIO_ACTIVE_HIGH>, /* GPIO-B */
> +                       <&gpio 39 GPIO_ACTIVE_HIGH>, /* GPIO-C */
> +                       <&gpio 40 GPIO_ACTIVE_HIGH>, /* GPIO-D */
> +                       <&gpio 44 GPIO_ACTIVE_HIGH>, /* GPIO-E */
> +                       <&gpio 45 GPIO_ACTIVE_HIGH>, /* GPIO-F */
> +                       <&gpio 78 GPIO_ACTIVE_HIGH>, /* GPIO-G */
> +                       <&gpio 79 GPIO_ACTIVE_HIGH>, /* GPIO-H */
> +                       <&gpio 80 GPIO_ACTIVE_HIGH>, /* GPIO-I */
> +                       <&gpio 81 GPIO_ACTIVE_HIGH>, /* GPIO-J */
> +                       <&gpio 82 GPIO_ACTIVE_HIGH>, /* GPIO-K */
> +                       <&gpio 83 GPIO_ACTIVE_HIGH>; /* GPIO-L */
> +               board {
> +                       compatible = "96boards,secure96";

I'm all for putting things in the kernel/drivers for things we can't
nail down bindings for, but it really seems like you are punting all
the problems. Plus if we fully define how to handle the different
bindings, we'll likely end up with something different and
incompatible with what you have here.

Rob
