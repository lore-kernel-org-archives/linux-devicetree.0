Return-Path: <robherring2@gmail.com>
Date: Mon, 16 Jul 2018 11:49:57 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt: serial: Add Renesas RZ/N1 binding
 documentation
Message-ID: <20180716174957.GA6215@rob-hp-laptop>
References: <1531474429-17146-1-git-send-email-phil.edworthy@renesas.com>
 <1531474429-17146-2-git-send-email-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531474429-17146-2-git-send-email-phil.edworthy@renesas.com>
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms@verge.net.au>, linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 13, 2018 at 10:33:48AM +0100, Phil Edworthy wrote:
> The RZ/N1 UART is a modified Synopsys DesignWare UART.
> The modifications only relate to DMA so you could actually use the
> controller with the Synopsys compatible string if you are not using
> DMA, but you should not do so.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> ---
> v2:
>  - Change "renesas,<peripheral>-<family-or-device>" to
>    "renesas,<family-or-device>-<peripheral>"
> ---
>  Documentation/devicetree/bindings/serial/renesas,rzn1-uart.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serial/renesas,rzn1-uart.txt

Reviewed-by: Rob Herring <robh@kernel.org>
