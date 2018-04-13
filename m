Return-Path: <robherring2@gmail.com>
Date: Fri, 13 Apr 2018 12:47:18 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [RESEND PATCH] serial: sh-sci: Document r8a77470 bindings
Message-ID: <20180413174718.bwmmemw6ta3cuujv@rob-hp-laptop>
References: <1523276400-7673-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1523276400-7673-1-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Apr 09, 2018 at 01:20:00PM +0100, Biju Das wrote:
> RZ/G1C (R8A77470) SoC also has the R-Car gen2 compatible SCIF and HSCIF
> ports, so document the SoC specific bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  Documentation/devicetree/bindings/serial/renesas,sci-serial.txt | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
