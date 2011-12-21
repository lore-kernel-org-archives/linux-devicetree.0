From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v3 1/3] mfd: mc13xxx: add device tree probe support
Date: Wed, 21 Dec 2011 01:37:03 +0000
Message-ID: <20111221013702.GB15398@opensource.wolfsonmicro.com>
References: <20111220005708.GM2860@opensource.wolfsonmicro.com>
 <20111220020101.GD5683@S2100-06.ap.freescale.net>
 <20111220015931.GX2860@opensource.wolfsonmicro.com>
 <20111220030347.GB2995@S2101-09.ap.freescale.net>
 <20111220112510.GL2866@opensource.wolfsonmicro.com>
 <20111220135251.GB5129@S2101-09.ap.freescale.net>
 <20111220143558.GT2866@opensource.wolfsonmicro.com>
 <20111220153101.GD5348@S2101-09.ap.freescale.net>
 <20111220232526.GA6551@opensource.wolfsonmicro.com>
 <20111221012519.GA5983@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20111221012519.GA5983@S2101-09.ap.freescale.net>
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

On Wed, Dec 21, 2011 at 09:25:21AM +0800, Shawn Guo wrote:
> On Tue, Dec 20, 2011 at 11:25:27PM +0000, Mark Brown wrote:

> > It's unique but I feel the disadvantages in terms of legibility of the
> > resulting device trees are substantial - we want humans to be able to
> > read and write device trees, preferrably without having to dig out the
> > datasheet for the part.

> Eh, device tree is all about describing hardware.  I do not understand
> what is wrong with looking at hardware manual when writing dts.

For the same reason we define constants for register names and values
when writing drivers - so humans can make sense of what's in front of
them and to reduce the chance of errors when things are being written.

> > So long as the names are reasonably sensible
> > and can be understood in the case of any lack of clarity we should be
> > OK.

> The problem is even if we have the name defined that way, it has to be
> matched to the name used in mc13892 driver somehow, if we want to use
> name as the key to find the regulator defined in mc13892 driver as
> array mc13892_regulators[].

This doesn't seem like a problem - the most obvious thing would just be
to adjust the strings in the code to correspond to what the device tree
binding says.

> > This is the whole reason why I'm saying that you need to define the
> > names used in the binding - if the names are a defined part of the
> > binding then there's nothing driver specific about them.

> Can you please help me understand how this can be achieved with an
> example?  Taking 'mc13892__sw1' as the example, if I read your comment
> before correctly, 'sw1' is the name that you are suggesting.  How this
> name can be nothing driver specific?  After all, we need to find
> regulator MC13892_SW1 defined in mc13892_regulators[] by matching name
> 'sw1' defined by binding and name 'MC13892_SW1' defined by driver
> somehow, if we want to use name to bind the regulator.

Your binding document would say something like "the regulators are bound
using their names as listed below with their enable bits:

  sw1 - SW1 regulator (register X bit Y)

" so in the binding document it would say what strings map onto which
regulators.  Then any driver implementing that binding would pick the
same strings.
