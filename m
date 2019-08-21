Return-Path: <robherring2@gmail.com>
Date: Wed, 21 Aug 2019 16:45:54 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: ata: sata_rcar: Rename bindings
 documentation file
Message-ID: <20190821214554.GA8691@bogus>
References: <20190809215131.877-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809215131.877-1-horms+renesas@verge.net.au>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Jens Axboe <axboe@kernel.dk>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, linux-ide@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri,  9 Aug 2019 14:51:31 -0700, Simon Horman wrote:
> Rename the bindings documentation file for Renesas SATA controller
> from sata_rcar.txt to renesas,rcar-sata.txt
> 
> This is part of an ongoing effort to name bindings documentation files for
> Renesas IP blocks consistently, in line with the compat strings they
> document.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> Based on v5.3-rc1
> ---
>  .../devicetree/bindings/ata/{sata_rcar.txt => renesas,rcar-sata.txt}      | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/ata/{sata_rcar.txt => renesas,rcar-sata.txt} (100%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
