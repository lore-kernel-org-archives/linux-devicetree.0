Return-Path: <robherring2@gmail.com>
Date: Mon, 26 Mar 2018 17:24:50 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] spi: sh-msiof: Document R-Car M3-N support
Message-ID: <20180326222450.7e7lgchhsbauexrt@rob-hp-laptop>
References: <1521795785-23825-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521795785-23825-1-git-send-email-geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Mar 23, 2018 at 10:03:05AM +0100, Geert Uytterhoeven wrote:
> Document support for the MSIOF module in the Renesas M3-N (r8a77965) SoC.
> 
> No driver update is needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/spi/sh-msiof.txt | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
