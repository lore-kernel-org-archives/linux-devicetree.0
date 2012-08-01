From: Johannes Stezenbach <js@sig21.net>
Subject: DT GPIO numbering?
Date: Wed, 1 Aug 2012 17:22:40 +0200
Message-ID: <20120801152240.GA16388@sig21.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi,

I'm currently learning how Linux devicetree support works,
here is one question I couldn't find an answer for.

I understand that within the devicetree GPIOs are referenced by phandle,
thus the numbers are irrelevant.  However, in sysfs the number is
what is used to access the GPIO, e.g. for debugging or
blinkenlight apps.  How does this fit together?

In the old days platform data was used, e.g.

	struct pl061_platform_data {
		/* number of the first GPIO */
		unsigned	gpio_base;
		...
	};

Now, when DT is used gpio-pl061.c sets gc.base = -1 (dynamic numbering).

Should there be a DT property to assign the number base?

Or is there some better way, e.g. in gpio-mxs.c the code derives
the gc.base from of_alias_get_id(np, "gpio").
Should gpio-pl061.c do the same?

And how about assigning gpio names?  When a name is assigned to
the GPIO, is shows up in sysfs instead of gpio%d, however the
number is still needed for /sys/class/gpio/export, right?


Thanks,
Johannes
