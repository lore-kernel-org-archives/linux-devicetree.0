Return-Path: <SRS0=DwSA=TP=verge.net.au=horms@kernel.org>
Date: Wed, 15 May 2019 10:01:44 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 05/15] phy: renesas: rcar-gen3-usb2: Check dr_mode
 when not using OTG
Message-ID: <20190515080144.m55msdtsmz6y64pc@verge.net.au>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-6-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514145605.19112-6-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, May 14, 2019 at 09:55:55AM -0500, Chris Brandt wrote:
> When not using OTG, the PHY will need to know if it should function as
> host or peripheral by checking dr_mode in the PHY node (not the parent
> controller node).
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
