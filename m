From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v3 1/3] mfd: mc13xxx: add device tree probe support
Date: Tue, 20 Dec 2011 11:25:11 +0000
Message-ID: <20111220112510.GL2866@opensource.wolfsonmicro.com>
References: <1323702958-4831-1-git-send-email-shawn.guo@linaro.org>
 <1323702958-4831-2-git-send-email-shawn.guo@linaro.org>
 <20111220005708.GM2860@opensource.wolfsonmicro.com>
 <20111220020101.GD5683@S2100-06.ap.freescale.net>
 <20111220015931.GX2860@opensource.wolfsonmicro.com>
 <20111220030347.GB2995@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20111220030347.GB2995@S2101-09.ap.freescale.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@freescale.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, devicetree-discuss@lists.ozlabs.org, Liam Girdwood <lrg@ti.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 20, 2011 at 11:03:48AM +0800, Shawn Guo wrote:
> On Tue, Dec 20, 2011 at 01:59:32AM +0000, Mark Brown wrote:

> > You're missing the point - someone reading the documentation needs to be
> > able to figure out what strings they need to use for all the different
> > regulators on the chip are without groveling through the driver code.

...

> > That's *not* something that we should be exposing in the device tree
> > bindings.  This is an implementation detail of the Linux driver which
> > might well change in future.

> Any suggestion on a better binding for mc13892 regulator device?

Well, removing the random extra _s would be a big start (though I'd just
drop the chip name entirely from the name of the regulators since by the
time we're looking at the regulator we've already identified the chip)
and as I keep saying you need to document what the names mean - what are
the possible names and how do they map onto the hardware?
