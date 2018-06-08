From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [v3, 00/10] Support DPAA PTP clock and timestamping
Date: Thu, 7 Jun 2018 21:27:06 -0700
Message-ID: <20180608042706.7gfg5p6574ntc2lq@localhost>
References: <20180607092050.46128-1-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180607092050.46128-1-yangbo.lu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangbo Lu <yangbo.lu@nxp.com>
Cc: netdev@vger.kernel.org, madalin.bucur@nxp.com, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 07, 2018 at 05:20:40PM +0800, Yangbo Lu wrote:
> This patchset is to support DPAA FMAN PTP clock and HW timestamping.
> It had been verified on both ARM platform and PPC platform.
> - The patch #1 to patch #5 are to support DPAA FMAN 1588 timer in
>   ptp_qoriq driver.
> - The patch #6 to patch #10 are to add HW timestamping support in
>   DPAA ethernet driver.

Right now, net-next is closed for new stuff.  You will have to post
the series again after the merge window closes.  You can check the
status here:

    http://vger.kernel.org/~davem/net-next.html

When you do re-post, you can add my:

Acked-by: Richard Cochran <richardcochran@gmail.com>
