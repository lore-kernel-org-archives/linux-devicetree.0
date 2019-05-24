From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v2 0/3] net: phy: add interface mode
 PHY_INTERFACE_MODE_USXGMII
Date: Fri, 24 May 2019 13:39:48 -0700 (PDT)
Message-ID: <20190524.133948.727397431564765766.davem@davemloft.net>
References: <9d284f4d-93ee-fb27-e386-80825f92adc8@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <9d284f4d-93ee-fb27-e386-80825f92adc8@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: hkallweit1@gmail.com
Cc: madalin.bucur@nxp.com, shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Heiner Kallweit <hkallweit1@gmail.com>
Date: Thu, 23 May 2019 20:06:10 +0200

> Add support for interface mode USXGMII.
> 
> On Freescale boards LS1043A and LS1046A a warning may pop up now
> because mode xgmii should be changed to usxgmii (as the used
> Aquantia PHY doesn't support XGMII).

Series applied.
