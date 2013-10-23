From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 1/4] ARM: dts: i.MX53: Add alternate pinmux option for
 i2c_3
Date: Wed, 23 Oct 2013 15:39:21 +0800
Message-ID: <20131023073918.GK2839@S2101-09.ap.freescale.net>
References: <1382461643-16790-1-git-send-email-lisovy@gmail.com>
 <1382461643-16790-2-git-send-email-lisovy@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1382461643-16790-2-git-send-email-lisovy@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rostislav Lisovy <lisovy@gmail.com>
Cc: Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, pisa@cmp.felk.cvut.cz
List-Id: devicetree@vger.kernel.org

On Tue, Oct 22, 2013 at 07:07:20PM +0200, Rostislav Lisovy wrote:
> Signed-off-by: Rostislav Lisovy <lisovy@gmail.com>
> 

Applied #1 and #2, thanks.

Shawn

> diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
> index 4307e80..55e83d1 100644
> --- a/arch/arm/boot/dts/imx53.dtsi
> +++ b/arch/arm/boot/dts/imx53.dtsi
> @@ -599,6 +599,13 @@
>  							MX53_PAD_GPIO_5__I2C3_SCL 0xc0000000
>  						>;
>  					};
> +
> +					pinctrl_i2c3_2: i2c3grp-2 {
> +						fsl,pins = <
> +							MX53_PAD_GPIO_3__I2C3_SCL	0xc0000000
> +							MX53_PAD_GPIO_6__I2C3_SDA	0xc0000000
> +						>;
> +					};
>  				};
>  
>  				ipu_disp0 {
> -- 
> 1.7.10.4
> 
