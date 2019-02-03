From: David Miller <davem@davemloft.net>
Subject: Re: [v2, 0/9] Add ENETC PTP clock driver
Date: Sun, 03 Feb 2019 12:11:44 -0800 (PST)
Message-ID: <20190203.121144.623666032377925349.davem@davemloft.net>
References: <20190202025707.10794-1-yangbo.lu@nxp.com>
        <20190203.113921.1847323007238920901.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190203.113921.1847323007238920901.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: yangbo.lu@nxp.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, richardcochran@gmail.com, robh+dt@kernel.org, claudiu.manoil@nxp.com
List-Id: devicetree@vger.kernel.org

From: David Miller <davem@davemloft.net>
Date: Sun, 03 Feb 2019 11:39:21 -0800 (PST)

> From: Yangbo Lu <yangbo.lu@nxp.com>
> Date: Sat,  2 Feb 2019 10:56:58 +0800
> 
>> There is same QorIQ 1588 timer IP block on the new ENETC Ethernet
>> controller with eTSEC/DPAA Ethernet controllers. However it's
>> different endianness (little-endian) and using PCI driver.
>> 
>> To support ENETC PTP driver, ptp_qoriq driver needed to be
>> reworked to make functions global for reusing, to add little-
>> endian support, to add ENETC memory map support, and to add
>> ENETC dependency for ptp_qoriq driver.
>> 
>> In addition, although ENETC PTP driver is a PCI driver, the dts
>> node still could be used. Currently the ls1028a dtsi which is
>> the only platform by now using ENETC is not complete, so there
>> is still dependency for ENETC PTP node upstreaming. This will
>> be done in the near future. The hardware timestamping support
>> for ENETC is done but needs to be reworked with new method in
>> internal git tree, and will be sent out soon.
> 
> Series applied.

Once AGAIN, I had to revert:

[davem@localhost net-next]$ make -s -j8
ERROR: "ptp_qoriq_remove_debugfs" [drivers/net/ethernet/freescale/enetc/fsl-enetc-ptp.ko] undefined!
make[1]: *** [scripts/Makefile.modpost:92: __modpost] Error 1
make: *** [Makefile:1262: modules] Error 2

Please do an allmodconfig build and don't resubmit this until it all
passes.

Thank you.
