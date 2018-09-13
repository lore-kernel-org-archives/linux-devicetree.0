From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v3 net-next 0/6] Add support for Lantiq / Intel vrx200
 network
Date: Thu, 13 Sep 2018 08:15:02 -0700 (PDT)
Message-ID: <20180913.081502.621496165436800090.davem@davemloft.net>
References: <20180909201647.32727-1-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180909201647.32727-1-hauke@hauke-m.de>
Sender: netdev-owner@vger.kernel.org
To: hauke@hauke-m.de
Cc: netdev@vger.kernel.org, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Hauke Mehrtens <hauke@hauke-m.de>
Date: Sun,  9 Sep 2018 22:16:41 +0200

> This adds basic support for the GSWIP (Gigabit Switch) found in the
> VRX200 SoC.
> There are different versions of this IP core used in different SoCs, but
> this driver was currently only tested on the VRX200 SoC line, for other
> SoCs this driver probably need some adoptions to work.
> 
> I also plan to add Layer 2 offloading to the DSA driver and later also
> layer 3 offloading which is supported by the PPE HW block.
> 
> All these patches should go through the net-next tree.
> 
> This depends on the patch "MIPS: lantiq: dma: add dev pointer" which 
> should go into 4.19.

Series applied to net-next, thanks.
