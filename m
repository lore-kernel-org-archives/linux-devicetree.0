From: Chris Healy <cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] mfd: Add driver for RAVE Supervisory Processor
Date: Wed, 14 Jun 2017 21:19:45 -0700
Message-ID: <CAFXsbZociERie6bqHUz2fGw71d9JXN512BG27UgXN1EEyRC+YA@mail.gmail.com>
References: <20170613012358.15084-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170613012358.15084-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 12, 2017 at 6:23 PM, Andrey Smirnov
<andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Add a driver for RAVE Supervisory Processor, an MCU implementing
> varoius bits of housekeeping functionality (watchdoging, backlight
> control, LED control, etc) on RAVE family of products by Zodiac
> Inflight Innovations.
>
> This driver implementes core MFD/serdev device as well as
> communication subroutines necessary for commanding the device.
>
> Cc: cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
> [v1] lkml.kernel.org/r/20170606180643.14258-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>
>
>  .../devicetree/bindings/mfd/zii,rave-sp.txt        |   36 +
>  drivers/mfd/Kconfig                                |    9 +
>  drivers/mfd/Makefile                               |    1 +
>  drivers/mfd/rave-sp.c                              | 1009 ++++++++++++++++++++
>  include/linux/rave-sp.h                            |   54 ++
>  5 files changed, 1109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
>  create mode 100644 drivers/mfd/rave-sp.c
>  create mode 100644 include/linux/rave-sp.h
>

This patch was tested on Zodiac RDU1 and RDU2 platforms.

Tested-by: Chris Healy <cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
