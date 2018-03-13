From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 3/3] arm64: dts: renesas: Add LVDS decoder to R-Car
 V3M Eagle
Date: Tue, 13 Mar 2018 19:47:19 +0100
Message-ID: <20180313184719.rkcaae7th4lhgd6o@verge.net.au>
References: <1520951425-13843-1-git-send-email-jacopo+renesas@jmondi.org>
 <1520951425-13843-4-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1520951425-13843-4-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, airlied@linux.ie, magnus.damm@gmail.com, geert@linux-m68k.org, niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com, robh+dt@kernel.org, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 13, 2018 at 03:30:25PM +0100, Jacopo Mondi wrote:
> The R-Car V3M Eagle board includes a transparent THC63LVD1024 LVDS
> decoder, connected to the on-chip LVDS encoder output on one side
> and to HDMI encoder ADV7511w on the other one.
> 
> As the decoder does not need any configuration it has been so-far
> omitted from DTS. Now that a driver is available, describe it in DT
> as well.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

I have marked this as deferred pending acceptance of the new binding.
Please repost or ping me once that has happened.
