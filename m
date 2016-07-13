From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] gpio: document how to order GPIO controllers
Date: Wed, 13 Jul 2016 15:14:12 +0200
Message-ID: <20160713131412.GO6442@localhost>
References: <1467355333-8813-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20160705140546.GA10601@rob-hp-laptop>
 <20160705180447.GP16643@pengutronix.de>
 <CACRpkdbH+KRXbxFdfyAE44fBNctK4cWV+KRLwQBTzSGLvLMEDg@mail.gmail.com>
 <20160706102750.GH23470@localhost>
 <CACRpkdZhx3yTbtuj-ZTP+mtUSr4uxL4bHtu8jVZOoxrUy6=iYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZhx3yTbtuj-ZTP+mtUSr4uxL4bHtu8jVZOoxrUy6=iYw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 06, 2016 at 02:34:39PM +0200, Linus Walleij wrote:
> On Wed, Jul 6, 2016 at 12:27 PM, Johan Hovold <johan@kernel.org> wrote:
> > On Wed, Jul 06, 2016 at 11:34:37AM +0200, Linus Walleij wrote:
> 
> >> I *THINK* the view of the device core maintainers is that udev
> >> and sysfs hierarchies should be used to uniquely identify a certain
> >> device, and that relying on device numbering is too fragile.
> >
> > I thought the whole idea (or at least a large part of) the new
> > user-space interface was to allow lookups by line names precisely in
> > order not to have to rely on gpio numbers, which may not only change
> > between boots, but also between hardware revisions, etc.
> 
> That is true for the individual pins, but not the device names.
> Devices are just names gpiochipN where N is the instance
> number. Topological info on the device can be found in sysfs.
> 
> The discussion here pertaining to the new chardev is just about
> the intuitiveness of the number N, whether it should be
> "whatever" or something predictable.
> 
> For the purpose of picking a certain named GPIO line (see below)
> knowing this number is unnecessary. To that mechanism all gpio
> chips are equal and the instance number does not matter.

My point was that with gpio line names (and possibly topological
information to resolve duplicates), the N number should not matter
anymore.

[ It was also a comment to a comment made earlier in the thread were the
use case was said to be to "control GPIO48 with /sys/class/gpio/gpio48".
And it seems we are in agreement there. ]

If one needs to look up a particular gpiochip based on some hardware
naming convention, why not associate a name with the chip instead of
trying to shoehorn the dynamic gpiochip range in there?

> > What's wrong with naming the pins in DT and use that for lookups?
> 
> That works. It relies on the developers using sane naming conventions
> though. (This problem is prevalent everywhere I guess, a human problem,
> not a technical one.) I made this patch:
> http://marc.info/?l=linux-arm-kernel&m=146672328215354&w=2
> 
> There is a standard document for these boards (96board) specifying
> the names of the GPIO lines to be "GPIO-A" thru "GPIO-L".
> 
> So a user can iterate across the gpiochips (as is done in lsgpio)
> and pick the lines with the right names.
> 
> This works fine, given you have such conventions or equal.
> 
> I.e. the person writing the DTS file naming the lines must not
> be a complete lunatic.

Again, it seems we're on the same page here.

> I can think of scenarios where bad use can make things problematic:
> i.e. name two lines the same thing, albeit on different GPIO chips.
> That is currently allowed, and if that happens, the user must
> use topological information about the gpiochip (from sysfs) to
> uniquely identify the GPIO line.
> 
> I wouldn't recommend that since it is essentially inventing a
> problem for oneself to solve, but I don't know what reasons
> people may have to do something like that. There is no technical
> problem with it.

And this may even be unavoidable with dynamic buses such as USB or
greybus, where you can have multiple devices associating the same name
with a pin. That's fine as long as the user-space interface allows for a
way to distinguish them (e.g. through topological information).

Thanks,
Johan
