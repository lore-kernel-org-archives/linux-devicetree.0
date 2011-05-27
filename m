From: Chris Ball <cjb@laptop.org>
Subject: Re: [PATCH v3 0/4] Consolidate sdhci pltfm & OF drivers and get them self registered
Date: Fri, 27 May 2011 12:06:18 -0400
Message-ID: <m3pqn4ruv9.fsf@pullcord.laptop.org>
References: <1306321314-2493-1-git-send-email-shawn.guo@linaro.org>
	<20110527072647.GE31953@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <20110527072647.GE31953@ponder.secretlab.ca> (Grant Likely's
	message of "Fri, 27 May 2011 01:26:47 -0600")
Sender: linux-mmc-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Shawn Guo <shawn.guo@linaro.org>, linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, Olof Johansson <olof@lixom.net>, Saeed Bishara <saeed@marvell.com>, Mike Rapoport <mike@compulab.co.il>, Anton Vorontsov <cbouatmailru@gmail.com>, Xiaobo Xie <X.Xie@freescale.com>, Albert Herranz <albert_herranz@yahoo.es>, Arnd Bergmann <arnd@arndb.de>, Wolfram Sang <w.sang@pengutronix.de>, kernel@pengutronix.de, sameo@linux.intel.com, patches@linaro.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Fri, May 27 2011, Grant Likely wrote:
> Any chance we can get this series into $NEXT_KERNEL?

I think I'd rather not in this case, hope that's okay.  It hasn't seen
testing in linux-next yet, there's a reasonable chance of it breaking
sdhci-pltfm users in subtle ways -- we haven't had much testing from
the individual -pltfm driver maintainers yet -- and the mmc merge was
(relatively) huge already this cycle.

I'll certainly push it to linux-next as soon as -rc1 is released,
though.  Sound okay?

Thanks,

- Chris.
-- 
Chris Ball   <cjb@laptop.org>   <http://printf.net/>
One Laptop Per Child
