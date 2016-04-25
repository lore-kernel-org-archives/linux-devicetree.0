From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 17/41] Documentation: dt: mtd: fix spelling mistake
Date: Mon, 25 Apr 2016 08:50:32 -0500
Message-ID: <20160425135032.GA8867@rob-hp-laptop>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
 <1461543878-3639-18-git-send-email-eric@engestrom.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461543878-3639-18-git-send-email-eric@engestrom.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Engestrom <eric@engestrom.ch>
Cc: linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Simon Arlott <simon@fire.lp0.eu>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 25, 2016 at 01:24:14AM +0100, Eric Engestrom wrote:
> Signed-off-by: Eric Engestrom <eric@engestrom.ch>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> index c2546ce..0f6985b 100644
> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> @@ -52,7 +52,7 @@ Optional properties:
>                                v7.0. Use this property to describe the rare
>                                earlier versions of this core that include WP
>  
> - -- Additonal SoC-specific NAND controller properties --
> + -- Additional SoC-specific NAND controller properties --
>  
>  The NAND controller is integrated differently on the variety of SoCs on which it
>  is found. Part of this integration involves providing status and enable bits
> -- 
> 2.8.0
> 
