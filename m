From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 5/5] MAINTAINERS: add myself as maintainer for QorIQ
 PTP clock driver
Date: Mon, 28 May 2018 23:06:31 -0400 (EDT)
Message-ID: <20180528.230631.1400838711386498433.davem@davemloft.net>
References: <20180525044038.37756-1-yangbo.lu@nxp.com>
        <20180525044038.37756-5-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180525044038.37756-5-yangbo.lu@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: yangbo.lu@nxp.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, richardcochran@gmail.com, claudiu.manoil@nxp.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

From: Yangbo Lu <yangbo.lu@nxp.com>
Date: Fri, 25 May 2018 12:40:38 +0800

> Added myself as maintainer for QorIQ PTP clock driver.
> Since gianfar_ptp.c was renamed to ptp_qoriq.c, let's
> also maintain it under QorIQ PTP clock driver.
> 
> Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>

Because of the dependency on the staging tree changes, this
doesn't apply cleanly to net-next.

You'll have to figure out how you want to sort this out.
