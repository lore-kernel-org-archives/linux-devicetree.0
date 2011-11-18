From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: add calxeda xgmac ethernet driver
Date: Fri, 18 Nov 2011 14:54:12 -0500 (EST)
Message-ID: <20111118.145412.1098612279209409802.davem@davemloft.net>
References: <1321411611-28839-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1321411611-28839-1-git-send-email-robherring2@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: robherring2@gmail.com
Cc: netdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, joe@perches.com, saeed.bishara@gmail.com, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robherring2@gmail.com>
Date: Tue, 15 Nov 2011 20:46:51 -0600

> From: Rob Herring <rob.herring@calxeda.com>
> 
> Add support for the XGMAC 10Gb ethernet device in the Calxeda Highbank
> SOC.
> 
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>

Doesn't build, because you reference SK_8K which is a define not
available on all platforms.  Only architectures which make use of
asm-generic/sizes.h will be able to see that definition.
