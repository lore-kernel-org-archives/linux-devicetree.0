From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx8mq: Add QuadSPI controller
Date: Wed, 30 Jan 2019 08:58:32 -0200
Message-ID: <CAOMZO5DnJxgx1k3q4BxXJWV6rD9f3KUVfrK8uJmvD90BfB2NdA@mail.gmail.com>
References: <20190130091953.20131-1-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190130091953.20131-1-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <ccaione@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Carlo,

On Wed, Jan 30, 2019 at 7:19 AM Carlo Caione <ccaione@baylibre.com> wrote:
>
> Add a node for the Freescale/NXP QuadSPI controller with a proper
> pinctrl set and enable it for the i.MX8MQ EVK board.
> Extend also the AIPS3 memory range to accommodate the QuadSPI-memory
> region.
>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 27 ++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi    | 16 +++++++++++-

Please split this in two patches: one for the imx8mq.dtsi and other
for the board dts.

> +&spi0 {

I have recently sent a patch adding eCSPI support. Please call this
qspi0 to avoid confusion with the eCSPI name instances.

> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_qspi>;
> +       status = "okay";
> +
> +       flash0: n25q256a@0 {

Node names should be generic and label names specific, so:

n25q256a: flash@0

> +               reg = <0>;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               compatible = "micron,n25q256a", "jedec,spi-nor";
> +               spi-max-frequency = <29000000>;
> +               spi-nor,ddr-quad-read-dummy = <6>;

This property does not exist in mainline.

>
> +                       spi0: spi@30bb0000 {

qspi0: spi@30bb0000 {

> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               compatible = "fsl,imx8mq-qspi", "fsl,imx7d-qspi";

Please send a separate patch documenting fsl,imx8mq-qspi
