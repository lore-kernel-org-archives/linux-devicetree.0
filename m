Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <20140519105055.GA2612@katana>
References: <1398879850-9111-1-git-send-email-dianders@chromium.org>
	<1398879850-9111-7-git-send-email-dianders@chromium.org>
	<20140519105055.GA2612@katana>
Date: Mon, 19 May 2014 08:09:39 -0700
Message-ID: <CAD=FV=X+BCmG7YHJigN9BsYZBxw9KWvPpn9uT7P_z7ZdtpvStw@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] i2c: ChromeOS EC tunnel driver
From: Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset=UTF-8
To: Wolfram Sang <wsa@the-dreams.de>, Lee Jones <lee.jones@linaro.org>
Cc: Stephen Warren <swarren@nvidia.com>, Andrew Bresticker <abrestic@chromium.org>, Dylan Reid <dgreid@chromium.org>, Olof Johansson <olof@lixom.net>, Simon Glass <sjg@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Samuel Ortiz <sameo@linux.intel.com>, jdelvare@suse.de, shane.huang@amd.com, Maxime Ripard <maxime.ripard@free-electrons.com>, laurent.pinchart+renesas@ideasonboard.com, u.kleine-koenig@pengutronix.de, Bjorn Andersson <bjorn.andersson@sonymobile.com>, kevin.strasser@linux.intel.com, Tony Prisk <linux@prisktech.co.nz>, andrew@lunn.ch, andriy.shevchenko@linux.intel.com, schwidefsky@de.ibm.com, Matt Porter <matt.porter@linaro.org>, naveen krishna <ch.naveen@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Wolfram and Lee,

On Mon, May 19, 2014 at 3:50 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>> +I2C bus that tunnels through the ChromeOS EC (cros-ec)
>> +======================================================
>> +On some ChromeOS board designs we've got a connection to the EC (embedded
>> +controller) but no direct connection to some devices on the other side of
>> +the EC (like a battery and PMIC).  To get access to those devices we need
>> +to tunnel our i2c commands through the EC.
>> +
>> +The node for this device should be under a cros-ec node like google,cros-ec-spi
>> +or google,cros-ec-i2c.
>> +
>> +
>> +Required properties:
>> +- compatible: google,cros-ec-i2c-tunnel
>> +- google,remote-bus: The EC bus we'd like to talk to.
>> +
>> +Optional child nodes:
>> +- One node per I2C device connected to the tunnelled I2C bus.
>> +
>> +
>> +Example:
>> +     cros-ec@0 {
>> +             compatible = "google,cros-ec-spi";
>
> Ooookay, now I get it. From the compatible name of this snipplet, I
> assumed this node describes only an SPI IP core inside the EC. This is
> why I complained about the location of the I2C busses, since placing it
> as subnodes of the EC based SPI didn't make sense to me, even though the
> connection of the tunnel was SPI. Now I understand that this is the core
> driver for the EC, talking to it via SPI. Since this driver is an SPI
> child node I would not have expected the "-spi" suffix. Sorry, for this
> confusion :/ Now, the bindings make much more sense to me.
>
>> +                     google,remote-bus = <0>;
>
> I am still not too happy about this one, but it is good enough for now,
> I suppose.
>
> Code looks good, so
>
> Reviewed-by: Wolfram Sang <wsa@the-dreams.de>
>
> I don't mind how it gets upstream. I can take it, but you can also keep
> it in this series.

Thanks for the review.  I think the easiest would be for Lee to take
the whole series for the next merge window.

-Doug
