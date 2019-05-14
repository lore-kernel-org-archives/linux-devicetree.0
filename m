Return-Path: <robherring2@gmail.com>
Date: Tue, 14 May 2019 14:29:07 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 04/15] dt-bindings: rcar-gen3-phy-usb2: Document use
 of usb_x1
Message-ID: <20190514192907.GA15691@bogus>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-5-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514145605.19112-5-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, 14 May 2019 09:55:54 -0500, Chris Brandt wrote:
> Document the USB_X1 input and add clock-names to identify
> functional and USB_X1 clocks.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v3:
>  * added clock names
> v2:
>  * removed 'use_usb_x1' option
>  * document that 'usb_x1' clock node will be detected to determine if
>    48MHz clock exists
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
