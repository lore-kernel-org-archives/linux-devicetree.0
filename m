Return-Path: <robherring2@gmail.com>
Date: Mon, 2 Sep 2019 16:19:46 +0100
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: sh-mobile-ceu: Remove now unimplemented
 bindings documentation
Message-ID: <20190902151946.GA27850@bogus>
References: <20190902084352.7974-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902084352.7974-1-horms+renesas@verge.net.au>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Jacopo Mondi <jacopo@jmondi.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon,  2 Sep 2019 10:43:52 +0200, Simon Horman wrote:
> Remove the SH Mobile CEU bindings documentation as the corresponding driver
> was removed v5.1 by the following commit:
> 
> 43a445f188e1 ("media: sh_mobile_ceu_camera: remove obsolete soc_camera driver")
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  .../devicetree/bindings/media/sh_mobile_ceu.txt         | 17 -----------------
>  1 file changed, 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/sh_mobile_ceu.txt
> 

Acked-by: Rob Herring <robh@kernel.org>
