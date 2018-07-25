Return-Path: <robherring2@gmail.com>
Date: Wed, 25 Jul 2018 13:51:25 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] serial: sh-sci: Document that serial aliases became
 optional
Message-ID: <20180725195125.GA10356@rob-hp-laptop>
References: <20180720121940.29616-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180720121940.29616-1-geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 20, 2018 at 02:19:40PM +0200, Geert Uytterhoeven wrote:
> Serial aliases are optional since commit 7678f4c20fa7670f ("serial:
> sh-sci: Add support for dynamic instances").
> Update the DT bindings to reflect this.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/serial/renesas,sci-serial.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
