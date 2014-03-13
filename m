From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v6] sh_eth: update OF PHY registeration
Date: Thu, 13 Mar 2014 15:48:04 -0400 (EDT)
Message-ID: <20140313.154804.55095019909186981.davem@davemloft.net>
References: <1394646460-18170-1-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1394646460-18170-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: netdev-owner@vger.kernel.org
To: ben.dooks@codethink.co.uk
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, magnus.damm@opensource.se, sergei.shtylyov@cogentembedded.com, horms+renesas@verge.net.au, linux-kernel@lists.codethink.co.uk
List-Id: devicetree@vger.kernel.org

From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Wed, 12 Mar 2014 17:47:40 +0000

> If the sh_eth device is registered using OF, then the driver
> should call of_mdiobus_register() to register the PHYs described
> in the devicetree and then use of_phy_connect() to connect the
> PHYs to the device.
> 
> This ensures that any PHYs registered in the device tree are
> appropriately connected to the parent devices nodes so that
> the PHY drivers can access their OF properties.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Applied to net-next, thank you.
