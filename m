From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 4/4] dt-bindings: Document the DT bindings for lan78xx
Date: Thu, 12 Apr 2018 16:17:25 +0200
Message-ID: <20180412141725.GN28963@lunn.ch>
References: <1523541336-145953-1-git-send-email-phil@raspberrypi.org>
 <1523541336-145953-5-git-send-email-phil@raspberrypi.org>
 <20180412140409.GK28963@lunn.ch>
 <0bcc10cd-2a25-311f-d006-ddefe47567dc@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0bcc10cd-2a25-311f-d006-ddefe47567dc@raspberrypi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Elwell <phil@raspberrypi.org>
Cc: Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 12, 2018 at 03:10:57PM +0100, Phil Elwell wrote:
> Hi Andrew,
> 
> On 12/04/2018 15:04, Andrew Lunn wrote:
> > On Thu, Apr 12, 2018 at 02:55:36PM +0100, Phil Elwell wrote:
> >> The Microchip LAN78XX family of devices are Ethernet controllers with
> >> a USB interface. Despite being discoverable devices it can be useful to
> >> be able to configure them from Device Tree, particularly in low-cost
> >> applications without an EEPROM or programmed OTP.
> >>
> >> Document the supported properties in a bindings file, adding it to
> >> MAINTAINERS at the same time.
> > 
> > Hi Phil
> > 
> > How you link an OF node to a USB device is not obvious. Could you
> > please include either a pointer to some binding documentation, or make
> > your example show it.
> 
> Thanks for the feedback. Would you consider this (lifted from the Pi 3B+ Device Tree)
> a sufficient example?

Yes, this is good.

Thanks
     Andrew
