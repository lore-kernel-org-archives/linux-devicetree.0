From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH/RFC] ARM: shmobile: lager: Fix audio clk master to SSI
 and change audio data interface format type
Date: Sun, 15 Feb 2015 10:29:58 -0500
Message-ID: <20150215152957.GA25065@verge.net.au>
References: <1424011746-3787-1-git-send-email-ykaneko0929@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1424011746-3787-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-sh@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: devicetree@vger.kernel.org

[Cc Morimoto-san]

Hi Kaneko-san,

thanks for this.

Hi Morimoto-san,

I would be most grateful if you could review this.

On Sun, Feb 15, 2015 at 11:49:04PM +0900, Yoshihiro Kaneko wrote:
> From: Biju Das <biju.das@bp.renesas.com>
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
> 
> This patch is based on devel branch of Simon Horman's renesas tree.
> 
>  arch/arm/boot/dts/r8a7790-lager.dts | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
> index 0c3b678..e7dda8a 100644
> --- a/arch/arm/boot/dts/r8a7790-lager.dts
> +++ b/arch/arm/boot/dts/r8a7790-lager.dts
> @@ -177,9 +177,7 @@
>  	sound {
>  		compatible = "simple-audio-card";
>  
> -		simple-audio-card,format = "left_j";
> -		simple-audio-card,bitclock-master = <&sndcodec>;
> -		simple-audio-card,frame-master = <&sndcodec>;
> +		simple-audio-card,format = "i2s";
>  
>  		sndcpu: simple-audio-card,cpu {
>  			sound-dai = <&rcar_sound>;
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-sh" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
