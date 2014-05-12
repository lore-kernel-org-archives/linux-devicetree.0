Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <1398879850-9111-7-git-send-email-dianders@chromium.org>
References: <1398879850-9111-1-git-send-email-dianders@chromium.org>
	<1398879850-9111-7-git-send-email-dianders@chromium.org>
Date: Mon, 12 May 2014 13:18:03 -0700
Message-ID: <CAD=FV=VHOq3J4BnHD7GLiKpMXhpCO+Tc+iJb4onq1f-VTfqxLQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] i2c: ChromeOS EC tunnel driver
From: Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset=UTF-8
To: Lee Jones <lee.jones@linaro.org>, Stephen Warren <swarren@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Andrew Bresticker <abrestic@chromium.org>, Dylan Reid <dgreid@chromium.org>, Olof Johansson <olof@lixom.net>, Simon Glass <sjg@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, Vincent Palatin <vpalatin@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Samuel Ortiz <sameo@linux.intel.com>, jdelvare@suse.de, shane.huang@amd.com, Maxime Ripard <maxime.ripard@free-electrons.com>, laurent.pinchart+renesas@ideasonboard.com, u.kleine-koenig@pengutronix.de, Bjorn Andersson <bjorn.andersson@sonymobile.com>, kevin.strasser@linux.intel.com, Tony Prisk <linux@prisktech.co.nz>, andrew@lunn.ch, andriy.shevchenko@linux.intel.com, schwidefsky@de.ibm.com, Matt Porter <matt.porter@linaro.org>, naveen krishna <ch.naveen@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Wolfram,

On Wed, Apr 30, 2014 at 10:44 AM, Doug Anderson <dianders@chromium.org> wrote:
> On ARM Chromebooks we have a few devices that are accessed by both the
> AP (the main "Application Processor") and the EC (the Embedded
> Controller).  These are:
> * The battery (sbs-battery).
> * The power management unit tps65090.
>
> On the original Samsung ARM Chromebook these devices were on an I2C
> bus that was shared between the AP and the EC and arbitrated using
> some extranal GPIOs (see i2c-arb-gpio-challenge).
>
> The original arbitration scheme worked well enough but had some
> downsides:
> * It was nonstandard (not using standard I2C multimaster)
> * It only worked if the EC-AP communication was I2C
> * It was relatively hard to debug problems (hard to tell if i2c issues
>   were caused by the EC, the AP, or some device on the bus).
>
> On the HP Chromebook 11 the design was changed to:
> * The AP/EC comms were still i2c, but the battery/tps65090 were no
>   longer on the bus used for AP/EC communication.  The battery was
>   exposed to the AP through a limited i2c tunnel and tps65090 was
>   exposed to the AP through a custom Linux driver.
>
> On the Samsung ARM Chromebook 2 the scheme is changed yet again, now:
> * The AP/EC comms are now using SPI for faster speeds.
> * The EC's i2c bus is exposed to the AP through a full i2c tunnel.
>
> The upstream "tegra124-venice2" uses the same scheme as the Samsung
> ARM Chromebook 2, though it has a different set of components on the
> other side of the bus.
>
> This driver supports the scheme used by the Samsung ARM Chromebook 2.
> Future patches to this driver could add support for the battery tunnel
> on the HP Chromebook 11 (and perhaps could even be used to access
> tps65090 on the HP Chromebook 11 instead of using a special driver,
> but I haven't researched that enough).
>
> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
> Changes in v3:
> - Separate out packet sizing from packet stuffing.
> - Get rid of useless dev_dbg.
> - Check command_sendrecv against NULL.
> - Don't check np against NULL.
> - Get rid of useless error on memory alloc fail.
> - Get rid of useless platform_set_drvdata(dev, NULL);
>
> Changes in v2:
> - Update tunnel binding as per swarren
>
>  .../devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt |  39 +++
>  drivers/i2c/busses/Kconfig                         |   9 +
>  drivers/i2c/busses/Makefile                        |   1 +
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c            | 318 +++++++++++++++++++++
>  drivers/mfd/cros_ec.c                              |   5 +
>  5 files changed, 372 insertions(+)

Please let me know if there are any other changes you'd like me to
make to this driver.  I'm happy to resend this with Stephen's binding
Ack if you'd like.


Thanks!

-Doug
