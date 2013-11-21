From: arno@natisbad.org (Arnaud Ebalard)
Subject: Re: [PATCHv2] rtc: Add support for Intersil ISL12057 I2C RTC chip
Date: Thu, 21 Nov 2013 23:00:51 +0100
Message-ID: <87txf576uk.fsf@natisbad.org>
References: <87k3g5l9gw.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <87k3g5l9gw.fsf@natisbad.org> (Arnaud Ebalard's message of "Mon,
	18 Nov 2013 21:51:27 +0100")
Sender: linux-doc-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Kent Yoder <key@linux.vnet.ibm.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

Hi Mark,

Sorry for the delay, but I was somehow removed from the recipients in
your reply. As I am not subscribed to rtc-linux, can you keep me in Cc:
next time?

> On Mon, Nov 18, 2013 at 09:51:27PM +0100, Arnaud Ebalard wrote: 
> 
> > +/* Block read. Returns 0 on success, or a negative errno. */ 
> > +static int isl12057_i2c_read_regs(struct i2c_client *client, u8 reg, u8 buf[], 
> > +                                  unsigned len) 
> 
> This looks like the device would work well with regmap (8 bit register, 
> 8 bit data).  This would save a bit of code here both for the I/O 
> functions and also for some of the debugging functionality you have 
> below like the proc file. 

Well, I am not familiar with regmap but if you can point me some simple
rtc driver in existing ones which uses regmap, I will take a look and
come with a regmap-based v3.

> > +        dev_info(dev, "chip found, driver version " DRV_VERSION "\n"); 
> 
> This sort of print is generally frowned upon - it's not adding anything 
> to the message already displayed by the RTC core on registration.  It's 
> probably best to remove the driver version too, the kernel is already 
> versioned. 

ok, will do.

Cheers,

a+
