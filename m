Return-Path: <robherring2@gmail.com>
Date: Tue, 9 Jul 2019 10:23:15 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1
 to r8a7792
Message-ID: <20190709162315.GA9309@bogus>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
 <156076219472.4736.14727682068388338615.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156076219472.4736.14727682068388338615.sendpatchset@octo>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 17 Jun 2019 18:03:14 +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> This patch adds DT binding documentation for the CMT devices on
> the R-Car Gen2 V2H (r8a7792) SoC.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt |    2 ++
>  1 file changed, 2 insertions(+)
> 
> --- 0004/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 13:35:10.526874153 +0900
> @@ -35,6 +35,8 @@ Required Properties:
>      - "renesas,r8a7790-cmt1" for the 48-bit CMT1 device included in r8a7790.
>      - "renesas,r8a7791-cmt0" for the 32-bit CMT0 device included in r8a7791.
>      - "renesas,r8a7791-cmt1" for the 48-bit CMT1 device included in r8a7791.
> +    - "renesas,r8a7792-cmt0" for the 32-bit CMT0 device included in r8a7792.
> +    - "renesas,r8a7792-cmt1" for the 48-bit CMT1 device included in r8a7792.
>      - "renesas,r8a7793-cmt0" for the 32-bit CMT0 device included in r8a7793.
>      - "renesas,r8a7793-cmt1" for the 48-bit CMT1 device included in r8a7793.
>      - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
> 

Reviewed-by: Rob Herring <robh@kernel.org>
