From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v2, 0/4] ENETC: support hardware timestamping
Date: Fri, 24 May 2019 13:16:50 -0700 (PDT)
Message-ID: <20190524.131650.1001639096871571503.davem@davemloft.net>
References: <20190523023451.2933-1-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190523023451.2933-1-yangbo.lu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yangbo.lu@nxp.com
Cc: netdev@vger.kernel.org, richardcochran@gmail.com, claudiu.manoil@nxp.com, shawnguo@kernel.org, robh+dt@kernel.org, alexandru.marginean@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: "Y.b. Lu" <yangbo.lu@nxp.com>
Date: Thu, 23 May 2019 02:33:24 +0000

> This patch-set is to support hardware timestamping for ENETC
> and also to add ENETC 1588 timer device tree node for ls1028a.
> 
> Because the ENETC RX BD ring dynamic allocation has not been
> supported and it is too expensive to use extended RX BDs
> if timestamping is not used, a Kconfig option is used to
> enable extended RX BDs in order to support hardware
> timestamping. This option will be removed once RX BD
> ring dynamic allocation is implemented.

Series applied.
