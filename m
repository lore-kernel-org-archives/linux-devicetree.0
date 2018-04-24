From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 00/11] platform: device tree support for early platform drivers
Date: Tue, 24 Apr 2018 14:39:44 -0500
Message-ID: <CAL_JsqLcoPK-dDWjwrS82RRG-WLKePfDgHJcBKRQWZG5PszrKg@mail.gmail.com>
References: <20180424173051.15099-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180424173051.15099-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, David Lechner <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Frank Rowand <frowand.list@gmail.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arend van Spriel <aspriel@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Michal Suchanek <msuchanek@suse.de>, Jan Kiszka <jan.kiszka@siemens.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 24, 2018 at 12:30 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Device tree based systems often use OF_DECLARE() macros for devices
> that need to be initialized early in the boot process such as clocks,
> timers etc. However platform devices are more desirable.

Yes, platform devices would be more desirable, but ...
>
> This series aims at introducing support for early platform drivers for
> OF-based systems.

... the whole early_platform_device infrastructure is not really a
platform_device. Rather it kind of looks like one and I guess gets
converted over during boot.

This is not the first attempt to add DT support to early platform
devices[1]. I think the same objections still apply. It has been
pretty much only an SH thing (which as an arch, I'm told is pretty
much unmaintained and broken).

> The idea is to have a special compatible fallback string: "earlydev"
> that similarily to "syscon" would be added to device nodes that need
> early probing. We then need to call of_early_platform_populate() early
> in the boot process to actually probe the registered devices.

Others have sufficiently explained why this won't fly for DT, so I
don't have more to add.

Rob

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2011-June/054529.html
