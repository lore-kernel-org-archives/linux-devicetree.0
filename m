From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [PATCH v3] uio/pdrv_genirq: Add OF support
Date: Mon, 18 Apr 2011 19:35:13 +0900
Message-ID: <20110418103513.GA27864@linux-sh.org>
References: <1303116654-5042-1-git-send-email-monstr@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1303116654-5042-1-git-send-email-monstr@monstr.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <monstr@monstr.eu>
Cc: devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, john.williams@petalogix.com, linux-kernel@vger.kernel.org, hjk@hansjkoch.de, w.sang@pengutronix.de, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

On Mon, Apr 18, 2011 at 10:50:54AM +0200, Michal Simek wrote:
> Adding OF binding to genirq.
> Version string is setup to the "devicetree".
> 
> Compatible string is not setup for now but you can add your
> custom compatible string to uio_of_genirq_match structure.
> 
> For example with "uio" compatible string:
> static const struct of_device_id __devinitconst uio_of_genirq_match[] = {
> 	{ .compatible = "uio", },
> 	{ /* empty for now */ },
> };
> 
> Signed-off-by: Michal Simek <monstr@monstr.eu>
> 
Perhaps a silly question, but how are you planning on differentiating
between uio_pdrv and uio_pdrv_genirq binding if someone has both enabled?

uio_pdrv obviously doesn't have OF bindings at the moment, but it seems
like you could easily parse the memory ranges in addition to the IRQ and
come up with a generic binding that would work for both.

We also have a shiny new Documentation/devicetree these days, so it would
be nice to see the binding documented at the same time.
