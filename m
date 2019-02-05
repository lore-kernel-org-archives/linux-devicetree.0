From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 0/3] nixge: Fixed-link support
Date: Tue, 05 Feb 2019 10:34:53 -0800 (PST)
Message-ID: <20190205.103453.1670645181373995149.davem@davemloft.net>
References: <20190204173040.5538-1-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204173040.5538-1-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: moritz.fischer@ettus.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alex.williams@ni.com, andrew@lunn.ch, robh+dt@kernel.org, mdf@kernel.org
List-Id: devicetree@vger.kernel.org

From: Moritz Fischer <moritz.fischer@ettus.com>
Date: Mon,  4 Feb 2019 09:30:37 -0800

> From: Moritz Fischer <mdf@kernel.org>
> 
> This series adds fixed-link support to nixge.
> 
> The first patch corrects the binding to correctly reflect
> hardware that does not come with MDIO cores instantiated.
> 
> The second patch adds fixed link support to the driver.
> 
> The third patch updates the binding document with the now
> optional (formerly required) phy-handle property and references
> the fixed-link docs.

Series applied, thank you.
