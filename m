From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] atm: Convert to using %pOFn instead of device_node.name
Date: Sat, 17 Nov 2018 21:52:34 -0800 (PST)
Message-ID: <20181117.215234.145088066052963971.davem@davemloft.net>
References: <20181116220540.17222-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116220540.17222-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org
Cc: 3chas3@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh@kernel.org>
Date: Fri, 16 Nov 2018 16:05:37 -0600

> In preparation to remove the node name pointer from struct device_node,
> convert printf users to use the %pOFn format specifier.
> 
> Cc: Chas Williams <3chas3@gmail.com>
> Cc: linux-atm-general@lists.sourceforge.net
> Cc: netdev@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to net-next.
