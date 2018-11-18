From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: fsl: Use device_type helpers to access the node
 type
Date: Sat, 17 Nov 2018 21:53:15 -0800 (PST)
Message-ID: <20181117.215315.876000294146233371.davem@davemloft.net>
References: <20181116221104.23024-7-robh@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116221104.23024-7-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh@kernel.org>
Date: Fri, 16 Nov 2018 16:11:03 -0600

> Remove directly accessing device_node.type pointer and use the accessors
> instead. This will eventually allow removing the type pointer.
> 
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: netdev@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to net-next.
