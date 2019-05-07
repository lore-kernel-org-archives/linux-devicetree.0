From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net] dt-bindings: net: Fix a typo in the phy-mode list
 for ethernet bindings
Date: Tue, 07 May 2019 12:30:42 -0700 (PDT)
Message-ID: <20190507.123042.589323077170977597.davem@davemloft.net>
References: <20190507153555.18545-1-maxime.chevallier@bootlin.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190507153555.18545-1-maxime.chevallier@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.chevallier@bootlin.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, antoine.tenart@bootlin.com, thomas.petazzoni@bootlin.com, gregory.clement@bootlin.com
List-Id: devicetree@vger.kernel.org

From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Tue,  7 May 2019 17:35:55 +0200

> The phy_mode "2000base-x" is actually supposed to be "1000base-x", even
> though the commit title of the original patch says otherwise.
> 
> Fixes: 55601a880690 ("net: phy: Add 2000base-x, 2500base-x and rxaui modes")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Applied.
