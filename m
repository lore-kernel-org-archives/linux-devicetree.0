From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [net-next PATCH 2/5] soc: ti: K2G: provide APIs to support
 driver probe deferral
Date: Mon, 26 Mar 2018 22:48:02 +0200
Message-ID: <20180326204802.GC5862@lunn.ch>
References: <1522095312-23249-1-git-send-email-m-karicheri2@ti.com>
 <1522095312-23249-3-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1522095312-23249-3-git-send-email-m-karicheri2@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Murali Karicheri <m-karicheri2@ti.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, ssantosh@kernel.org, malat@debian.org, w-kwok2@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, davem@davemloft.net, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 26, 2018 at 04:15:09PM -0400, Murali Karicheri wrote:
> This patch provide APIs to allow client drivers to support
> probe deferral. On K2G SoC, devices can be probed only
> after the ti_sci_pm_domains driver is probed and ready.
> As drivers may get probed at different order, any driver
> that depends on knav dma and qmss drivers, for example
> netcp network driver, needs to defer probe until
> knav devices are probed and ready to service. To do this,
> add an API to query the device ready status from the knav
> dma and qmss devices.

Hi Murali 

Shouldn't you really re-write this to be a dma driver?  You would then
do something like of_dma_request_slave_channel() in the ethernet
driver probe function. That probably correctly returns EPROBE_DEFER.

       Andrew
