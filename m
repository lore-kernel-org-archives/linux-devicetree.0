From: Simon Horman <horms@verge.net.au>
Subject: Re: [RESEND] [PATCH v2.1 1/2] dt-bindings: display: rcar-du: Add a
 VSP channel index to the vsps DT property
Date: Thu, 13 Jul 2017 09:46:19 +0200
Message-ID: <20170713074618.GC5580@verge.net.au>
References: <20170626162930.30240-2-laurent.pinchart+renesas@ideasonboard.com>
 <1596663.83UpNEdgHK@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1596663.83UpNEdgHK@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 12, 2017 at 11:43:36AM +0300, Laurent Pinchart wrote:
> On some R-Car SoCs a single VSP can serve multiple DU channels through
> multiple LIF instances in the VSP. The current DT bindings don't support
> specifying that kind of SoC integration scheme. Extend them with a VSP
> channel index.
> 
> Backward compatibility can be ensured in drivers by checking the length
> of the vsps property and setting the channel to 0 when the property
> doesn't contain channel indices.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Rob Herring <robh@kernel.org>

Thanks, applied for v2.1.
