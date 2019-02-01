From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 0/9] Add ENETC PTP clock driver
Date: Fri, 01 Feb 2019 15:17:02 -0800 (PST)
Message-ID: <20190201.151702.1371937989366446994.davem@davemloft.net>
References: <20190131023310.9563-1-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190131023310.9563-1-yangbo.lu@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: yangbo.lu@nxp.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, richardcochran@gmail.com, robh+dt@kernel.org, claudiu.manoil@nxp.com
List-Id: devicetree@vger.kernel.org

From: Yangbo Lu <yangbo.lu@nxp.com>
Date: Thu, 31 Jan 2019 10:33:01 +0800

> There is same QorIQ 1588 timer IP block on the new ENETC Ethernet
> controller with eTSEC/DPAA Ethernet controllers. However it's
> different endianness (little-endian) and using PCI driver.
> 
> To support ENETC PTP driver, ptp_qoriq driver needed to be
> reworked to make functions global for reusing, to add little-
> endian support, to add ENETC memory map support, and to add
> ENETC dependency for ptp_qoriq driver.
> 
> In addition, although ENETC PTP driver is a PCI driver, the dts
> node still could be used. Currently the ls1028a dtsi which is
> the only platform by now using ENETC is not complete, so there
> is still dependency for ENETC PTP node upstreaming. This will
> be done in the near future. The hardware timestamping support
> for ENETC is done but needs to be reworked with new method in
> internal git tree, and will be sent out soon.

Series applied to net-next, thanks.
