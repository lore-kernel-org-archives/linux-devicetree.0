From: Rich Felker <dalias@libc.org>
Subject: Re: [PATCH 00/11] platform: device tree support for early platform
 drivers
Date: Tue, 24 Apr 2018 13:59:37 -0400
Message-ID: <20180424175937.GD3094@brightrain.aerifal.cx>
References: <20180424173051.15099-1-brgl@bgdev.pl>
 <20180424175544.uq7f5x63a5il36sh@lakrids.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180424175544.uq7f5x63a5il36sh@lakrids.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Jan Kiszka <jan.kiszka@siemens.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Frank Rowand <frowand.list@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Michal Suchanek <msuchanek@suse.de>, devicetree@vger.kernel.org, David Lechner <david@lechnology.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Arend van Spriel <aspriel@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.c>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 24, 2018 at 06:55:45PM +0100, Mark Rutland wrote:
> Hi bartosz,
> 
> On Tue, Apr 24, 2018 at 07:30:40PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > 
> > Device tree based systems often use OF_DECLARE() macros for devices
> > that need to be initialized early in the boot process such as clocks,
> > timers etc. However platform devices are more desirable.
> > 
> > This series aims at introducing support for early platform drivers for
> > OF-based systems.
> > 
> > The idea is to have a special compatible fallback string: "earlydev"
> > that similarily to "syscon" would be added to device nodes that need
> > early probing. We then need to call of_early_platform_populate() early
> > in the boot process to actually probe the registered devices.
> > 
> > I am aware that this new compatible does not strictly correspond with
> > the "hardware description only" rule of DT, but we already have many
> > functionalities that break this rule: syscon, gpio hogs etc.
> 
> I don't think we need the "earlydev" string at all, and can still keep
> the rest of this infrastrcuture if it is helpful.
> 
> So while I'm certainly oppposed to the "earlydev" string, I think that
> the infrastrcuture could be useful.

Yes. I think this agrees with my objection -- I'm not opposed to the
infrastructure in the kernel, but to semantically-wrong and
backwards-incompatible changes to the device tree contract.

> > The first user of this new functionality will be the DaVinci platform
> > for which we want to probe the pll, psc and timer drivers early in the
> > boot sequence but keep them implemented as platform drivers.
> 
> Can we have early_paltform_driver() take a reference to the driver's
> of_match_table, and put that in a special section?
> 
> Then instead of looking for "earlydev", we look for any compatible
> string in that section. No magic string required in the DT, and we can
> always mess around with probe ordering in future.

Yes, this is pretty much exactly the change I had in mind.

Rich
