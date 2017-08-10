From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: add pfc device node
Date: Thu, 10 Aug 2017 10:13:19 +0200
Message-ID: <20170810081318.GI16647@verge.net.au>
References: <1502281247-24124-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1502281247-24124-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 09, 2017 at 09:20:47PM +0900, Yoshihiro Shimoda wrote:
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> 
>  This patch set is based on the renesas-drivers.git /
> topic/r8a77995-integration branch and depends on the following patch
>  "pinctrl: sh-pfc: r8a77995: Initial R8A77995 PFC support"

Thanks Shimoda-san,

this patch looks fine to me, however, I am marking it as deferred pending
acceptance of the dependency listed above. Please repost or otherwise
ping me once Geert has indicated he will accept that patch.

>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> index 7419688..240b0f8 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -123,6 +123,11 @@
>  			reg = <0 0xe6160000 0 0x0200>;
>  		};
>  
> +		pfc: pfc@e6060000 {
> +			compatible = "renesas,pfc-r8a77995";
> +			reg = <0 0xe6060000 0 0x508>;
> +		};
> +
>  		prr: chipid@fff00044 {
>  			compatible = "renesas,prr";
>  			reg = <0 0xfff00044 0 4>;
> -- 
> 1.9.1
> 
