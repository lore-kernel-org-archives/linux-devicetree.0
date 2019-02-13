From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 4/5] dt-bindings: imx8-clock: add a53 and a72 clock id
Date: Wed, 13 Feb 2019 16:18:18 -0600
Message-ID: <20190213221818.GA13126@bogus>
References: <1548335800-6438-1-git-send-email-aisheng.dong@nxp.com>
 <1548335800-6438-5-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1548335800-6438-5-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Aisheng Dong <aisheng.dong@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 24, 2019 at 01:22:45PM +0000, Aisheng Dong wrote:
> Add a53 and a72 clock id, as there's still no users, we update
> IMX_LSIO_MEM_CLK base to start from 6 to allow a53 and a72 clock
> id to be continued with a35 clk.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> v1->v2:
>  * change cpu clock to cpu cluster clock per Rob's suggestion
> ---
>  include/dt-bindings/clock/imx8-clock.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/imx8-clock.h b/include/dt-bindings/clock/imx8-clock.h
> index b149e63..dcce744 100644
> --- a/include/dt-bindings/clock/imx8-clock.h
> +++ b/include/dt-bindings/clock/imx8-clock.h
> @@ -14,10 +14,12 @@
>  /* CPU */
>  #define IMX_A35_CLK					1
>  #define IMX_CPU_CLUSTER_A35_CLK				1
> +#define IMX_CPU_CLUSTER_A53_CLK				2
> +#define IMX_CPU_CLUSTER_A72_CLK				3

I still don't get this. How many clock outputs does the clock controller 
have for CPUs? If 3, then this is correct. If it's the same clock 
controller bits across different SoCs, then just name it something like 
IMX_CPU_CLUSTER_CLK and reuse the same ID.

>  /* LSIO SS */
> -#define IMX_LSIO_MEM_CLK				2
> -#define IMX_LSIO_BUS_CLK				3
> +#define IMX_LSIO_MEM_CLK				6
> +#define IMX_LSIO_BUS_CLK				7

Changing numbering is not good, but I guess it's early for imx8.

>  #define IMX_LSIO_PWM0_CLK				10
>  #define IMX_LSIO_PWM1_CLK				11
>  #define IMX_LSIO_PWM2_CLK				12
> -- 
> 2.7.4
> 
