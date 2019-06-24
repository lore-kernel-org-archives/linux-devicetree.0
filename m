From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V12 3/4] arm64: dts: imx8qxp: added ddr performance
 monitor nodes
Date: Mon, 24 Jun 2019 10:02:14 +0800
Message-ID: <20190624020210.GJ3800@dragon>
References: <CAHrpEqT_34eNK-EzRgs-ocDD6pfLzD=FU8n83HgSQVsimJRxPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAHrpEqT_34eNK-EzRgs-ocDD6pfLzD=FU8n83HgSQVsimJRxPw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Zhi Li <lznuaa@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 19, 2019 at 01:46:00PM -0500, Zhi Li wrote:
> Add ddr performance monitor
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> ---
> 
> Resent without base64 encode
> 
> Notes:
>     No change from v9 to v12
> 
>     Change from v8 to v9
>     * put ddr-pmu under ddr_subsystem bus
> 
>     Change from v3 to v8
>     * none
> 
>     Change from v2 to v3
>     * ddr_pmu0 -> ddr-pmu
> 
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> index 0683ee2..a33e08c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -378,6 +378,20 @@
>                 };
>         };
> 
> +       ddr_subsyss: bus@5c000000 {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges = <0x5c000000 0x0 0x5c000000 0x1000000>;
> +
> +               ddr-pmu@5c020000 {
> +                       compatible = "fsl,imx8-ddr-pmu";
> +                       reg = <0x5c020000 0x10000>;
> +                       interrupt-parent = <&gic>;
> +                       interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +       };
> +
>         lsio_subsys: bus@5d000000 {
>                 compatible = "simple-bus";
>                 #address-cells = <1>;

The patch format is corrupted.  All tabs are turned into spaces here.  I
manually apply the patch, but please avoid it next time.

Shawn

> --
> 2.5.2
