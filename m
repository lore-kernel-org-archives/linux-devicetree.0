From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 2/4] ARM: dts: rockchip: Fix gpu opp node names for rk3288
Date: Thu, 21 Mar 2019 14:08:13 -0700
Message-ID: <20190321210813.GR112750@google.com>
References: <20190320201402.114309-1-dianders@chromium.org>
 <20190320201402.114309-2-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190320201402.114309-2-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, ryandcase@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 20, 2019 at 01:14:00PM -0700, Douglas Anderson wrote:
> The device tree compiler yells like this:
>   Warning (unit_address_vs_reg):
>   /gpu-opp-table/opp@100000000:
>   node has a unit name, but no reg property
> 
> Let's match the cpu opp node names and use a dash.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  arch/arm/boot/dts/rk3288.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index e9f454248398..79cd3c53e737 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -1282,27 +1282,27 @@
>  	gpu_opp_table: gpu-opp-table {
>  		compatible = "operating-points-v2";
>  
> -		opp@100000000 {
> +		opp-100000000 {
>  			opp-hz = /bits/ 64 <100000000>;
>  			opp-microvolt = <950000>;
>  		};
> -		opp@200000000 {
> +		opp-200000000 {
>  			opp-hz = /bits/ 64 <200000000>;
>  			opp-microvolt = <950000>;
>  		};
> -		opp@300000000 {
> +		opp-300000000 {
>  			opp-hz = /bits/ 64 <300000000>;
>  			opp-microvolt = <1000000>;
>  		};
> -		opp@400000000 {
> +		opp-400000000 {
>  			opp-hz = /bits/ 64 <400000000>;
>  			opp-microvolt = <1100000>;
>  		};
> -		opp@500000000 {
> +		opp-500000000 {
>  			opp-hz = /bits/ 64 <500000000>;
>  			opp-microvolt = <1200000>;
>  		};
> -		opp@600000000 {
> +		opp-600000000 {
>  			opp-hz = /bits/ 64 <600000000>;
>  			opp-microvolt = <1250000>;
>  		};

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
