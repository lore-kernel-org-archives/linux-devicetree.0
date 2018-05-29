From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 1/5] ptp: rework gianfar_ptp as QorIQ common PTP driver
Date: Mon, 28 May 2018 23:05:39 -0400 (EDT)
Message-ID: <20180528.230539.1879875547139231543.davem@davemloft.net>
References: <20180525044038.37756-1-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180525044038.37756-1-yangbo.lu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yangbo.lu@nxp.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, richardcochran@gmail.com, claudiu.manoil@nxp.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

From: Yangbo Lu <yangbo.lu@nxp.com>
Date: Fri, 25 May 2018 12:40:34 +0800

> gianfar_ptp was the PTP clock driver for 1588 timer
> module of Freescale QorIQ eTSEC (Enhanced Three-Speed
> Ethernet Controllers) platforms. Actually QorIQ DPAA
> (Data Path Acceleration Architecture) platforms is
> also using the same 1588 timer module in hardware.
> 
> This patch is to rework gianfar_ptp as QorIQ common
> PTP driver to support both DPAA and eTSEC. Moved
> gianfar_ptp.c to drivers/ptp/, renamed it as
> ptp_qoriq.c, and renamed many variables. There were
> not any function changes.
> 
> Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>

Applied.
