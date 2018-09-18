From: Scott Wood <oss@buserror.net>
Subject: Re: [PATCH] powerpc/mpc85xx: fix issues in clock node
Date: Tue, 18 Sep 2018 17:24:05 -0500
Message-ID: <ee1869ae946229fe01f5269fcebd855a2fc8770d.camel@buserror.net>
References: <20180911021224.30558-1-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20180911021224.30558-1-andy.tang@nxp.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: andy.tang@nxp.com
Cc: mark.rutland@arm.com, robh+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2018-09-11 at 10:12 +0800, andy.tang@nxp.com wrote:
> From: Yuantian Tang <andy.tang@nxp.com>
> 
> The compatible string is not correct in the clock node.
> The clocks property refers to the wrong node too.
> This patch is to fix them.
> 
> Signed-off-by: Tang Yuantian <andy.tang@nxp.com>
> ---
>  arch/powerpc/boot/dts/fsl/t1023si-post.dtsi |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
> b/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
> index 4908af5..763caf4 100644
> --- a/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
> @@ -348,7 +348,7 @@
>  		mux0: mux0@0 {
>  			#clock-cells = <0>;
>  			reg = <0x0 4>;
> -			compatible = "fsl,core-mux-clock";
> +			compatible = "fsl,qoriq-core-mux-2.0";
>  			clocks = <&pll0 0>, <&pll0 1>;
>  			clock-names = "pll0_0", "pll0_1";
>  			clock-output-names = "cmux0";
> @@ -356,9 +356,9 @@
>  		mux1: mux1@20 {
>  			#clock-cells = <0>;
>  			reg = <0x20 4>;
> -			compatible = "fsl,core-mux-clock";
> -			clocks = <&pll0 0>, <&pll0 1>;
> -			clock-names = "pll0_0", "pll0_1";
> +			compatible = "fsl,qoriq-core-mux-2.0";
> +			clocks = <&pll1 0>, <&pll1 1>;
> +			clock-names = "pll1_0", "pll1_1";
>  			clock-output-names = "cmux1";
>  		};
>  	};

These are the legacy nodes.  Why not just remove them instead of fixing them? 
Now that the cpufreq driver is fixed we could get rid of the legacy nodes for
all the chips.

-Scott
