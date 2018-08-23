From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 9/9] power: supply: twl4030-charger: fix OF sibling-node
 lookup
Date: Thu, 23 Aug 2018 09:40:35 +0200
Message-ID: <20180823074035.GQ14967@localhost>
References: <20180822105547.9634-1-johan@kernel.org>
 <20180822105547.9634-10-johan@kernel.org>
 <20180822213658.uuzsalnlxbayc4ml@earth.universe>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180822213658.uuzsalnlxbayc4ml@earth.universe>
Sender: stable-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>, NeilBrown <neilb@suse.de>, Felipe Balbi <balbi@ti.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 22, 2018 at 11:36:58PM +0200, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Aug 22, 2018 at 12:55:47PM +0200, Johan Hovold wrote:
> > Use the new of_get_compatible_child() helper to lookup the usb sibling
> > node instead of using of_find_compatible_node(), which searches the
> > entire tree and thus can return an unrelated (non-sibling) node.
> > 
> > This also addresses a potential use-after-free (e.g. after probe
> > deferral) as the tree-wide helper drops a reference to its first
> > argument (i.e. the parent device node).
> > 
> > While at it, also fix the related phy-node reference leak.
> > 
> > Fixes: f5e4edb8c888 ("power: twl4030_charger: find associated phy by more reliable means.")
> > Cc: stable <stable@vger.kernel.org>     # 4.2
> > Cc: NeilBrown <neilb@suse.de>
> > Cc: Felipe Balbi <balbi@ti.com>
> > Cc: Sebastian Reichel <sre@kernel.org>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> 
> Reviewed-by: Sebastian Reichel <sre@kernel.org>

Thanks for reviewing.

Johan
