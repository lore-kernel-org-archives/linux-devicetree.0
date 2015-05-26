From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH 1/5] soc: mediatek: Add infracfg misc driver support
Date: Tue, 26 May 2015 16:12:06 -0700
Message-ID: <7hfv6jorw9.fsf@deeprootsystems.com>
References: <1431372206-1237-1-git-send-email-s.hauer@pengutronix.de>
	<1431372206-1237-2-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431372206-1237-2-git-send-email-s.hauer@pengutronix.de> (Sascha
	Hauer's message of "Mon, 11 May 2015 21:23:22 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, kernel@pengutronix.de, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: devicetree@vger.kernel.org

Sascha Hauer <s.hauer@pengutronix.de> writes:

> This adds support for some miscellaneous bits of the infracfg controller.
> The mtk_infracfg_set/clear_bus_protection functions are necessary for
> the scpsys power domain driver to handle the bus protection bits which
> are contained in the infacfg register space.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

IMO, this feature still needs more documentation.  From an earlier
exchange with James Liao, he was able to get some more details from the
HW designer[1] which I think belong in comments somewhere in this
driver.

Kevin
 
[1] http://lists.infradead.org/pipermail/linux-mediatek/2015-March/000142.html
