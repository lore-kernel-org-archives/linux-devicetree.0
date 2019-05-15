Return-Path: <SRS0=DwSA=TP=verge.net.au=horms@kernel.org>
Date: Wed, 15 May 2019 10:02:45 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 03/15] phy: renesas: rcar-gen3-usb2: detect usb_x1
 clock
Message-ID: <20190515080244.yxoi6bt7ggawuekq@verge.net.au>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-4-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514145605.19112-4-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, May 14, 2019 at 09:55:53AM -0500, Chris Brandt wrote:
> The RZ/A2 has an optional dedicated 48MHz clock input for the PLL.
> If a clock node named 'usb_x1' exists and set to non-zero, then we can
> assume we want it use it.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
