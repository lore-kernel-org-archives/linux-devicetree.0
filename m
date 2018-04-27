From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RFC PoC 1/2] earlydev: implement a new way to probe
 platform devices early
Date: Fri, 27 Apr 2018 17:13:20 +0200
Message-ID: <CAK8P3a13wiATdYDGXnmEMfpoKzXqWA-umKLgO7hFaJj3MF4w1Q@mail.gmail.com>
References: <20180426152920.21569-1-brgl@bgdev.pl>
 <20180426152920.21569-2-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180426152920.21569-2-brgl@bgdev.pl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>, Jan Kiszka <jan.kiszka@siemens.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Frank Rowand <frowand.list@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Kevin Hilman <khilman@kernel.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Michal Suchanek <msuchanek@suse.de>, DTML <devicetree@vger.kernel.org>, David Lechner <david@lechnology.com>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Arend van Spriel <aspriel@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxf>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 26, 2018 at 5:29 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> +/*
> + * REVISIT: early_initcall may be still too late for some timers and critical
> + * clocks. We should probably have a separate section with callbacks that can
> + * be invoked at each architecture's discretion.
> + */
> +#define earlydev_platform_driver(_drv)                                 \
> +       static int _drv##_register(void)                                \
> +       {                                                               \
> +               earlydev_driver_register(&(_drv));                      \
> +               return 0;                                               \
> +       }                                                               \
> +       early_initcall(_drv##_register)
> +
> +#endif /* __EARLYDEV_H__ */

No full review, just one comment: this would really need to fit into the
existing callbacks for clk, timer, earlycon etc that we use with OF_DECLARE.
A lot of code makes assumptions about the order in which they are
called, and the current early_platform infrastructure does the same
thing using its "earlyprintk" and "earlytimer" classes.

       Arnd
