From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/1] gpio-rcar: Add DT support
Date: Sat, 15 Jun 2013 13:31:08 +0200
Message-ID: <2295525.muus9MNBiz@avalon>
References: <1371106826-25313-1-git-send-email-horms+renesas@verge.net.au> <1371106826-25313-2-git-send-email-horms+renesas@verge.net.au> <20130615004751.GM18124@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20130615004751.GM18124@quad.lixom.net>
Sender: linux-sh-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Simon Horman <horms+renesas@verge.net.au>, Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, devicetree-discuss@lists.ozlabs.org, linus.walleij@linaro.org, grant.likely@secretlab.ca, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

Hi Olof,

On Friday 14 June 2013 17:47:51 Olof Johansson wrote:
> On Thu, Jun 13, 2013 at 04:00:26PM +0900, Simon Horman wrote:
> > From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > Add DT bindings for the gpio-rcar driver and read the device
> > configuration from the DT node at probe time if available.
> > 
> > Cc: devicetree-discuss@lists.ozlabs.org
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Hi,
> 
> I don't see this cc/acked by Linus or Grant/Rob.

The patch has been acked by Linus, but it seems the ack got lost somewhere.

https://patchwork.kernel.org/patch/2596901/

> However, the binding looks very vanilla to me, so I'll merge it anyway.

Thank you.

-- 
Regards,

Laurent Pinchart

