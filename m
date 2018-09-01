From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 net-next 3/7] net: dsa: Add Lantiq / Intel GSWIP tag
 support
Date: Sat, 1 Sep 2018 20:01:27 +0200
Message-ID: <20180901180127.GC6305@lunn.ch>
References: <20180901114535.9070-1-hauke@hauke-m.de>
 <20180901120332.9792-1-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180901120332.9792-1-hauke@hauke-m.de>
Sender: netdev-owner@vger.kernel.org
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: davem@davemloft.net, netdev@vger.kernel.org, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 01, 2018 at 02:03:32PM +0200, Hauke Mehrtens wrote:
> This handles the tag added by the PMAC on the VRX200 SoC line.
> 
> The GSWIP uses internally a GSWIP special tag which is located after the
> Ethernet header. The PMAC which connects the GSWIP to the CPU converts
> this special tag used by the GSWIP into the PMAC special tag which is
> added in front of the Ethernet header.
> 
> This was tested with GSWIP 2.1 found in the VRX200 SoCs, other GSWIP
> versions use slightly different PMAC special tags.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
