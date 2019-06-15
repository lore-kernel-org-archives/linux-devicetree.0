From: David Miller <davem@davemloft.net>
Subject: Re: [v2, 0/6] Reuse ptp_qoriq driver for dpaa2-ptp
Date: Sat, 15 Jun 2019 13:43:21 -0700 (PDT)
Message-ID: <20190615.134321.740066323733871726.davem@davemloft.net>
References: <20190614104055.43998-1-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614104055.43998-1-yangbo.lu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yangbo.lu@nxp.com
Cc: netdev@vger.kernel.org, richardcochran@gmail.com, robh+dt@kernel.org, shawnguo@kernel.org, andrew@lunn.ch, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Yangbo Lu <yangbo.lu@nxp.com>
Date: Fri, 14 Jun 2019 18:40:49 +0800

> Although dpaa2-ptp.c driver is a fsl_mc_driver which
> is using MC APIs for register accessing, it's same IP
> block with eTSEC/DPAA/ENETC 1588 timer.
> This patch-set is to convert to reuse ptp_qoriq driver by
> using register ioremap and dropping related MC APIs.
> However the interrupts could only be handled by MC which
> fires MSIs to ARM cores. So the interrupt enabling and
> handling still rely on MC APIs. MC APIs for interrupt
> and PPS event support are also added by this patch-set.
> 
> ---
> Changes for v2:
> 	- Allowed to compile with COMPILE_TEST.

Series applied, thanks.
