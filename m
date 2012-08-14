From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: DT GPIO numbering?
Date: Tue, 14 Aug 2012 12:00:23 +0200
Message-ID: <CACRpkdbQVHFWej=CPv0QOjH7OUr8Jj7wVjG=eRqkM=cbih1vAQ@mail.gmail.com>
References: <20120801152240.GA16388@sig21.net>
	<CACRpkdZryc95WpSXddCrLvZGDsv4x-ndX9XcVzoxaDCT53AFLw@mail.gmail.com>
	<501F296B.4070004@wwwdotorg.org>
	<CACRpkdZ8AO5SrjJvJxvpauEadQOKMNaW_Pxxzhjk5hWnVB1b+g@mail.gmail.com>
	<20120806095805.GA16607@sig21.net>
	<501FA608.1030805@firmworks.com>
	<20120810093458.GA13192@sig21.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120810093458.GA13192@sig21.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Johannes Stezenbach <js@sig21.net>, Grant Likely <grant.likely@secretlab.ca>
Cc: Mitch Bradley <wmb@firmworks.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 10, 2012 at 11:34 AM, Johannes Stezenbach <js@sig21.net> wrote:

> Actually I think the kernel internal GPIO numbers shouldn't be in the
> sysfs API, instead userspace should use the names.

This is true, but we cannot remove these numbers because they
are now in Documentation/ABI/testing/sysfs-gpio

And while the "testing" ABI is, well for testing, it would probably
break a lot of stuff it we removed it.

But we can sure add names. However these would still sit under
/sys/class/gpio/gpioN/name

Or do you suggest we simply duplicate all GPIOs which have
names under /sys/class/gpio/named/<name>
or something like that?

I know Grant may have opinions on this...

>  Probably it's
> best to not use /sys/class/gpio/export but instead let the board
> init code export the GPIOs available to userspace with proper names.

This sounds true.

Yours,
Linus Walleij
