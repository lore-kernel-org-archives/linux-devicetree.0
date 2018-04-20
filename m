From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 5/5] arm64: dts: renesas: eagle: Enable HDMI output
Date: Fri, 20 Apr 2018 11:48:55 +0200
Message-ID: <20180420094855.ikfsjjn4m7vp54fp@verge.net.au>
References: <1523520841-16455-1-git-send-email-jacopo+renesas@jmondi.org>
 <1523520841-16455-6-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1523520841-16455-6-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: magnus.damm@gmail.com, geert@linux-m68k.org, laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 12, 2018 at 10:14:01AM +0200, Jacopo Mondi wrote:
> Enable HDMI output on Renesas R-Car V3M Eagle board.
> 
> The HDMI ouput is enabled connecting the DU LVDS output to the

s/ouput/output/

> transparent LVDS converter THC63LVD1024, and successively routing its
> RGB output to the ADV7511W HDMI encoder.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> [for THC63LVD1024: ]
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Thanks, applied.
