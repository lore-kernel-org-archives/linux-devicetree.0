From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 3/4] ARM: dts: imx28-tx28: fix interrupt flags and use
 interrupts-extended property
Date: Mon, 23 Oct 2017 08:20:28 +0800
Message-ID: <20171023002026.GA8700@dragon>
References: <1507719939-27250-1-git-send-email-LW@KARO-electronics.de>
 <1507719939-27250-4-git-send-email-LW@KARO-electronics.de>
 <20171016071726.gyzvalxzk4o3jsuz@pengutronix.de>
 <20171016105632.709e653c@karo-electronics.de>
 <20171018021331.GC18810@dragon>
 <20171018084059.022d8116@karo-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171018084059.022d8116@karo-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 18, 2017 at 08:40:59AM +0200, Lothar Waßmann wrote:
> > So should I drop all interrupts-extended patches from you?
> >
> Yes, please. Since this patch, and the corresponding patch for tx53
> also fixed the interrupt flags, I will send new patches to only fix
> the interrupt flags.

Okay, the following two got dropped from imx/dt branch.

ARM: dts: imx28-tx28: fix interrupt flags and use interrupts-extended property
ARM: dts: imx53-tx53: fix interrupt flags and use interrupts-extended property

Shawn
