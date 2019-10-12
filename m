From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 0/3] net: ftgmac100: Ungate RCLK for RMII on ASPEED
 MACs
Date: Fri, 11 Oct 2019 20:38:12 -0700 (PDT)
Message-ID: <20191011.203812.1828730130029996774.davem@davemloft.net>
References: <20191010020756.4198-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191010020756.4198-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: andrew@aj.id.au
Cc: netdev@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, benh@kernel.crashing.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Andrew Jeffery <andrew@aj.id.au>
Date: Thu, 10 Oct 2019 12:37:53 +1030

> This series slightly extends the devicetree binding and driver for the
> FTGMAC100 to describe an optional RMII RCLK gate in the clocks property.
> Currently it's necessary for the kernel to ungate RCLK on the AST2600 in NCSI
> configurations as u-boot does not yet support NCSI (which uses the
> R(educed)MII).
> 
> v2:
> * Clear up Reduced vs Reversed MII in the cover letter
> * Mitigate anxiety in the commit message for 1/3 
> * Clarify that AST2500 is also affected in the clocks property description in
>   2/3
> * Rework the error paths and update some comments in 3/3
> 
> v1 can be found here: https://lore.kernel.org/netdev/20191008115143.14149-1-andrew@aj.id.au/

Series applied to net-next, thank you.
