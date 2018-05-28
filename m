From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH 1/5] ptp: rework gianfar_ptp as QorIQ common PTP driver
Date: Mon, 28 May 2018 07:29:07 -0700
Message-ID: <20180528142907.t5m6j2xh5ecfmtgn@localhost>
References: <20180525044038.37756-1-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180525044038.37756-1-yangbo.lu@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: Yangbo Lu <yangbo.lu@nxp.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, claudiu.manoil@nxp.com, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 25, 2018 at 12:40:34PM +0800, Yangbo Lu wrote:
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

For the series:

Acked-by: Richard Cochran <richardcochran@gmail.com>
