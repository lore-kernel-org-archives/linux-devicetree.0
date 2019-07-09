Return-Path: <robherring2@gmail.com>
Date: Tue, 9 Jul 2019 10:23:01 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on
 sh73a0 and r8a7740
Message-ID: <20190709162301.GA8807@bogus>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
 <156076218574.4736.10317127566447729303.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156076218574.4736.10317127566447729303.sendpatchset@octo>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 17 Jun 2019 18:03:05 +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> This patch reworks the DT binding documentation for the 6-channel
> 48-bit CMTs known as CMT1 on r8a7740 and sh73a0.
> 
> After the update the same style of DT binding as the rest of the upstream
> SoCs will now also be used by r8a7740 and sh73a0. The DT binding "cmt-48"
> is removed from the DT binding documentation, however software support for
> this deprecated binding will still remain in the CMT driver for some time.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt |   10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> --- 0002/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 13:31:52.766505901 +0900
> @@ -12,17 +12,10 @@ datasheets.
>  Required Properties:
>  
>    - compatible: must contain one or more of the following:
> -    - "renesas,cmt-48-sh73a0" for the sh73A0 48-bit CMT
> -		(CMT1)
> -    - "renesas,cmt-48-r8a7740" for the r8a7740 48-bit CMT
> -		(CMT1)
> -    - "renesas,cmt-48" for all non-second generation 48-bit CMT
> -		(CMT1 on sh73a0 and r8a7740)
> -		This is a fallback for the above renesas,cmt-48-* entries.
> -
>      - "renesas,r8a73a4-cmt0" for the 32-bit CMT0 device included in r8a73a4.
>      - "renesas,r8a73a4-cmt1" for the 48-bit CMT1 device included in r8a73a4.
>      - "renesas,r8a7740-cmt0" for the 32-bit CMT0 device included in r8a7740.
> +    - "renesas,r8a7740-cmt1" for the 48-bit CMT1 device included in r8a7740.
>      - "renesas,r8a7740-cmt2" for the 32-bit CMT2 device included in r8a7740.
>      - "renesas,r8a7740-cmt3" for the 32-bit CMT3 device included in r8a7740.
>      - "renesas,r8a7740-cmt4" for the 32-bit CMT4 device included in r8a7740.
> @@ -53,6 +46,7 @@ Required Properties:
>      - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
>      - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
>      - "renesas,sh73a0-cmt0" for the 32-bit CMT0 device included in sh73a0.
> +    - "renesas,sh73a0-cmt1" for the 48-bit CMT1 device included in sh73a0.
>      - "renesas,sh73a0-cmt2" for the 32-bit CMT2 device included in sh73a0.
>      - "renesas,sh73a0-cmt3" for the 32-bit CMT3 device included in sh73a0.
>      - "renesas,sh73a0-cmt4" for the 32-bit CMT4 device included in sh73a0.
> 

Reviewed-by: Rob Herring <robh@kernel.org>
