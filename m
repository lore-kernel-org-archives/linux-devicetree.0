From: Rich Felker <dalias@libc.org>
Subject: Re: [PATCH RFC PoC 0/2] platform: different approach to early
 platform drivers
Date: Fri, 27 Apr 2018 11:22:12 -0400
Message-ID: <20180427152212.GO3094@brightrain.aerifal.cx>
References: <20180426152920.21569-1-brgl@bgdev.pl>
 <20180426173151.GJ3094@brightrain.aerifal.cx>
 <6d1f9114-f1d1-961f-4f36-74adff059dc3@lechnology.com>
 <CAK8P3a0oCH7zyBs8nQd4p+xLrFwDQiJsaKKCF1m04nyXsZxk=g@mail.gmail.com>
 <CAMpxmJUR+31axmAe2TNq00aUg40bnC=5k=2cVX019Vncr7cRkw@mail.gmail.com>
 <CAK8P3a2xtTLx-VHVWok-b19=o1z5FbTNcaWq7Y_HSdaH6pWnZg@mail.gmail.com>
 <CAMRc=MdomjLCq-bJyktaToH00kNQAuTLgkSFRrY9Jmre8McT3A@mail.gmail.com>
 <CAK8P3a0tMp2QURp-9WuHehqE0b6-BO1wJ38siTdxhxgwCb-ERw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a0tMp2QURp-9WuHehqE0b6-BO1wJ38siTdxhxgwCb-ERw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Jan Kiszka <jan.kiszka@siemens.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Frank Rowand <frowand.list@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Michal Suchanek <msuchanek@suse.de>, DTML <devicetree@vger.kernel.org>, David Lechner <david@lechnology.com>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Arend van Spriel <aspriel@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 27, 2018 at 02:40:34PM +0200, Arnd Bergmann wrote:
> On Fri, Apr 27, 2018 at 1:53 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > 2018-04-27 12:18 GMT+02:00 Arnd Bergmann <arnd@arndb.de>:
> >> On Fri, Apr 27, 2018 at 10:57 AM, Bartosz Golaszewski
> >> <bgolaszewski@baylibre.com> wrote:
> >>> 2018-04-27 9:52 GMT+02:00 Arnd Bergmann <arnd@arndb.de>:
> >>>> On Fri, Apr 27, 2018 at 4:28 AM, David Lechner <david@lechnology.com> wrote:
> >>> My patch tries to address exactly the use cases we're facing - for
> >>> example by providing means to probe devices twice (early and late) and
> >>> to check the state we're at in order for users to be able to just do
> >>> the critical initialization early on and then continue with regular
> >>> stuff later.
> >>
> >> Maybe the problem is reusing the name and some of the code from
> >> an existing functionality that we've been trying to get rid of.
> >>
> >
> > I'm not reusing the name - in fact I set the prefix to earlydev_
> > exactly in order to not confuse anyone. I'm also not reusing any code
> > in the second series.
> 
> Ok.
> 
> >> If what you want to do is completely different from the existing
> >> early_platform implementation, how about starting by moving that
> >> out of drivers/base/platform.c into something under arch/sh/
> >> and renaming it to something with an sh_ prefix.
> >>
> >
> > Yes, this is a good idea, but what about the sh-specific drivers that
> > rely on it? Is including headers from arch/ in driver code still an
> > accepted practice?
> 
> I think it's fine here, since we're just move it out of the way and
> there are only very few drivers using it:
> 
> drivers/clocksource/sh_cmt.c:early_platform_init("earlytimer",
> &sh_cmt_device_driver);
> drivers/clocksource/sh_mtu2.c:early_platform_init("earlytimer",
> &sh_mtu2_device_driver);
> drivers/clocksource/sh_tmu.c:early_platform_init("earlytimer",
> &sh_tmu_device_driver);
> drivers/clocksource/timer-ti-dm.c:early_platform_init("earlytimer",
> &omap_dm_timer_driver);
> drivers/tty/serial/sh-sci.c:early_platform_init_buffer("earlyprintk",
> &sci_driver,
> 
> For timer-ti-dm, it seems like a leftover from old times that can
> be removed. The other four are shared between arch/sh and
> arch/arm/mach-shmobile and already have some #ifdef
> to handle those two cases.

FWIW if arch/sh is the only remaining user of the earlyprintk part,
please don't go to any trouble to preserve it. I want to move to
earlycon exclusively. Not sure if that is possible before moving the
boards that are using it to device tree; if so and it's easy, please
consider sending a patch or a sketch of what it should look like so I
can do it.

Rich
