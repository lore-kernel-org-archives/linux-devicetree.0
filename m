From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [RFC resend 3/4] arm64: dts: mt8173: Fix drm subsystem
Date: Fri, 20 Oct 2017 17:16:49 +0800
Message-ID: <1508491009.23296.2.camel@mtksdaap41>
References: <20171019112610.13645-1-mbrugger@suse.com>
         <20171019112610.13645-4-mbrugger@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171019112610.13645-4-mbrugger@suse.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com, p.zabel@pengutronix.de, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>
List-Id: devicetree@vger.kernel.org

Hi, Matthias:

On Thu, 2017-10-19 at 13:26 +0200, Matthias Brugger wrote:
> DRM subysystem and clock driver shared the same compatible mmsys.
> This stopped does not work, as only the first driver for a compatible
> gets probed. We change the comaptible to the new DRM identifier to fix
> this.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index b99a27372965..89db0a3f5950 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -803,6 +803,11 @@
>  			#clock-cells = <1>;
>  		};
>  
> +		dispsys: display-system {
> +			compatible = "mediatek,mt2701-dispsys";

Why do you probe "mediatek,mt2701-dispsys" in mt8173.dtsi?

Regards,
CK

> +			mediatek,mmsys = <&mmsys>;
> +		}
> +
>  		mdp_rdma0: rdma@14001000 {
>  			compatible = "mediatek,mt8173-mdp-rdma",
>  				     "mediatek,mt8173-mdp";
