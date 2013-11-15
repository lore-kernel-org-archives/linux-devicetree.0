From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] misc: bmp085: Add DT bindings for EOC gpio line and direct irq.
Date: Fri, 15 Nov 2013 19:47:50 +0100
Message-ID: <201311151947.51196.arnd@arndb.de>
References: <1384465609-26485-1-git-send-email-marek@goldelico.com> <1384465609-26485-3-git-send-email-marek@goldelico.com> <20131115153015.GD24831@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131115153015.GD24831@e106331-lin.cambridge.arm.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marek Belisko <marek@goldelico.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "neilb@suse.de" <neilb@suse.de>, "hns@goldelico.com" <hns@goldelico.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "rob@landley.net" <rob@landley.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Friday 15 November 2013, Mark Rutland wrote:
> There's some contention over the description of gpio-based IRQs in DT.
> From the point of view of the device there is a logical IRQ output; the
> fact that this happens to be wired up to a GPIO pin that can happen to
> generate interrupts isn't anything to do with the device itself. There
> are plenty of device we have now whose interrupt lines could be wired to
> GPIOs. I see no reason to extend their bindings to support explicit
> GPIOs for IRQs, and I see no reason the driver should have to handle
> this.
> 
> It would be far nicer for the device binding to just have the interrupts
> property, and for the gpio controller to act as an interrupt-controller,
> with the appropriate pin management.

Yes, agreed. I missed this point in my review: the GPIO is used only
as an interrupt pin here, so there is no reason to know the GPIO number.

	Arnd
