From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 3/5] net: ethernet: gianfar_ethtool: get phc index
 through drvdata
Date: Mon, 28 May 2018 23:06:00 -0400 (EDT)
Message-ID: <20180528.230600.1937722626242005505.davem@davemloft.net>
References: <20180525044038.37756-1-yangbo.lu@nxp.com>
        <20180525044038.37756-3-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180525044038.37756-3-yangbo.lu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yangbo.lu@nxp.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, richardcochran@gmail.com, claudiu.manoil@nxp.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

From: Yangbo Lu <yangbo.lu@nxp.com>
Date: Fri, 25 May 2018 12:40:36 +0800

> Global variable gfar_phc_index was used to get and store
> phc index through gianfar_ptp driver. However gianfar_ptp
> had been renamed as ptp_qoriq for QorIQ common PTP driver.
> This gfar_phc_index doesn't work any more, and the phc index
> is stored in drvdata now. This patch is to support getting
> phc index through ptp_qoriq drvdata.
> 
> Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>

Applied.
