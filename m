From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [RFC PATCH] ARM: dts: Add support for Turris Omnia
Date: Thu, 24 Nov 2016 16:07:00 +0100
Message-ID: <20161124150700.GD7155@lunn.ch>
References: <1479851991.26813.2@smtp.gmail.com>
 <1479859770-9375-1-git-send-email-tmshlvck@gmail.com>
 <20161123003505.GL2691@lunn.ch>
 <4e3f9628-dbf8-27c1-abea-d0ef58a67e51@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4e3f9628-dbf8-27c1-abea-d0ef58a67e51@kleine-koenig.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc: Tomas Hlavacek <tmshlvck@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> @Tomas: I think it doesn't make sense when we alternate sending patches
> without prior arrangement. Do you already work on a v5? If not I can do
> that to fix the last few comments. Not sure when a submission is too
> late to enter v4.10, but I think the window isn't that big any more.

It is getting a bit late. But maybe Linus will add in another -rc
week.

> 
> > No leds? No buttons via gpio-keys?
> 
> The leds are controlled by a Cortex-M0 and without intervention blink
> according to a hardware function (network, power, pci). IMHO that's ok
> for an initial setup.

Yes. That is fine. It is just unusual. Most boards have gpio-led and
gpio-keys, which are easy to add. That is why i asked. Adding an LED
driver which talks to this M0 can be added later.

       Andrew
