From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v2 18/24] i2c: mpc: OF clock lookup for MPC512x
Date: Fri, 19 Jul 2013 10:42:52 +0200
Message-ID: <20130719084252.GP7080@book.gsilab.sittig.org>
References: <1374166855-7280-1-git-send-email-gsi@denx.de>
 <1374178858-8683-4-git-send-email-gsi@denx.de>
 <20130718203324.GB24642@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130718203324.GB24642-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Detlev Zundel <dzu-ynQEQJNshbs@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 18, 2013 at 21:33 +0100, Russell King - ARM Linux wrote:
> 
> On Thu, Jul 18, 2013 at 10:20:52PM +0200, Gerhard Sittig wrote:
> > +	/* enable clock for the I2C peripheral (non fatal) */
> > +	clk = of_clk_get_by_name(node, "per");
> > +	if (!IS_ERR(clk)) {
> > +		clk_prepare_enable(clk);
> > +		clk_put(clk);
> > +	}
> > +
> 
> This kind of hacked up approach to the clk API is exactly the thing I
> really don't like seeing.  I don't know what it is... is the clk API
> somehow difficult to use or what's the problem with doing stuff correctly?
> 
> 1. Get the clock in your probe function.
> 2. Prepare it at the appropriate time.
> 3. Enable it appropriately.  (or if you want to combine 2 and 3, use
>    clk_prepare_enable().)
> 4. Ensure that enables/disables and prepares/unprepares are appropriately
>    balanced.
> 5. 'put' the clock in your remove function.
> 
> Certainly do not get-enable-put a clock.  You're supposed to hold on to
> the clock all the time that you're actually using it.

Russel, thank you for the feedback!  I agree that your outline of
steps to take is simple and should not be a problem to do.

I noticed that I kept looking at the wrong spot in the driver,
hooked up to some setup routine which lacks a counter part.  You
made me re-visit the drivers and find better locations to hook up
to (probe and remove).  Part of my sloppiness with immediate put
after enable was caused by put being a NOP at the moment, and the
assumption that clocks without references but in the enabled
state won't go away.  But I saw your recent message as well about
how clocks shall get reference counted and keep their provider's
module loaded.

I've queued an update to the I2C, ethernet, and PCI drivers,
which addresses your concerns.  I2C and ethernet clock handling
will become correctly balanced, while PCI won't since the
existing driver already lacks a remove() routine.  These changes
will be part of v3 of the series.

Mark, Greg, v2 of the series already addresses the above concerns
for the serial communication with the PSC hardware (UART and
SPI).  See how 01/24 and 02/24 became much more complex than in
v1, yet should result in appropriate clock handling in these
drivers.

In the very minute I wanted to send out v3, I received feedback
on the CAN driver manipulation from Marc.  Apparently it suffers
from the same problem (my blindness to locate the best spot for
resource release), but CAN shall be the last driver in the series
which is not acceptable yet.


> Final point - if you want to make it non-fatal, don't play games like:
> 
> 	clk = clk_get(whatever);
> 	if (IS_ERR(clk))
> 		clk = NULL;
> 
> 	...
> 	if (clk)
> 		clk_prepare(clk);
> 
> Do this instead:
> 
> 	clk = clk_get(whatever);
> 	...
> 
> 	if (!IS_ERR(clk))
> 		clk_prepare(clk);
> etc.

You saw this in the ethernet driver, right?  This "interesting"
style of "normalization to NULL" in the setup path was meant to
simplify the cleanup path, but that point has become obsolete by
now.  Your example doesn't reflect that 'clk' was a more complex
to access member in the driver's private data.

It seems that doing the setup in steps with a local variable, to
only store the reference when all steps were successful, cleans
up the release code paths.

Immediately putting the clock and not having stored the reference
when enable failed is one more instruction before jumping to the
bailout label, but eliminates the pain of tracking get and enable
separately, and needing two labels for disable and put (you
cannot disable a clock that wasn't enabled).

As mentioned, both the I2C driver you responded to as well as the
ethernet driver you reference here got adjusted.  v3 will get
sent when I could address the remaining CAN driver issue.


> (And on this subject, I'm considering whether to make a change to the
> clk API where clk_prepare() and clk_enable() return zero when passed
> an error pointer - this means drivers with optional clocks don't have
> to burden themselves with these kinds of checks.)


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office-ynQEQJNshbs@public.gmane.org
