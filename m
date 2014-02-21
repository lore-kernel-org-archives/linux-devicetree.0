From: Matt Porter <mporter@linaro.org>
Subject: Re: [PATCH v6 0/8] ARM: brcmstb: Add Broadcom STB SoC support
Date: Fri, 21 Feb 2014 11:54:21 -0500
Message-ID: <20140221165421.GM5038@beef>
References: <1391463041-15241-1-git-send-email-marc.ceeeee@gmail.com>
 <CAGVrzcZTHZYaB7sEDxFrP3PzZh0y-daS0gqg2Z4PUzuWGFeiSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGVrzcZTHZYaB7sEDxFrP3PzZh0y-daS0gqg2Z4PUzuWGFeiSw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Marc Carino <marc.ceeeee@gmail.com>, Christian Daudt <bcm@fixthebug.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 20, 2014 at 04:41:32PM -0800, Florian Fainelli wrote:
> Matt,
> 
> 2014-02-03 13:30 GMT-08:00 Marc Carino <marc.ceeeee@gmail.com>:
> > This patchset contains the board support package for the
> > Broadcom BCM7445 ARM-based SoC [1]. These changes contain a
> > minimal set of code needed for a BCM7445-based board to boot
> > the Linux kernel.
> 
> If you are happy with this round of changes, can you also carry those
> patches in your tree for 3.15?

I had to add a couple trivial comments on the dts that I missed back in
v2.

More importantly, you'll need to collect some acks on various pieces. In
particular the power/reset driver needs a maintainer ack to go in via
arm-soc. I'd also like to see an ack from Arnd since he provided a lot
of the comments. Also, we need Russell's ack on the debug and proc-v7.S
patches.

I'll note that the drivers/power maintainers aren't cced on this posting
so they probably didn't notice that driver.

-Matt
