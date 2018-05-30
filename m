From: David Miller <davem@davemloft.net>
Subject: Re: [v2] MAINTAINERS: add myself as maintainer for QorIQ PTP clock
 driver
Date: Wed, 30 May 2018 13:27:59 -0400 (EDT)
Message-ID: <20180530.132759.1609983459551825219.davem@davemloft.net>
References: <20180529034744.44590-1-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180529034744.44590-1-yangbo.lu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yangbo.lu@nxp.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, richardcochran@gmail.com, claudiu.manoil@nxp.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

From: Yangbo Lu <yangbo.lu@nxp.com>
Date: Tue, 29 May 2018 11:47:44 +0800

> Added myself as maintainer for QorIQ PTP clock driver.
> Since gianfar_ptp.c was renamed to ptp_qoriq.c, let's
> maintain it under QorIQ PTP clock driver.
> 
> Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
> ---
> Changes for v2:
> 	- Dropped dpaa2/rtc part.

Applied to net-next, thanks.
