Return-Path: <SRS0=+993=TU=verge.net.au=horms@kernel.org>
Date: Mon, 20 May 2019 13:43:27 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v4 13/13] ARM: dts: rza2mevb: Add USB Host support
Message-ID: <20190520114326.fsv5bxgm6xbpxgqc@verge.net.au>
References: <20190515152048.42363-1-chris.brandt@renesas.com>
 <20190515152048.42363-14-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190515152048.42363-14-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, May 15, 2019 at 10:20:48AM -0500, Chris Brandt wrote:
> Enable USB Host support for both the Type-C connector on the CPU board
> and the Type-A plug on the sub board.
> 
> Both boards are also capable of USB Device operation as well after the
> appropriate Device Tree modifications.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Chris,

applied for inclusion in v5.3.
