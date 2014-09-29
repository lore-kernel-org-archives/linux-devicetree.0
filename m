From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH RESEND v6 0/7] DT doc: net: cpsw mac-address is optional
Date: Mon, 29 Sep 2014 00:22:40 -0400 (EDT)
Message-ID: <20140929.002240.751684227493205912.davem@davemloft.net>
References: <1411923561-31524-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1411923561-31524-1-git-send-email-mpa@pengutronix.de>
Sender: linux-omap-owner@vger.kernel.org
To: mpa@pengutronix.de
Cc: bcousson@baylibre.com, tony@atomide.com, wsa@the-dreams.de, rostedt@goodmis.org, mugunthanvnm@ti.com, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

From: Markus Pargmann <mpa@pengutronix.de>
Date: Sun, 28 Sep 2014 18:59:14 +0200

> This is a resend of v6 of this series. I added the Acked-by of Tony Lindgren
> for patch 5/7. There are no other changes.
> 
> This series adds support to the cpsw driver to read the MACIDs of the am335x
> chip and use them as fallback. These addresses are only used if there are no
> mac addresses in the devicetree, for example set by a bootloader.

Networking changes not CC:'d to netdev will be completely ignored
by me.

Thank you.
