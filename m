Return-Path: <robherring2@gmail.com>
Date: Tue, 9 Jul 2019 10:23:25 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1
 to r8a7795
Message-ID: <20190709162325.GA9674@bogus>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
 <156076220389.4736.5742093495634461883.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156076220389.4736.5742093495634461883.sendpatchset@octo>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 17 Jun 2019 18:03:23 +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> This patch adds DT binding documentation for the CMT devices on
> the R-Car Gen3 H3 (r8a7795) SoC.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt |    2 ++
>  1 file changed, 2 insertions(+)
> 
> --- 0006/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 13:53:43.252212551 +0900
> @@ -41,6 +41,8 @@ Required Properties:
>      - "renesas,r8a7793-cmt1" for the 48-bit CMT1 device included in r8a7793.
>      - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
>      - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7794.
> +    - "renesas,r8a7795-cmt0" for the 32-bit CMT0 device included in r8a7795.
> +    - "renesas,r8a7795-cmt1" for the 48-bit CMT1 device included in r8a7795.
>      - "renesas,r8a7796-cmt0" for the 32-bit CMT0 device included in r8a7796.
>      - "renesas,r8a7796-cmt1" for the 48-bit CMT1 device included in r8a7796.
>      - "renesas,r8a77970-cmt0" for the 32-bit CMT0 device included in r8a77970.
> 

Reviewed-by: Rob Herring <robh@kernel.org>
