From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v2] ARM: dts: mxs: add auart2 pinmux to imx28.dtsi
Date: Wed, 23 Oct 2013 19:31:36 +0800
Message-ID: <20131023113128.GA9489@S2101-09.ap.freescale.net>
References: <1382511537-5072-1-git-send-email-aida.mynzhasova@skitlab.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1382511537-5072-1-git-send-email-aida.mynzhasova@skitlab.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Aida Mynzhasova <aida.mynzhasova@skitlab.ru>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, swarren@wwwdotorg.org, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 23, 2013 at 10:58:57AM +0400, Aida Mynzhasova wrote:
> Add auart2 pins configuration on its main pads
> 
> Signed-off-by: Aida Mynzhasova <aida.mynzhasova@skitlab.ru>

Applied, thanks.

Shawn

> ---
>  arch/arm/boot/dts/imx28.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
> index 918d419..cab4c22 100644
> --- a/arch/arm/boot/dts/imx28.dtsi
> +++ b/arch/arm/boot/dts/imx28.dtsi
> @@ -343,6 +343,19 @@
>  					fsl,pull-up = <MXS_PULL_DISABLE>;
>  				};
>  
> +				auart2_pins_a: auart2-pins@0 {
> +					reg = <0>;
> +					fsl,pinmux-ids = <
> +						MX28_PAD_AUART2_RX__AUART2_RX
> +						MX28_PAD_AUART2_TX__AUART2_TX
> +						MX28_PAD_AUART2_CTS__AUART2_CTS
> +						MX28_PAD_AUART2_RTS__AUART2_RTS
> +					>;
> +					fsl,drive-strength = <MXS_DRIVE_4mA>;
> +					fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +					fsl,pull-up = <MXS_PULL_DISABLE>;
> +				};
> +
>  				auart3_pins_a: auart3@0 {
>  					reg = <0>;
>  					fsl,pinmux-ids = <
> -- 
> 1.8.1.2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
