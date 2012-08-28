From: Dong Aisheng <b29396@freescale.com>
Subject: Re: [PATCH v2 5/7] ARM: imx6q: convert to use syscon to access
 anatop registers
Date: Tue, 28 Aug 2012 13:33:37 +0800
Message-ID: <20120828053336.GF5822@shlinux2.ap.freescale.net>
References: <1346052285-4344-1-git-send-email-b29396@freescale.com>
 <1346052285-4344-6-git-send-email-b29396@freescale.com>
 <20120828032309.GW4011@b20223-02.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120828032309.GW4011@b20223-02.ap.freescale.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhao Richard-B20223 <B20223@freescale.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linus.walleij@stericsson.com" <linus.walleij@stericsson.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "lrg@ti.com" <lrg@ti.com>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 28, 2012 at 11:23:10AM +0800, Zhao Richard-B20223 wrote:
...
> >  	np = of_find_compatible_node(NULL, NULL, "fsl,imx6q-anatop");
> np unused.

Correct.
Will drop it.

Regards
Dong Aisheng
