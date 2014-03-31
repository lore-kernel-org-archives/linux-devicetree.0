From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [RFC 0/5] of: Automatic console registration cleanups
Date: Mon, 31 Mar 2014 10:41:24 +0100
Message-ID: <20140331094124.6DEF3C408E1@trevor.secretlab.ca>
References: <1396022885-6102-1-git-send-email-grant.likely@linaro.org> < 20140331071014.GN17250@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140331071014.GN17250@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org, christoffer.dall@linaro.org, linux-kernel@vger.kernel.org, olof@lixom.net, benh@kernel.crashing.org, rob.herring@linaro.org
List-Id: devicetree@vger.kernel.org

On Mon, 31 Mar 2014 09:10:15 +0200, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> On Fri, Mar 28, 2014 at 09:08:00AM -0700, Grant Likely wrote:
> > Hi all,
> > 
> > This is a series that I've been playing with over the last few days to
> > clean up the selection of default console devices when using the device
> > tree. The device tree defines a way of specifying the console by using a
> > "stdout-path" property in the /chosen node, but very few drivers
> > actually attempt to use that data, and so for most platforms there needs
> > to be a "console=" line in the command line if a serial port is intended
> > to be used as the console.
> > 
> > With this series, if there is a /chosen/stdout-path property, and if
> > that property points to a serial port node, then when the serial driver
> > registers the port, the core uart_add_one_port() function will notice
> > and if no console= argument was provided then add it as a preferred
> > console.
> > 
> > I've not tested this very extensively yet, but I want to get some
> > feedback before I go further.
> 
> I gave it a test on i.MX. It works as expected with both
> linux,stdout-path and stdout-path. Specifying a console on the
> commandline still works and overrides the devicetree setting.
> 
> Tested-by: Sascha Hauer <s.hauer@pengutronix.de>

Brilliant! Thanks Sascha.

Can you supply a patch to add stdout to the imx dts files?

g.
