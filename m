From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: Add LVDS decoder to R-Car
 V3M Eagle
Date: Fri, 9 Mar 2018 15:49:46 +0100
Message-ID: <20180309144946.izwfa2hs2ymnpngz@verge.net.au>
References: <1520603500-15218-1-git-send-email-jacopo+renesas@jmondi.org>
 <1520603500-15218-4-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1520603500-15218-4-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, airlied@linux.ie, magnus.damm@gmail.com, geert@linux-m68k.org, niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com, robh+dt@kernel.org, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 09, 2018 at 02:51:40PM +0100, Jacopo Mondi wrote:
> The R-Car V3M Eagle board includes a transparent LVDS decoder, connected
> to the on-chip LVDS encoder output on one side and to HDMI encoder
> ADV7511w on the other one.
> 
> As the decoder does not need any configuration it has been so-far
> omitted from DTS. Now that a driver for transparent LVDS decoder is
> available, describe it in DT as well.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks, I have marked this as deferred pending acceptance of the bindings.
Please repost or otherwise ping me once they have been accepted.
