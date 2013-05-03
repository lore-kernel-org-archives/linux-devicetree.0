From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/8] pinctrl-tz1090: add TZ1090 pinctrl driver
Date: Fri, 3 May 2013 15:03:13 +0200
Message-ID: <CACRpkdYYhsY-2vQnxpM-rB9_6yXiY4XBNhb4eyNvK=eD=dxK5w@mail.gmail.com>
References: <1366727607-27444-1-git-send-email-james.hogan@imgtec.com>
	<1366727607-27444-6-git-send-email-james.hogan@imgtec.com>
	<CACRpkdbYwDvF=gNurLzc+wE0BYpoqog7sPdRTY59BGS7yn3n9Q@mail.gmail.com>
	<517A6B01.5000708@imgtec.com>
	<CACRpkdYooPNgJuA-fZOiGJV03R_783uAOmR=QgYOahYdHcad9w@mail.gmail.com>
	<5183AC54.30503@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <5183AC54.30503@imgtec.com>
Sender: linux-doc-owner@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 3, 2013 at 2:23 PM, James Hogan <james.hogan@imgtec.com> wrote:
> [Me]
>> If what you need is to set the pin into "GPIO mode" to drive it
>> to some default state then from pinconf-generic.h you should use
>> one of the existing defines like PIN_CONFIG_OUTPUT
>> to actively drive it to high or low as default, or
>> PIN_CONFIG_BIAS_HIGH_IMPEDANCE for some default
>> GPIO input mode.
>>
>> Read the new section named "GPIO mode pitfalls" in
>> Documentation/pinctrl.txt
>
> Thanks, that was interesting. I've had a think about this (and done some
> experiments with a multimeter), and the problem is these generic
> pinconfs already have meanings which don't match what the SELECT
> register does. For example, having a pin be tristate and not controlled
> by the peripheral, and having it tristate as far as the gpio hardware is
> concerned (e.g. no pull-up) but still controlled by the peripheral, are
> two very different things that need disambiguation.

I don't know if that is necessary.

While I do recognize that it is possible that we need to put
pins into "GPIO mode", i.e. drive them actively low or high,
as PIN_CONFIG_OUTPUT does, I'm not convinced that
pin config should handle the case where a signal is passed
through from a peripheral.

I think that for every pin that is put to use for a peripheral
you must anyway at some point call .enable() on the
struct pinmux_ops of the pin controller.

Thus this part of the problem (poking that "select" bit)
should be handled by the pinmux part of the driver.

The pinconf part does not need to know about it.

The idea is definately not for the pin config to act
as a "backend" for pin muxing, rather to partition
the problem into two independent parts.

Yours,
Linus Walleij
