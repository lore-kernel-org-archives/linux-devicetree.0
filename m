Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <CAPdUM4N_HRL+i+YpScK+W7xOzKEB=Sa4MaVMdMP8yNcGOmHLPA@mail.gmail.com>
References: <1398879850-9111-1-git-send-email-dianders@chromium.org>
	<1398879850-9111-7-git-send-email-dianders@chromium.org>
	<CAPdUM4N_HRL+i+YpScK+W7xOzKEB=Sa4MaVMdMP8yNcGOmHLPA@mail.gmail.com>
Date: Tue, 6 May 2014 08:27:18 -0700
Message-ID: <CAD=FV=WAd06bMq9UQqrCO1LiEhgY5=DNSdPg17xeqEO7eAFTDA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] i2c: ChromeOS EC tunnel driver
From: Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset=UTF-8
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: Lee Jones <lee.jones@linaro.org>, Stephen Warren <swarren@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Andrew Bresticker <abrestic@chromium.org>, Dylan Reid <dgreid@chromium.org>, Olof Johansson <olof@lixom.net>, Simon Glass <sjg@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Samuel Ortiz <sameo@linux.intel.com>, jdelvare@suse.de, shane.huang@amd.com, Maxime Ripard <maxime.ripard@free-electrons.com>, laurent.pinchart+renesas@ideasonboard.com, u.kleine-koenig@pengutronix.de, Bjorn Andersson <bjorn.andersson@sonymobile.com>, kevin.strasser@linux.intel.com, Tony Prisk <linux@prisktech.co.nz>, andrew@lunn.ch, andriy.shevchenko@linux.intel.com, schwidefsky@de.ibm.com, Matt Porter <matt.porter@linaro.org>, naveen krishna <ch.naveen@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, sunil joshi <joshi@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Rahul,

On Tue, May 6, 2014 at 3:55 AM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>> +module_platform_driver(ec_i2c_tunnel_driver);
>
> In peach-pit, tps65090 is connected to i2c tunnel which provides
> regulators for lcd, led and hdmi. We need to make all regulators
> available before platform devices get probed. Shall it be changed to
> subsys_initcall like other i2c controllers ?

I wouldn't object it it being subsys_initcall, but I'd rather do it in
a separate patch series so we can have discussion about it and not
block this basic support from landing.  Specifically when I originally
submitted the "i2c arbitrator" for exynos5250-snow I had
subsys_initcall and was asked to change away from that.  See
<http://comments.gmane.org/gmane.linux.drivers.devicetree/30172>

The answer I got was that the rest of the system should handle the
regulator showing up late by using deferred probing.  That's not my
favorite mechanism since in this case it means that the LCD turns on
much later in the boot process, but it still can be workable.  Last I
checked DRM had a whole lot of work to do to handle deferred probing
well, though.  :(

Note also that there are other dependencies if we actually want to
make this work properly as a subsys_initcall.  Specifically:

* Last I checked you'd also need to move the pl330 driver to be
subsys_initcall.  That's actually a latent upstream bug since the SPI
driver uses subsys_initcall, has a dependency on pl330, and doesn't
check / defer probe if pl330 isn't ready.  I'd need to check if that
still happens and also whether upstream would accept a change to the
init ordering or would rather see the spi driver somehow detect this
and defer.

* You'll also need to adjust cros_ec_spi to init earlier to make
things actually work properly.


See <https://code.google.com/p/chromium/issues/detail?id=239659> for
the patches that changed initcall ordering locally in the Chromium OS
tree.


Since I'm really not interested in fighting a fight about the benefits
and alternatives to deferred probing, I'd be inclined to let someone
else drive this (especially if you can point to a use case where
deferred probing is causing a problem and can justify why fixing that
is too big of a burden).


-Doug
