Return-Path: <robherring2@gmail.com>
Date: Tue, 9 Jul 2019 10:21:31 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: timer: renesas, cmt: Add CMT0234 to
 sh73a0 and r8a7740
Message-ID: <20190709162131.GA6037@bogus>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
 <156076217672.4736.6510117188637868943.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156076217672.4736.6510117188637868943.sendpatchset@octo>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 17 Jun 2019 18:02:56 +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Document the on-chip CMT devices included in r8a7740 and sh73a0.
> 
> Included in this patch is DT binding documentation for 32-bit CMTs
> CMT0, CMT2, CMT3 and CMT4. They all contain a single channel and are
> quite similar however some minor differences still exist:
>  - "Counter input clock" (clock input and on-device divider)
>     One example is that RCLK 1/1 is supported by CMT2, CMT3 and CMT4.
>  - "Wakeup request" (supported by CMT0 and CMT2)
> 
> Because of this one unique compat string per CMT device is selected.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> --- 0001/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 13:26:56.325963995 +0900
> @@ -22,6 +22,10 @@ Required Properties:
>  
>      - "renesas,r8a73a4-cmt0" for the 32-bit CMT0 device included in r8a73a4.
>      - "renesas,r8a73a4-cmt1" for the 48-bit CMT1 device included in r8a73a4.
> +    - "renesas,r8a7740-cmt0" for the 32-bit CMT0 device included in r8a7740.
> +    - "renesas,r8a7740-cmt2" for the 32-bit CMT2 device included in r8a7740.
> +    - "renesas,r8a7740-cmt3" for the 32-bit CMT3 device included in r8a7740.
> +    - "renesas,r8a7740-cmt4" for the 32-bit CMT4 device included in r8a7740.
>      - "renesas,r8a7743-cmt0" for the 32-bit CMT0 device included in r8a7743.
>      - "renesas,r8a7743-cmt1" for the 48-bit CMT1 device included in r8a7743.
>      - "renesas,r8a7744-cmt0" for the 32-bit CMT0 device included in r8a7744.
> @@ -48,6 +52,10 @@ Required Properties:
>      - "renesas,r8a77970-cmt1" for the 48-bit CMT1 device included in r8a77970.
>      - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
>      - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
> +    - "renesas,sh73a0-cmt0" for the 32-bit CMT0 device included in sh73a0.
> +    - "renesas,sh73a0-cmt2" for the 32-bit CMT2 device included in sh73a0.
> +    - "renesas,sh73a0-cmt3" for the 32-bit CMT3 device included in sh73a0.
> +    - "renesas,sh73a0-cmt4" for the 32-bit CMT4 device included in sh73a0.
>  
>      - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2
>  		and RZ/G1.
> 

Reviewed-by: Rob Herring <robh@kernel.org>
