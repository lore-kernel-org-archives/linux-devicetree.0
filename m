From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V5 REPOST] mfd: add support for ams AS3722 PMIC
Date: Mon, 9 Jun 2014 13:57:16 +0200
Message-ID: <CACRpkdYPxPo2VPS=7-5UKWVJuQaZBV8JVGnfLQb=FxeemiCBgA@mail.gmail.com>
References: <1382427526-2390-1-git-send-email-ldewangan@nvidia.com>
	<20140606152840.GV24240@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140606152840.GV24240@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>, Rob Herring <rob.herring@calxeda.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Landley <rob@landley.net>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, Florian Lobmaier <florian.lobmaier@ams.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 6, 2014 at 5:28 PM, Lee Jones <lee.jones@linaro.org> wrote:

>> +     as3722->en_intern_int_pullup = of_property_read_bool(np,
>> +                                     "ams,enable-internal-int-pullup");
>> +     as3722->en_intern_i2c_pullup = of_property_read_bool(np,
>> +                                     "ams,enable-internal-i2c-pullup");
>
> These are still not documented.  Can you please do so?

...and these look an awful lot like some pin config shoehorned
silently into the MFD subsystem.

There *are* cases where a complete pin control driver for some
IP is overkill though, I'm worried if this is some generic disease
with this driver :-/

Yours,
Linus Walleij
