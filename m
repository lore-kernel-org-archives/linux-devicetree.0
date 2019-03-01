From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6dl-yapp4: Use rgmii-id phy mode on the cpu
 port
Date: Fri, 1 Mar 2019 10:13:49 +0800
Message-ID: <20190301021344.GK26041@dragon>
References: <1550583420-112858-1-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550583420-112858-1-git-send-email-michal.vokac@ysoft.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc: Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 19, 2019 at 02:37:00PM +0100, Michal Vokáč wrote:
> The PHY must add delays to both Tx and Rx clock on the cpu port
> to work propperly.
> 
> It worked with the rgmii mode before beacause the qca8k driver
> (incorrecly) enabled delays in that mode.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> ---
> This imx6dl-yapp4 platform is currently waiting in linux-next.
> 
> Commit 5ecdd77c61c8 ("net: dsa: qca8k: disable delay for RGMII mode"), now
> also in linux-next removed the delays from the RGMII mode so the networking
> stopped working.
> 
> Recently Koul submitted a patch that implements the rgmii-id mode to fix
> the issue [1].
> 
> As the networking is broken at this moment it does not matter which patch
> goes in first. It is not neccessary to wait until the Koul's patch is
> applied/merged if that should be the case.
> 
> [1] http://patchwork.ozlabs.org/patch/1044505/

Can we have such useful info in the commit log in some proper form?

Shawn

> 
>  arch/arm/boot/dts/imx6dl-yapp4-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
> index b715ab0fa1ff..091d829f6b05 100644
> --- a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
> +++ b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
> @@ -125,7 +125,7 @@
>  				ethphy0: port@0 {
>  					reg = <0>;
>  					label = "cpu";
> -					phy-mode = "rgmii";
> +					phy-mode = "rgmii-id";
>  					ethernet = <&fec>;
>  
>  					fixed-link {
> -- 
> 2.1.4
> 
