From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH anybus v1 0/4] Support HMS Profinet Card over Anybus
Date: Thu, 25 Oct 2018 12:18:36 +0300
Message-ID: <20181025091836.GV10650@smile.fi.intel.com>
References: <20181024142456.10084-1-svendev@arcx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181024142456.10084-1-svendev@arcx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <svendev@arcx.com>
Cc: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, yuanzhichang@hisilicon.com, stuyoder@gmail.com, linus.walleij@linaro.org, maxime.ripard@bootlin.com, bogdan.purcareata@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 24, 2018 at 10:24:52AM -0400, Sven Van Asbroeck wrote:
> This patch set adds support for the HMS Industrial Networks AB Profinet card.
> 
> Profinet is an industry technical standard for data communication over
> Industrial Ethernet, designed for collecting data from, and controlling,
> equipment in industrial systems, with a particular strength in delivering data
> under tight time constraints (on the order of 1ms or less).
> 
> The profinet card itself is connected to the system via an industrial bus
> called 'anybus'.
> 
> I have followed the bus driver/client driver pattern, and created an anybus
> bus driver, plus a client driver for the profinet card.
> 
> In case this patch set gets (eventually) accepted, drivers for other anybus
> client cards may follow: flnet, cc-link, ...
> 
> The anybus slot on the host is located on an 'anybus bridge', which is
> custom h/w designed by Arcx. Its driver is modeled as an mfd, which
> instantiates two anybus slots.

I highly recommend to look at my recent (for few month?) reviews -- they are
almost repeating each other.

Also check what we have under lib/ (hint: read linux/kernel.h for inline and
exported function helpers).

I might look at the patches later on if I would have some spare time (I
actually don't know why I'm in Cc list here).

> 
> v1:
> 	first shot
> 
> Sven Van Asbroeck (4):
>   mfd: support the Arcx anybus bridge.
>   dt-bindings: anybus-bridge: document devicetree binding.
>   bus: support HMS Anybus-S bus.
>   misc: support HMS Profinet IRT industrial controller.
> 
>  .../bindings/mfd/arcx,anybus-bridge.txt       |   37 +
>  .../devicetree/bindings/vendor-prefixes.txt   |    1 +
>  drivers/bus/Kconfig                           |   11 +
>  drivers/bus/Makefile                          |    1 +
>  drivers/bus/anybuss-host.c                    | 1301 +++++++++++++++++
>  drivers/mfd/Kconfig                           |   11 +
>  drivers/mfd/Makefile                          |    1 +
>  drivers/mfd/anybus-bridge.c                   |  441 ++++++
>  drivers/misc/Kconfig                          |   11 +
>  drivers/misc/Makefile                         |    1 +
>  drivers/misc/hms-profinet.c                   |  747 ++++++++++
>  include/linux/anybuss-client.h                |  100 ++
>  include/linux/anybuss-host.h                  |   28 +
>  include/uapi/linux/hms-common.h               |   14 +
>  include/uapi/linux/hms-profinet.h             |  101 ++
>  15 files changed, 2806 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/arcx,anybus-bridge.txt
>  create mode 100644 drivers/bus/anybuss-host.c
>  create mode 100644 drivers/mfd/anybus-bridge.c
>  create mode 100644 drivers/misc/hms-profinet.c
>  create mode 100644 include/linux/anybuss-client.h
>  create mode 100644 include/linux/anybuss-host.h
>  create mode 100644 include/uapi/linux/hms-common.h
>  create mode 100644 include/uapi/linux/hms-profinet.h
> 
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko
