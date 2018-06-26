From: David Miller <davem@davemloft.net>
Subject: Re: [v4, 00/10] Support DPAA PTP clock and timestamping
Date: Tue, 26 Jun 2018 22:18:19 +0900 (KST)
Message-ID: <20180626.221819.2229197444662289895.davem@davemloft.net>
References: <20180625123716.28993-1-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180625123716.28993-1-yangbo.lu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yangbo.lu@nxp.com
Cc: netdev@vger.kernel.org, madalin.bucur@nxp.com, richardcochran@gmail.com, robh+dt@kernel.org, shawnguo@kernel.org, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Yangbo Lu <yangbo.lu@nxp.com>
Date: Mon, 25 Jun 2018 20:37:06 +0800

> This patchset is to support DPAA FMAN PTP clock and HW timestamping.
> It had been verified on both ARM platform and PPC platform.
> - The patch #1 to patch #5 are to support DPAA FMAN 1588 timer in
>   ptp_qoriq driver.
> - The patch #6 to patch #10 are to add HW timestamping support in
>   DPAA ethernet driver.

Series applied to net-next.
