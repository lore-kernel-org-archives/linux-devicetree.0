Return-Path: <SRS0=Z6b/=FS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:43092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750990AbeBXI76 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 24 Feb 2018 03:59:58 -0500
Date: Sat, 24 Feb 2018 16:59:47 +0800
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6dl: Include correct dtsi file for Engicam
 i.CoreM6 DualLite/Solo RQS
Message-ID: <20180224085946.GO3217@dragon>
References: <1519130288-12666-1-git-send-email-mayhs11saini@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519130288-12666-1-git-send-email-mayhs11saini@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: shyam saini <mayhs11saini@gmail.com>
Cc: kernel@pengutronix.de, fabio.estevam@nxp.com, devicetree@vger.kernel.org, michael@amarulasolutions.com, jagan@amarulasolutions.com, Shyam Saini <shyam@amarulasolutions.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Feb 20, 2018 at 06:08:08PM +0530, shyam saini wrote:
> From: Shyam Saini <shyam@amarulasolutions.com>
> 
> This patch fixes the wrongly included dtsi file which
> was breaking mainline support for Engicam i.CoreM6 DualLite/Solo RQS.
> 
> As per the board name, the correct file should be imx6dl.dtsi instead
> of imx6q.dtsi
> 
> Reported-by: Michael Trimarchi <michael@amarulasolutions.com>
> Suggested-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Shyam Saini <shyam@amarulasolutions.com>

Applied as a fix with the line below appended.

Fixes: 7a9caba55a61 ("ARM: dts: imx6dl: Add Engicam i.CoreM6 DualLite/Solo RQS initial support")

Shawn
