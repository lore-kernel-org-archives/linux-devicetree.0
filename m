From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] phy: micrel: add of configuration for LED mode
Date: Wed, 26 Feb 2014 17:00:57 -0500 (EST)
Message-ID: <20140226.170057.1058889232520320973.davem@davemloft.net>
References: <1393415280-10227-1-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1393415280-10227-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: netdev-owner@vger.kernel.org
To: ben.dooks@codethink.co.uk
Cc: linux-kernel@lists.codethink.co.uk, devicetree@vger.kernel.org, netdev@vger.kernel.org, f.fainelli@gmail.com
List-Id: devicetree@vger.kernel.org

From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Wed, 26 Feb 2014 11:48:00 +0000

> Add support for the led-mode property for the following PHYs
> which have a single LED mode configuration value.
> 
> KSZ8001 and KSZ8041 which both use register 0x1e bits 15,14 and
> KSZ8021, KSZ8031 and KSZ8051 which use register 0x1f bits 5,4
> to control the LED configuration.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Applied, thanks.
