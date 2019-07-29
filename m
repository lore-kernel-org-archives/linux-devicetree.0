Return-Path: <SRS0=P9MN=V2=ragnatech.se=niklas.soderlund+renesas@kernel.org>
Date: Mon, 29 Jul 2019 21:57:38 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] dt-bindings: rcar-imr: Rename bindings documentation file
Message-ID: <20190729195738.GH3186@bigcity.dyn.berto.se>
References: <20190729074757.9581-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190729074757.9581-1-horms+renesas@verge.net.au>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

Thanks for your work.

On 2019-07-29 09:47:57 +0200, Simon Horman wrote:
> Renesas media binding documentation files uses a naming schema of
> 'renesas,<module>.txt'. Rename IMR file to match this pattern.
> 
> Cc: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/media/{rcar_imr.txt => renesas,imr.txt} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/media/{rcar_imr.txt => renesas,imr.txt} (100%)
> 
> diff --git a/Documentation/devicetree/bindings/media/rcar_imr.txt b/Documentation/devicetree/bindings/media/renesas,imr.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/rcar_imr.txt
> rename to Documentation/devicetree/bindings/media/renesas,imr.txt
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas S�derlund
