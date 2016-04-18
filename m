From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] of_mdio: make of_mdiobus_register_{device|phy}() *void*
Date: Mon, 18 Apr 2016 00:02:16 -0400 (EDT)
Message-ID: <20160418.000216.88349007433311540.davem@davemloft.net>
References: <1834436.v0N3sgcLOX@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1834436.v0N3sgcLOX@wasted.cogentembedded.com>
Sender: netdev-owner@vger.kernel.org
To: sergei.shtylyov@cogentembedded.com
Cc: grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, netdev@vger.kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sun, 17 Apr 2016 01:05:19 +0300

> The results of of_mdiobus_register_{device|phy}() are never checked, so we
> can make  both these functions *void*...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Applied, thanks Sergei.
