Return-Path: <robherring2@gmail.com>
Date: Mon, 21 Jan 2019 15:10:12 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: serial: sh-sci: Document r8a7778/9 HSCIF
 bindings
Message-ID: <20190121211012.GA28673@bogus>
References: <20190110153012.21024-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190110153012.21024-1-geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ulrich Hecht <uli+renesas@fpond.eu>, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Jan 10, 2019 at 04:30:12PM +0100, Geert Uytterhoeven wrote:
> From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> 
> Document support for the HSCIF serial ports in the Renesas R-Car M1A
> (R8A7778) and H1 (R8A7779) SoCs.
> 
> No driver update is needed.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> [geert: Patch description]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Picked up from Ulrich and rebased against current.
> ---
>  Documentation/devicetree/bindings/serial/renesas,sci-serial.txt | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Rob
