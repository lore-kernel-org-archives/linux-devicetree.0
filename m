From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net] of: mdio: Fix a signedness bug in
 of_phy_get_and_connect()
Date: Fri, 27 Sep 2019 10:20:14 +0200 (CEST)
Message-ID: <20190927.102014.1540733849871544653.davem@davemloft.net>
References: <20190925110100.GL3264@mwanda>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190925110100.GL3264@mwanda>
Sender: linux-kernel-owner@vger.kernel.org
To: dan.carpenter@oracle.com
Cc: andrew@lunn.ch, lidongpo@hisilicon.com, f.fainelli@gmail.com, hkallweit1@gmail.com, robh+dt@kernel.org, frowand.list@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2019 14:01:00 +0300

> The "iface" variable is an enum and in this context GCC treats it as
> an unsigned int so the error handling is never triggered.
> 
> Fixes: b78624125304 ("of_mdio: Abstract a general interface for phy connect")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
