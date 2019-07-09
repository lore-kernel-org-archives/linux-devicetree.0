Return-Path: <robherring2@gmail.com>
Date: Tue, 9 Jul 2019 10:25:19 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 6/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1
 to r8a77990
Message-ID: <20190709162519.GA13108@bogus>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
 <156076222206.4736.3009593403446400658.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156076222206.4736.3009593403446400658.sendpatchset@octo>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 17 Jun 2019 18:03:42 +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> This patch adds DT binding documentation for the CMT devices on
> the R-Car Gen3 E3 (r8a77990) SoC.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt |    2 ++
>  1 file changed, 2 insertions(+)
> 
> --- 0010/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 13:58:48.559219302 +0900
> @@ -51,6 +51,8 @@ Required Properties:
>      - "renesas,r8a77970-cmt1" for the 48-bit CMT1 device included in r8a77970.
>      - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
>      - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
> +    - "renesas,r8a77990-cmt0" for the 32-bit CMT0 device included in r8a77990.
> +    - "renesas,r8a77990-cmt1" for the 48-bit CMT1 device included in r8a77990.
>      - "renesas,sh73a0-cmt0" for the 32-bit CMT0 device included in sh73a0.
>      - "renesas,sh73a0-cmt1" for the 48-bit CMT1 device included in sh73a0.
>      - "renesas,sh73a0-cmt2" for the 32-bit CMT2 device included in sh73a0.
> 

Reviewed-by: Rob Herring <robh@kernel.org>
