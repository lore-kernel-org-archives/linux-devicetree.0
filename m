From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] dt-bindings: net: ravb: Add support for r8a77965 SoC
Date: Mon, 16 Apr 2018 10:17:55 -0400 (EDT)
Message-ID: <20180416.101755.99677892602830691.davem@davemloft.net>
References: <1523886917-14491-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523886917-14491-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jacopo+renesas@jmondi.org
Cc: sergei.shtylyov@cogentembedded.com, robh+dt@kernel.org, mark.rutland@arm.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Date: Mon, 16 Apr 2018 15:55:17 +0200

> Add documentation for r8a77965 compatible string to renesas ravb device
> tree bindings documentation.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> ---
> 
> Renesas R-Car M3-N support has been merged for v4.17.
> Document the missing device tree bindings.

Since this is purely a devicetree update, I'm assuming that it doesn't
go through my networking tree.
