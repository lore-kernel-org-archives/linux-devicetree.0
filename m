From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH repost] dt-bindings: timer: renesas, cmt: Document
 r8a779{5|65|90} CMT support
Date: Thu, 13 Jun 2019 12:12:20 +0200
Message-ID: <20190613101219.vx4ht6dixxu7fioi@verge.net.au>
References: <20190509122949.23256-1-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190509122949.23256-1-horms+renesas@verge.net.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Cao Van Dong <cv-dong@jinso.co.jp>
List-Id: devicetree@vger.kernel.org

On Thu, May 09, 2019 at 02:29:49PM +0200, Simon Horman wrote:
> From: Cao Van Dong <cv-dong@jinso.co.jp>
> 
> Document SoC specific bindings for R-Car H3/M3-N/E3 SoCs.

Hi Daniel and Thomas,

would you object to me taking this patch through the renesas tree.
It has been outstanding for some time now.

> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> index c0594450e9ef..c5220bcd852b 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> @@ -42,12 +42,18 @@ Required Properties:
>      - "renesas,r8a7793-cmt1" for the 48-bit CMT1 device included in r8a7793.
>      - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
>      - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7794.
> +    - "renesas,r8a7795-cmt0" for the 32-bit CMT0 device included in r8a7795.
> +    - "renesas,r8a7795-cmt1" for the 48-bit CMT1 device included in r8a7795.
>      - "renesas,r8a7796-cmt0" for the 32-bit CMT0 device included in r8a7796.
>      - "renesas,r8a7796-cmt1" for the 48-bit CMT1 device included in r8a7796.
> +    - "renesas,r8a77965-cmt0" for the 32-bit CMT0 device included in r8a77965.
> +    - "renesas,r8a77965-cmt1" for the 48-bit CMT1 device included in r8a77965.
>      - "renesas,r8a77970-cmt0" for the 32-bit CMT0 device included in r8a77970.
>      - "renesas,r8a77970-cmt1" for the 48-bit CMT1 device included in r8a77970.
>      - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
>      - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
> +    - "renesas,r8a77990-cmt0" for the 32-bit CMT0 device included in r8a77990.
> +    - "renesas,r8a77990-cmt1" for the 48-bit CMT1 device included in r8a77990.
>  
>      - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2
>  		and RZ/G1.
> -- 
> 2.11.0
> 
