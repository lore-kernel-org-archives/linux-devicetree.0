From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 0/1] gpio-rcar: Add DT support
Date: Fri, 14 Jun 2013 17:47:51 -0700
Message-ID: <20130615004751.GM18124@quad.lixom.net>
References: <1371106826-25313-1-git-send-email-horms+renesas@verge.net.au>
 <1371106826-25313-2-git-send-email-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1371106826-25313-2-git-send-email-horms+renesas@verge.net.au>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, devicetree-discuss@lists.ozlabs.org, linus.walleij@linaro.org, grant.likely@secretlab.ca, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On Thu, Jun 13, 2013 at 04:00:26PM +0900, Simon Horman wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Add DT bindings for the gpio-rcar driver and read the device
> configuration from the DT node at probe time if available.
> 
> Cc: devicetree-discuss@lists.ozlabs.org
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Hi,

I don't see this cc/acked by Linus or Grant/Rob. However, the binding
looks very vanilla to me, so I'll merge it anyway.


-Olof
