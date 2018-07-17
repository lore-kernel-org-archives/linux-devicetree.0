Return-Path: <SRS0=YiDI=KB=verge.net.au=horms@kernel.org>
Date: Tue, 17 Jul 2018 14:09:34 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 1/2] dt: serial: Add Renesas RZ/N1 binding
 documentation
Message-ID: <20180717120934.zzrdanps2ndx3p4h@verge.net.au>
References: <1531474429-17146-1-git-send-email-phil.edworthy@renesas.com>
 <1531474429-17146-2-git-send-email-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531474429-17146-2-git-send-email-phil.edworthy@renesas.com>
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 13, 2018 at 10:33:48AM +0100, Phil Edworthy wrote:
> The RZ/N1 UART is a modified Synopsys DesignWare UART.
> The modifications only relate to DMA so you could actually use the
> controller with the Synopsys compatible string if you are not using
> DMA, but you should not do so.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
