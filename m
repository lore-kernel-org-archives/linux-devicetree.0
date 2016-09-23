From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 12/19] reset: sti: Remove obsolete platforms from dt
 binding doc.
Date: Fri, 23 Sep 2016 10:10:08 -0500
Message-ID: <20160923151008.GF9176@rob-hp-laptop>
References: <1473859677-9231-1-git-send-email-peter.griffin@linaro.org>
 <1473859677-9231-13-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473859677-9231-13-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, devicetree@vger.kernel.org, lee.jones@linaro.org, p.zabel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Wed, Sep 14, 2016 at 02:27:50PM +0100, Peter Griffin wrote:
> STiH415/6 SoC support is being removed from the kernel.
> This patch updates the sti dt powerdown bindings and
> removes references to these obsolete platforms.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Cc: <p.zabel@pengutronix.de>
> Cc: <robh+dt@kernel.org>
> ---
>  Documentation/devicetree/bindings/reset/st,sti-powerdown.txt | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/st,sti-powerdown.txt b/Documentation/devicetree/bindings/reset/st,sti-powerdown.txt
> index 1cfd21d..9252713 100644
> --- a/Documentation/devicetree/bindings/reset/st,sti-powerdown.txt
> +++ b/Documentation/devicetree/bindings/reset/st,sti-powerdown.txt
> @@ -16,15 +16,14 @@ Please refer to reset.txt in this directory for common reset
>  controller binding usage.
>  
>  Required properties:
> -- compatible: Should be "st,<chip>-powerdown"
> -	ex: "st,stih415-powerdown", "st,stih416-powerdown"
> +- compatible: Should be "st,stih407-powerdown"
>  - #reset-cells: 1, see below
>  
>  example:
>  
>  	powerdown: powerdown-controller {
> +		compatible = "st,stih407-powerdown";
>  		#reset-cells = <1>;
> -		compatible = "st,stih415-powerdown";
>  	};
>  
>  
> @@ -37,11 +36,10 @@ index specifying which channel to use, as described in reset.txt
>  
>  example:
>  
> -	usb1: usb@fe200000 {
> -		resets	= <&powerdown STIH41X_USB1_POWERDOWN>;
> +	st_dwc3: dwc3@8f94000 {

usb@ was correct here. With that,

Acked-by: Rob Herring <robh@kernel.org>
