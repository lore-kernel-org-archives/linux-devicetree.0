From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 2/2] [v2] netdev/phy: skip disabled mdio-mux nodes
Date: Mon, 20 Aug 2012 02:16:32 -0700 (PDT)
Message-ID: <20120820.021632.1556748894277512336.davem@davemloft.net>
References: <1344986424-14360-1-git-send-email-timur@freescale.com>
	<1344986424-14360-2-git-send-email-timur@freescale.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1344986424-14360-2-git-send-email-timur@freescale.com>
Sender: netdev-owner@vger.kernel.org
To: timur@freescale.com
Cc: grant.likely@secretlab.ca, david.daney@cavium.com, netdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Timur Tabi <timur@freescale.com>
Date: Tue, 14 Aug 2012 18:20:24 -0500

> The mdio-mux driver scans all child mdio nodes, without regard to whether
> the node is actually used.  Some device trees include all possible
> mdio-mux nodes and rely on the boot loader to disable those that are not
> present, based on some run-time configuration.  Those nodes need to be
> skipped.
> 
> Signed-off-by: Timur Tabi <timur@freescale.com>

Applied.
