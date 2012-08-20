From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 1/2] dt: introduce for_each_available_child_of_node,
 of_get_next_available_child
Date: Mon, 20 Aug 2012 02:16:24 -0700 (PDT)
Message-ID: <20120820.021624.1349135602061935195.davem@davemloft.net>
References: <1344986424-14360-1-git-send-email-timur@freescale.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1344986424-14360-1-git-send-email-timur@freescale.com>
Sender: netdev-owner@vger.kernel.org
To: timur@freescale.com
Cc: grant.likely@secretlab.ca, david.daney@cavium.com, netdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Timur Tabi <timur@freescale.com>
Date: Tue, 14 Aug 2012 18:20:23 -0500

> Macro for_each_child_of_node() makes it easy to iterate over all of the
> children for a given device tree node, including those nodes that are
> marked as unavailable (i.e. status = "disabled").
> 
> Introduce for_each_available_child_of_node(), which is like
> for_each_child_of_node(), but it automatically skips unavailable nodes.
> This also requires the introduction of helper function
> of_get_next_available_child(), which returns the next available child
> node.
> 
> Signed-off-by: Timur Tabi <timur@freescale.com>

Applied.
