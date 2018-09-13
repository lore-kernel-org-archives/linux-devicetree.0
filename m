From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 0/2] net: qcom/emac: add shared mdio bus support
Date: Thu, 13 Sep 2018 14:24:17 +0200
Message-ID: <20180913122417.GC11702@lunn.ch>
References: <1536829493-10088-1-git-send-email-dongsheng.wang@hxt-semitech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1536829493-10088-1-git-send-email-dongsheng.wang@hxt-semitech.com>
Sender: netdev-owner@vger.kernel.org
To: Wang Dongsheng <dongsheng.wang@hxt-semitech.com>
Cc: timur@kernel.org, davem@davemloft.net, yu.zheng@hxt-semitech.com, netdev@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 13, 2018 at 05:04:51PM +0800, Wang Dongsheng wrote:
> Share the mii_bus for others MAC device because QDF2400 emac
> include MDIO, and the motherboard has more than one PHY connected
> to an MDIO bus.
> 
> Tested: QDF2400 (ACPI), buildin/insmod/rmmod
> 
> Wang Dongsheng (2):
>   dt-bindings: net: qcom: Add binding for shared mdio bus

Hi Wang

Patch #1 did not seem to make it to netdev.

I probably have some comments on the binding...

  Andrew
