From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 1/6] drivers: bus: add a new driver for WEIM
Date: Thu, 23 May 2013 15:09:57 +0200
Message-ID: <201305231509.57651.arnd@arndb.de>
References: <1369296978-7669-1-git-send-email-b32955@freescale.com>
 <201305231153.38111.arnd@arndb.de> <20130523115505.GG32299@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130523115505.GG32299@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, Huang Shijie <b32955@freescale.com>, grant.likely@linaro.org, shawn.guo@linaro.org, Alison_Chaiken@mentor.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thursday 23 May 2013, Sascha Hauer wrote:
> > > >> +static int weim_remove(struct platform_device *pdev)
> > > >> +{
> > > >> +        struct imx_weim *weim = platform_get_drvdata(pdev);
> > > >> +
> > > >> +        clk_disable_unprepare(weim->clk);
> > > > Once again: Is this clock needed for the child devices? If yes, you
> > > > can't disable it here and leave the child devices registered.
> > > >
> > 
> > But weim_remove will not be called as long as there are children
> > registered, right?
> 
> But then weim_remove would never be called since nobody unregisters the
> children, right?
> 

Ah, right. That is actually another problem: if the probe() function
creates the child devices, the remove() function should tear them down
again. If we do that, we can ensure that the clock is only turned
off after the last child is gone.

OTOH, I agree that it would be nicer if the clk could remain turned
off as long as no children are active. Can we do a clk_disable()
after setting up the timings for the children and then expect those
to actually start up the clk again when they need it?

Or to take things further: would it make sense to represent WEIM
itself as a clock driver and perform the settings for each child
only when it sets up its own clk?

I guess it would also make sense to use of_platform_populate() instead
of of_platform_device_create() when creating the children, so we actually
create the entire hierarchy in case of the children itself is a
"simple-bus".

	Arnd
