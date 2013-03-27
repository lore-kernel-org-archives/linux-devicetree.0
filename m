From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v9 RESEND 0/4] Add generic driver for on-chip SRAM
Date: Wed, 27 Mar 2013 20:00:18 +0800
Message-ID: <20130327120017.GA2674@S2101-09.ap.freescale.net>
References: <1363776767-2635-1-git-send-email-p.zabel@pengutronix.de>
 <1364373214.5442.1.camel@pizza.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1364373214.5442.1.camel@pizza.hi.pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Huang Shijie <shijie8@gmail.com>, Dong Aisheng <dong.aisheng@linaro.org>, Matt Porter <mporter@ti.com>, Fabio Estevam <fabio.estevam@freescale.com>, Javier Martin <javier.martin@vista-silicon.com>, kernel@pengutronix.de, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 27, 2013 at 09:33:34AM +0100, Philipp Zabel wrote:
> Am Mittwoch, den 20.03.2013, 11:52 +0100 schrieb Philipp Zabel:
> > Hi, last time I posted was a bit close to the merge window, so I'm
> > reposting now. Greg, Arnd, could you take the first two patches?
> 
> Ping,
> 
> can I do anything to help move this along?

You haven't indicated how the series should be merged and by whom.  I
think we should have the first two patches get in through either
Andrew's tree or Greg's tree, since Andrew is handling genalloc and Greg
is handling drivers/misc.

Greg, can you please give your ACK on the second patch to have the first
two go via Andrew's tree?  Otherwise, we can try to ask for Andrew's
ACK on the first patch to have them go through yours.  Please tell.

Shawn
