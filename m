From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 net-next 5/7] net: lantiq: Add Lantiq / Intel VRX200
 Ethernet driver
Date: Sat, 1 Sep 2018 20:12:53 +0200
Message-ID: <20180901181253.GD6305@lunn.ch>
References: <20180901114535.9070-1-hauke@hauke-m.de>
 <20180901120427.9983-1-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180901120427.9983-1-hauke@hauke-m.de>
Sender: netdev-owner@vger.kernel.org
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: davem@davemloft.net, netdev@vger.kernel.org, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> +struct xrx200_priv {
> +	struct net_device_stats stats;

net_device has a stats structure in it. Please use that one.

Otherwise, this looks good.

	Andrew
