Return-Path: <SRS0=DwSA=TP=verge.net.au=horms@kernel.org>
Date: Wed, 15 May 2019 10:05:00 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 10/15] usb: renesas_usbhs: support byte addressable
 CFIFO
Message-ID: <20190515080459.cumjv2ahv4hddhvk@verge.net.au>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-11-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514145605.19112-11-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, May 14, 2019 at 09:56:00AM -0500, Chris Brandt wrote:
> Some SoC have a CFIFO register that is byte addressable. This means
> when the CFIFO access is set to 32-bit, you can write 8-bit values to
> addresses CFIFO+0, CFIFO+1, CFIFO+2, CFIFO+3.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
