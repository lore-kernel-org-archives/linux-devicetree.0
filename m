Return-Path: <robherring2@gmail.com>
Date: Tue, 9 Jul 2019 10:26:47 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 8/8] dt-bindings: timer: renesas, cmt: Update R-Car Gen3
 CMT1 usage
Message-ID: <20190709162647.GA15846@bogus>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
 <156076224112.4736.5038116002723317642.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156076224112.4736.5038116002723317642.sendpatchset@octo>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 17 Jun 2019 18:04:01 +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> The R-Car Gen3 SoCs so far come with a total for 4 on-chip CMT devices:
>  - CMT0
>  - CMT1
>  - CMT2
>  - CMT3
> 
> CMT0 includes two rather basic 32-bit timer channels. The rest of the on-chip
> CMT devices support 48-bit counters and have 8 channels each.
> 
> Based on the data sheet information "CMT2/3 are exactly same as CMT1"
> it seems that CMT2 and CMT3 now use the CMT1 compat string in the DTSI.
> 
> Clarify this in the DT binding documentation by describing R-Car Gen3 and
> RZ/G2 CMT1 as "48-bit CMT devices".
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt |   26 +++++++--------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> --- 0014/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 14:07:46.502422801 +0900
> @@ -28,9 +28,9 @@ Required Properties:
>      - "renesas,r8a77470-cmt0" for the 32-bit CMT0 device included in r8a77470.
>      - "renesas,r8a77470-cmt1" for the 48-bit CMT1 device included in r8a77470.
>      - "renesas,r8a774a1-cmt0" for the 32-bit CMT0 device included in r8a774a1.
> -    - "renesas,r8a774a1-cmt1" for the 48-bit CMT1 device included in r8a774a1.
> +    - "renesas,r8a774a1-cmt1" for the 48-bit CMT devices included in r8a774a1.
>      - "renesas,r8a774c0-cmt0" for the 32-bit CMT0 device included in r8a774c0.
> -    - "renesas,r8a774c0-cmt1" for the 48-bit CMT1 device included in r8a774c0.
> +    - "renesas,r8a774c0-cmt1" for the 48-bit CMT devices included in r8a774c0.
>      - "renesas,r8a7790-cmt0" for the 32-bit CMT0 device included in r8a7790.
>      - "renesas,r8a7790-cmt1" for the 48-bit CMT1 device included in r8a7790.
>      - "renesas,r8a7791-cmt0" for the 32-bit CMT0 device included in r8a7791.
> @@ -42,34 +42,34 @@ Required Properties:
>      - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
>      - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7794.
>      - "renesas,r8a7795-cmt0" for the 32-bit CMT0 device included in r8a7795.
> -    - "renesas,r8a7795-cmt1" for the 48-bit CMT1 device included in r8a7795.
> +    - "renesas,r8a7795-cmt1" for the 48-bit CMT devices included in r8a7795.
>      - "renesas,r8a7796-cmt0" for the 32-bit CMT0 device included in r8a7796.
> -    - "renesas,r8a7796-cmt1" for the 48-bit CMT1 device included in r8a7796.
> +    - "renesas,r8a7796-cmt1" for the 48-bit CMT devices included in r8a7796.
>      - "renesas,r8a77965-cmt0" for the 32-bit CMT0 device included in r8a77965.
> -    - "renesas,r8a77965-cmt1" for the 48-bit CMT1 device included in r8a77965.
> +    - "renesas,r8a77965-cmt1" for the 48-bit CMT devices included in r8a77965.
>      - "renesas,r8a77970-cmt0" for the 32-bit CMT0 device included in r8a77970.
> -    - "renesas,r8a77970-cmt1" for the 48-bit CMT1 device included in r8a77970.
> +    - "renesas,r8a77970-cmt1" for the 48-bit CMT devices included in r8a77970.
>      - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
> -    - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
> +    - "renesas,r8a77980-cmt1" for the 48-bit CMT devices included in r8a77980.
>      - "renesas,r8a77990-cmt0" for the 32-bit CMT0 device included in r8a77990.
> -    - "renesas,r8a77990-cmt1" for the 48-bit CMT1 device included in r8a77990.
> +    - "renesas,r8a77990-cmt1" for the 48-bit CMT devices included in r8a77990.
>      - "renesas,r8a77995-cmt0" for the 32-bit CMT0 device included in r8a77995.
> -    - "renesas,r8a77995-cmt1" for the 48-bit CMT1 device included in r8a77995.
> +    - "renesas,r8a77995-cmt1" for the 48-bit CMT devices included in r8a77995.
>      - "renesas,sh73a0-cmt0" for the 32-bit CMT0 device included in sh73a0.
>      - "renesas,sh73a0-cmt1" for the 48-bit CMT1 device included in sh73a0.
>      - "renesas,sh73a0-cmt2" for the 32-bit CMT2 device included in sh73a0.
>      - "renesas,sh73a0-cmt3" for the 32-bit CMT3 device included in sh73a0.
>      - "renesas,sh73a0-cmt4" for the 32-bit CMT4 device included in sh73a0.
>  
> -    - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2
> +    - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 device included in R-Car Gen2
>  		and RZ/G1.
> -    - "renesas,rcar-gen2-cmt1" for 48-bit CMT1 devices included in R-Car Gen2
> +    - "renesas,rcar-gen2-cmt1" for 48-bit CMT1 device included in R-Car Gen2
>  		and RZ/G1.
>  		These are fallbacks for r8a73a4, R-Car Gen2 and RZ/G1 entries
>  		listed above.
> -    - "renesas,rcar-gen3-cmt0" for 32-bit CMT0 devices included in R-Car Gen3
> +    - "renesas,rcar-gen3-cmt0" for 32-bit CMT0 device included in R-Car Gen3
>  		and RZ/G2.
> -    - "renesas,rcar-gen3-cmt1" for 48-bit CMT1 devices included in R-Car Gen3
> +    - "renesas,rcar-gen3-cmt1" for 48-bit CMT devices included in R-Car Gen3
>  		and RZ/G2.
>  		These are fallbacks for R-Car Gen3 and RZ/G2 entries listed
>  		above.
> 

Reviewed-by: Rob Herring <robh@kernel.org>
