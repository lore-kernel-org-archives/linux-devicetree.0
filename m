Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <1397757570-19750-7-git-send-email-dianders@chromium.org>
References: <1397757570-19750-1-git-send-email-dianders@chromium.org>
	<1397757570-19750-7-git-send-email-dianders@chromium.org>
Date: Thu, 17 Apr 2014 11:16:27 -0700
Message-ID: <CAD=FV=VUXU1=nkH9vtC7aZraYJTsP9=wPD+AKqhGkoi_pR13RQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] i2c: ChromeOS EC tunnel driver
From: Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset=UTF-8
To: Lee Jones <lee.jones@linaro.org>, Stephen Warren <swarren@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Andrew Bresticker <abrestic@chromium.org>, Dylan Reid <dgreid@chromium.org>, Olof Johansson <olof@lixom.net>, Simon Glass <sjg@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, Vincent Palatin <vpalatin@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Samuel Ortiz <sameo@linux.intel.com>, jdelvare@suse.de, shane.huang@amd.com, maxime.ripard@free-electrons.com, laurent.pinchart+renesas@ideasonboard.com, u.kleine-koenig@pengutronix.de, bjorn.andersson@sonymobile.com, kevin.strasser@linux.intel.com, linux@prisktech.co.nz, andrew@lunn.ch, andriy.shevchenko@linux.intel.com, schwidefsky@de.ibm.com, matt.porter@linaro.org, naveen krishna <ch.naveen@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Apr 17, 2014 at 10:59 AM, Doug Anderson <dianders@chromium.org> wrote:
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
>  .../devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt |  36 +++
>  drivers/i2c/busses/Kconfig                         |   9 +
>  drivers/i2c/busses/Makefile                        |   1 +
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c            | 304 +++++++++++++++++++++
>  drivers/mfd/cros_ec.c                              |   5 +
>  5 files changed, 355 insertions(+)

Argh, I think patch 6 (and probably the cover letter) hit my favorite
"too many characters in the CC list" and didn't make it up to the
lists.  :(  Since I can't quite imagine this being Ack-ed on V1, I'll
make sure I address this issue before sending out version 2.

If you somehow can't find the patch and want to review it ASAP then
please let me know and I'll send it your way.  I'll also try to find a
way to resend just patch #6 with my current workflow shortly...  ;)

-Doug
