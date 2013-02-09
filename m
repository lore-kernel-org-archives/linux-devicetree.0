From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 3.9] Driver for 7-segment displays connected over GPIOs
Date: Sat, 9 Feb 2013 17:28:14 +0100
Message-ID: <20130209162814.GA27235@amd.pavel.ucw.cz>
References: <1357576928-29133-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CACRpkda1+EXuRZacPu2_p9XxL2F1hiy7g74Qb35EArAPkvY8VA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACRpkda1+EXuRZacPu2_p9XxL2F1hiy7g74Qb35EArAPkvY8VA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree-discuss@lists.ozlabs.org, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi!

> <thomas.petazzoni@free-electrons.com> wrote:
> 
> > This patch series implements a simple driver for 7-segment displays
> > connected over GPIOs through a BCD encoder. The userspace interface of
> > the driver is very simple: just a "value" file in the sysfs directory
> > of the device, which can be written to (changes the value shown on the
> > 7-segment display) and read (gives the current value).
> 
> The ARM Integrator AP and CP base boards I have here have
> 7-segment displays as well. But it's not on GPIO but dedicated
> registers, so I could implement these as, e.g. LEDs.
> 
> But with this framework I'd just make a driver that pokes directly
> into the registers.
> 
> However as Russell points out, this needs to be thought through.
> I have a period on my display between the two characters, so
> how do we model that period?

Well, 7 segment display can be used for 0-9 A-F (very readable) and
0-9 a-z if you stretch stuff a bit, as done on TI chronos for
example... Would it make sense to simply display a string? Up to four
letters with up-to 4 '.' space characters...

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
