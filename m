From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: mt8173: add clock_null
Date: Thu, 18 Jun 2015 18:15:03 +0200
Message-ID: <2333431.ttvjElY3ps@phil>
References: <1434605351-64592-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1434605351-64592-1-git-send-email-eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 18. Juni 2015, 13:29:11 schrieb Eddie Huang:
> Add clk_null, which represents clocks that can not / need not
> controlled by software.
> There are many clocks' parent set to clk_null.

Devicetree is supposed to describe hardware, and ideally not what software 
does with it. If the clock simply cannot be controlled by software, it will 
still have a rate and I think it should probably be modelled - similarly we 
sometimes have fixed regulators that also are not software controllable.


While it might be ok to define dummy clocks as a temporary stopgap, these 
should definitly be marked as such. This clk_null at least sounds like there is 
no plan to replace this with a real solution at some point.

And of course a bit of context would be cool, to know which type of clocks 
this actually replaces.


Heiko

> Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
> Base on 4.1-rc1
> 
> Change-Id: I4db9b40d07e28f54f7bae9b676316cbd6a962124
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> b/arch/arm64/boot/dts/mediatek/mt8173.dtsi index 924fdb6..4798f44 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -81,6 +81,12 @@
>  		cpu_on	      = <0x84000003>;
>  	};
> 
> +	clk_null: clk_null {
> +		compatible = "fixed-clock";
> +		clock-frequency = <0>;
> +		#clock-cells = <0>;
> +	};
> +
>  	uart_clk: dummy26m {
>  		compatible = "fixed-clock";
>  		clock-frequency = <26000000>;
