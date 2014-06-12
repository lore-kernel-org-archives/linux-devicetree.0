From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [RFC 0/5] of: Automatic console registration cleanups
Date: Thu, 12 Jun 2014 11:12:18 +0100
Message-ID: <20140612101218.3CCDCC42680@trevor.secretlab.ca>
References: <1396022885-6102-1-git-send-email-grant.likely@linaro.org>
	<CAL_JsqJmYH3_tSMtdwQd9QfeB39i5UOxBwBzyP=QjvzK1XSnmQ@mail.gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJmYH3_tSMtdwQd9QfeB39i5UOxBwBzyP=QjvzK1XSnmQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Christoffer Dall <christoffer.dall@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

On Wed, 11 Jun 2014 20:28:31 -0500, Rob Herring <robherring2@gmail.com> wrote:
> On Fri, Mar 28, 2014 at 11:08 AM, Grant Likely <grant.likely@linaro.org> wrote:
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
> >
> > The one downside with this approach is that it doesn't do anything for
> > early console setup. That still needs to be added on a per-driver basis,
> > but at least it shouldn't conflict with this approach.
> 
> Hey, what happened with this series?

Ummm... I got distracted and forgot about it? I merged the first patch
that adds stdout-path parsing, but the rest are still sitting in a side
branch. I'll dust them off and rebase onto current mainline.

g.
