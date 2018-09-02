From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 net-next 1/7] MIPS: lantiq: dma: add dev pointer
Date: Sun, 2 Sep 2018 03:26:51 +0200
Message-ID: <20180902012651.GB9776@lunn.ch>
References: <20180901114535.9070-1-hauke@hauke-m.de>
 <20180901114535.9070-2-hauke@hauke-m.de>
 <20180901145700.GB6305@lunn.ch>
 <6674a5ca-2a9f-b2cf-6127-2dea5ca24ab0@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6674a5ca-2a9f-b2cf-6127-2dea5ca24ab0@hauke-m.de>
Sender: netdev-owner@vger.kernel.org
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: davem@davemloft.net, netdev@vger.kernel.org, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> Hi Andrew,
> 
> Thanks for the review.
> 
> Yes this should go into 4.19-rcX.
> The "lantiq: Add Lantiq / Intel VRX200 Ethernet driver" patch has a
> compile dependency on this patch. Should I send "MIPS: lantiq: dma: add
> dev pointer" separately or just mark it as 4.19-rcX in this series?

Hi Hauke

Please send it separately. DaveM will merge net in net-next every so
often, at which point your patches which depend on it can be include.
       
       Andrew
