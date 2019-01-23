From: David Miller <davem@davemloft.net>
Subject: Re: [v3, 0/6] External trigger stamp fifo support for ptp_qoriq
Date: Tue, 22 Jan 2019 20:23:47 -0800 (PST)
Message-ID: <20190122.202347.1376339753573443085.davem@davemloft.net>
References: <20190121104143.46782-1-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190121104143.46782-1-yangbo.lu@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: yangbo.lu@nxp.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, richardcochran@gmail.com, robh+dt@kernel.org, shawnguo@kernel.org
List-Id: devicetree@vger.kernel.org

From: Yangbo Lu <yangbo.lu@nxp.com>
Date: Mon, 21 Jan 2019 18:41:37 +0800

> This patch-set is to add external trigger stamp fifo support by a new
> binding "fsl,extts-fifo", and to add fiper pulse loopback support which
> is very useful for validating trigger without external hardware.
> Also fixed issues in interrupt enabling/handling.
> 
> "fsl,extts-fifo" is required to be added into 1588 timer dts node whose
> hardware supports it. The work will be done for some QorIQ platforms dts in
> the near future.

Series applied to net-next.
