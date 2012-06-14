From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v3 0/4] DT clock bindings
Date: Thu, 14 Jun 2012 16:49:06 +0800
Message-ID: <20120614084904.GF31565@S2101-09.ap.freescale.net>
References: <1339512111-11172-1-git-send-email-robherring2@gmail.com>
 <20120612154735.GB19410@gmail.com>
 <4FD76CF6.8090801@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4FD76CF6.8090801@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Mike Turquette <mturquette@ti.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, mturquette@linaro.org, s.hauer@pengutronix.de, sboyd@codeaurora.org, Grant Likely <grant.likely@secretlab.ca>, skannan@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 12, 2012 at 11:23:18AM -0500, Rob Herring wrote:
> Right. This is why I have reposted and copied those whom commented on my
> pull request. I think at least some of Saravana's concerns boiled down
> to not requiring using DT clock bindings and not requiring driver
> changes to move to DT bindings. Both of these are met with this series.
> A platform can still use clkdev tables for binding clocks to devices and
> does not have to use DT for clocks. Drivers generally should not require
> any changes that I'm aware of, but if there are any concrete examples
> I'd like to know.
> 
> Yes, I think this should go thru you.
> 
I still have a little doubt about how this binding will best work for
imx clock.  I'm trying to cook a RFC patch discussing.

-- 
Regards,
Shawn
