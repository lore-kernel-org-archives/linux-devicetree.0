From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/3] ARM: dts: imx6ul: Add OCOTP node
Date: Fri, 30 Dec 2016 21:01:06 +0800
Message-ID: <20161230130105.GS6177@dragon>
References: <1480689949-17957-1-git-send-email-d.schultz@phytec.de>
 <1480689949-17957-2-git-send-email-d.schultz@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1480689949-17957-2-git-send-email-d.schultz@phytec.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Schultz <d.schultz@phytec.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Bai Ping <ping.bai@nxp.com>, robh+dt@kernel.org, srinivas.kandagatla@linaro.org, kernel@pengutronix.de, fabio.estevam@nxp.com, maxime.ripard@free-electrons.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 02, 2016 at 03:45:48PM +0100, Daniel Schultz wrote:
> This device node adds OCOTP for the i.MX6UL SoC.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>

Bai Ping (Cc'ed here) from NXP is sending similar patches [1].  DTS
change looks good to me, but I will not apply it until the driver and
bindings get accepted.

Shawn

[1] https://www.spinics.net/lists/arm-kernel/msg540900.html

> ---
>  arch/arm/boot/dts/imx6ul.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
> index c5c05fd..ee53795 100644
> --- a/arch/arm/boot/dts/imx6ul.dtsi
> +++ b/arch/arm/boot/dts/imx6ul.dtsi
> @@ -849,6 +849,12 @@
>  				reg = <0x021b0000 0x4000>;
>  			};
>  
> +			ocotp: ocotp@021bc000 {
> +				compatible = "fsl,imx6ul-ocotp";
> +				reg = <0x021bc000 0x4000>;
> +				clocks = <&clks IMX6UL_CLK_OCOTP>;
> +			};
> +
>  			lcdif: lcdif@021c8000 {
>  				compatible = "fsl,imx6ul-lcdif", "fsl,imx28-lcdif";
>  				reg = <0x021c8000 0x4000>;
> -- 
> 1.9.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
