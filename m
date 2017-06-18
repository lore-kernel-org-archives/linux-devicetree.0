From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] mfd: Add driver for RAVE Supervisory Processor
Date: Sun, 18 Jun 2017 09:04:51 -0500
Message-ID: <20170616182904.hc44mu7qsf2po4qt@rob-hp-laptop>
References: <20170613012358.15084-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170613012358.15084-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, cphealy@gmail.com, Lucas Stach <l.stach@pengutronix.de>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 12, 2017 at 06:23:58PM -0700, Andrey Smirnov wrote:
> Add a driver for RAVE Supervisory Processor, an MCU implementing
> varoius bits of housekeeping functionality (watchdoging, backlight
> control, LED control, etc) on RAVE family of products by Zodiac
> Inflight Innovations.
> 
> This driver implementes core MFD/serdev device as well as
> communication subroutines necessary for commanding the device.
> 
> Cc: cphealy@gmail.com
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
> 
> Changes since [v1]:
> 
>  - Fix MODULE_LICENSE to specify "GPL v2"
> 
>  - Fix a bug in rave_sp_get_status()
> 
>  - Use %zu to fix warning repored by kbuild test robot
> 
>  - Remove "status" properties from examples zii,rave-sp.txt as well as
>    clarify the fact that device node is expected to be a child of a
>    serial device node
> 
> NOTE:
> 
>  * The driver for "zii,rave-sp-watchdog" exists, but I haven't
>    submitted it yet, becuase I wanted to make sure that API exposed by
>    this MFD is acceptable and doesn't need drastic changes
> 
>  * This driver is dependent on crc_ccitt_false() introduced in
>    2da9378d531f8cc6670c7497f20d936b706ab80b in 'linux-next'
> 
> 
> [v1] lkml.kernel.org/r/20170606180643.14258-1-andrew.smirnov@gmail.com
> 
> 
>  .../devicetree/bindings/mfd/zii,rave-sp.txt        |   36 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mfd/Kconfig                                |    9 +
>  drivers/mfd/Makefile                               |    1 +
>  drivers/mfd/rave-sp.c                              | 1009 ++++++++++++++++++++
>  include/linux/rave-sp.h                            |   54 ++
>  5 files changed, 1109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
>  create mode 100644 drivers/mfd/rave-sp.c
>  create mode 100644 include/linux/rave-sp.h
