From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 00/11] platform: device tree support for early platform
 drivers
Date: Tue, 24 Apr 2018 19:19:14 +0100
Message-ID: <9f097271-5953-9587-7dcb-a2a9368bd015@arm.com>
References: <20180424173051.15099-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180424173051.15099-1-brgl@bgdev.pl>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, David Lechner <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Frank Rowand <frowand.list@gmail.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arend van Spriel <aspriel@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Michal Suchanek <msuchanek@suse.de>, Jan
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 24/04/18 18:30, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Device tree based systems often use OF_DECLARE() macros for devices
> that need to be initialized early in the boot process such as clocks,
> timers etc. However platform devices are more desirable.
> 
> This series aims at introducing support for early platform drivers for
> OF-based systems.
> 
> The idea is to have a special compatible fallback string: "earlydev"
> that similarily to "syscon" would be added to device nodes that need
> early probing. We then need to call of_early_platform_populate() early
> in the boot process to actually probe the registered devices.
> 
> I am aware that this new compatible does not strictly correspond with
> the "hardware description only" rule of DT, but we already have many
> functionalities that break this rule: syscon, gpio hogs etc.

Eww, it's the "u-boot,dm-pre-reloc" mess all over again :(

The examples you give do represent hardware though - "syscon" falls wide 
of the DT abstraction of nice distinct devices, but is at least still 
describing a real relationship of some registers somewhere affecting 
some component somewhere else; GPIO hogs may not be real devices but 
they still describe a hardware configuration which the OS is expected to 
set up.

Things that describe pure consumer-specific software policy are a whole 
other level beyond that IMO.

> The first user of this new functionality will be the DaVinci platform
> for which we want to probe the pll, psc and timer drivers early in the
> boot sequence but keep them implemented as platform drivers.
> 
> In the future, if this series gets accepted, this could become and
> alternative to TIMER_OF_DECLARE, CLK_OF_DECLARE etc. and could lead
> to deprecating of those macros in favor of early platform drivers.

Admittedly it doesn't apply as super-early as timers and clocksources, 
but I feel compelled to point out that IOMMU_OF_DECLARE was already 
doing a variant on "early platform devices" for ages (until 4.16 when 
everything was finally cleaned up to rely on regular probe-deferral and 
left it as just a vestigial lookup table). AFAICS the same basic concept 
could translate to other subsystems without invasive DT changes.

Robin.

> Bartosz Golaszewski (11):
>    platform: early: provide early_platform_add_device()
>    platform: provide early_platform_driver_register_probe_all()
>    platform: make support for early platform devices conditional
>    of: platform: use pdev as name for vars of type struct platform_device
>    platform: use a dedicated list_head for early devices
>    of: provide for_each_compatible_child_node()
>    dt-bindings: add bindings for early devices
>    of: platform: provide of_early_platform_populate()
>    platform: provide early_platform_driver()
>    of: platform: provide of_early_platform_probe()
>    misc: implement a dummy early platform driver
> 
>   Documentation/devicetree/bindings/early.txt |   7 +
>   arch/sh/Kconfig                             |   1 +
>   drivers/base/Kconfig                        |   4 +
>   drivers/base/platform.c                     |  26 ++--
>   drivers/misc/Kconfig                        |   8 ++
>   drivers/misc/Makefile                       |   1 +
>   drivers/misc/dummy-early.c                  |  40 ++++++
>   drivers/of/device.c                         |  14 +-
>   drivers/of/platform.c                       | 143 +++++++++++++++-----
>   include/linux/device.h                      |   4 +
>   include/linux/of.h                          |   3 +
>   include/linux/of_device.h                   |   5 +
>   include/linux/of_platform.h                 |  19 +++
>   include/linux/platform_device.h             |  52 +++++++
>   14 files changed, 279 insertions(+), 48 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/early.txt
>   create mode 100644 drivers/misc/dummy-early.c
> 
