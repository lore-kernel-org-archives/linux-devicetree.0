From: Richard Zhao <richard.zhao@freescale.com>
Subject: Re: [PATCH 4/4] arm/imx: add mc13892 support into imx51-babbage.dts
Date: Fri, 30 Dec 2011 11:28:33 +0800
Message-ID: <20111230032832.GB2414@b20223-02.ap.freescale.net>
References: <1324479647-4580-1-git-send-email-shawn.guo@linaro.org>
 <1324479647-4580-5-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1324479647-4580-5-git-send-email-shawn.guo@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, devicetree-discuss@lists.ozlabs.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 21, 2011 at 11:00:47PM +0800, Shawn Guo wrote:
> It adds mc13892 support into imx51-babbage device tree source.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  arch/arm/boot/dts/imx51-babbage.dts |   93 ++++++++++++++++++++++++++++++++++-
>  1 files changed, 91 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx51-babbage.dts b/arch/arm/boot/dts/imx51-babbage.dts
> index 564cb8c..728c9e8 100644
> --- a/arch/arm/boot/dts/imx51-babbage.dts
> +++ b/arch/arm/boot/dts/imx51-babbage.dts
> @@ -31,12 +31,14 @@
>  				esdhc@70004000 { /* ESDHC1 */
>  					fsl,cd-internal;
>  					fsl,wp-internal;
> +					vmmc-supply = <&vsd_reg>;
>  					status = "okay";
>  				};
>  
>  				esdhc@70008000 { /* ESDHC2 */
>  					cd-gpios = <&gpio1 6 0>;
>  					wp-gpios = <&gpio1 5 0>;
> +					vmmc-supply = <&vsd_reg>;
>  					status = "okay";
>  				};
>  
> @@ -56,8 +58,95 @@
>  						compatible = "fsl,mc13892";
>  						spi-max-frequency = <6000000>;
>  						reg = <0>;
> -						mc13xxx-irq-gpios = <&gpio1 8 0>;
> -						fsl,mc13xxx-uses-regulator;
> +						interrupt-parent = <&gpio1>;
> +						interrupts = <8>;
Why do we put everything in /soc node? Isn't it suppose to put
everything outside SoC outside /soc node?

In my understanding, i2c/spi node in /soc should only describe the bus
host controller. Especially i2c is a multi-master bus.

Thanks
Richard

> +
> +						regulators {
 
Thanks
Richard
