From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 1/2] net: stmmac: implement support for passive mode
 converters via dt
Date: Wed, 11 Sep 2019 16:28:01 +0200 (CEST)
Message-ID: <20190911.162801.1734673602480231321.davem@davemloft.net>
References: <20190906130256.10321-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190906130256.10321-1-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandru.ardelean@analog.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, peppe.cavallaro@st.com, alexandre.torgue@st.com
List-Id: devicetree@vger.kernel.org

From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Date: Fri, 6 Sep 2019 16:02:55 +0300

> In-between the MAC & PHY there can be a mode converter, which converts one
> mode to another (e.g. GMII-to-RGMII).
> 
> The converter, can be passive (i.e. no driver or OS/SW information
> required), so the MAC & PHY need to be configured differently.
> 
> For the `stmmac` driver, this is implemented via a `mac-mode` property in
> the device-tree, which configures the MAC into a certain mode, and for the
> PHY a `phy_interface` field will hold the mode of the PHY. The mode of the
> PHY will be passed to the PHY and from there-on it work in a different
> mode. If unspecified, the default `phy-mode` will be used for both.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Applied to net-next.
