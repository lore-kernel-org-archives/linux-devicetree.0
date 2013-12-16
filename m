From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCHv4] rtc: Add support for Intersil ISL12057 I2C RTC chip
Date: Mon, 16 Dec 2013 13:37:06 -0800
Message-ID: <20131216213706.GA8527@roeck-us.net>
References: <1dec5992db795b61e91e0abf910dee7fce322ccc.1387227955.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1dec5992db795b61e91e0abf910dee7fce322ccc.1387227955.git.arno@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: Arnaud Ebalard <arno@natisbad.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 16, 2013 at 10:17:47PM +0100, Arnaud Ebalard wrote:
> 
> Intersil ISL12057 I2C RTC chip also supports two alarms. This patch
> only adds support for basic RTC functionalities (i.e. getting and
> setting time). Tests have been performed on NETGEAR ReadyNAS 102 w/
> startup/shutdown scripts, hwclock, ntpdate and openntpd.
> 
> Signed-off-by: Arnaud Ebalard <arno@natisbad.org>

Here is a snippet from the saved patch:

 obj-$(CONFIG_RTC_DRV_IMXDI)    +=3D rtc-imxdi.o
 obj-$(CONFIG_RTC_DRV_ISL1208)  +=3D rtc-isl1208.o
 obj-$(CONFIG_RTC_DRV_ISL12022) +=3D rtc-isl12022.o
+obj-$(CONFIG_RTC_DRV_ISL12057)  +=3D rtc-isl12057.o
 obj-$(CONFIG_RTC_DRV_JZ4740)   +=3D rtc-jz4740.o
 obj-$(CONFIG_RTC_DRV_LP8788)   +=3D rtc-lp8788.o
 obj-$(CONFIG_RTC_DRV_LPC32XX)  +=3D rtc-lpc32xx.o

Something is adding those '3D' after each '=' into the patch.

On a side note, even though it is hard to see, it seems you use two spaces
instead of a tab above, and that you do the same with other defines (unless the
mailer replaced tabs with spaces).

In general, the widely used form for defines is

#define<space>MY_DEFINE<tab>definition<tab>/* this is a comment */

Also, I think

+static struct i2c_driver isl12057_driver;

is unnecessary. But I'd really like to have a closer look again after you fixed
the =3D issue ...

Thanks,
Guenter
