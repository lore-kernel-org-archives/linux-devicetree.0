Return-Path: <devicetree-owner@vger.kernel.org>
Received: from hermes.synopsys.com ([198.182.44.81]:56950 "EHLO
	hermes.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932768Ab3HNURD convert rfc822-to-8bit (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2013 16:17:03 -0400
From: Paul Zimmerman <Paul.Zimmerman@synopsys.com>
Subject: RE: Non-enumerable devices on USB and other enumerable buses
Date: Wed, 14 Aug 2013 20:16:56 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E030458DE9E22@US01WEMBX2.internal.synopsys.com>
References: <20130814184643.GL2401@sirena.org.uk>
 <Pine.LNX.4.44L0.1308141514440.1701-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1308141514440.1701-100000@iolanthe.rowland.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>, Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Felipe Balbi <balbi@ti.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

> From: Alan Stern
> Sent: Wednesday, August 14, 2013 12:39 PM

> Now I'm getting confused.  It seems we're talking about at least three
> very different things here:
> 
>      A: Devising a mechanism for platform code to do things involving
> 	devices that are dynamically registered on discoverable buses.
> 
>      B: Telling the subsystem and driver code for a discoverable bus
> 	that a particular device is present before it has been
> 	detected.
> 
>      C: Implementing a mechanism whereby drivers can take a device
> 	off-line while still pretending to userspace that the device
> 	is still present, by bringing it back on-line as needed.
> 
> I don't see much connection between these things.  Perhaps you can
> explain in more detail.
> 
> (BTW, it's worth mentioning that C has already been done, in the form
> of runtime PM.  The difference may be that you propose to take the
> device so far off-line that it disappears from the bus.  AFAICS, this
> would be purely a private matter to be arranged between the subsystem
> and the driver; it does not need to be handled at the level of the
> device-model or PM core.)

Mark's original complaint about USB was this:

> One example that's bugging me right now is that on the Insignal Arndale
> platform there's a USB hub connected to one of the USB ports on the SoC
> (not as a PHY, it seems we also need the internal PHY running to talk to
> the device).  The hub needs to be "plugged" into the SoC after the SoC
> USB controller has started with some GPIOs so we need to tell the system
> that the hub exists and needs to be synchronised with the USB controller.

This sounds to me like the normal discovery mechanism for USB isn't getting
kicked off because no Connect Status Change is being triggered on the root
port when the hub is brought online using the GPIOs. Maybe the port has
been runtime suspended because no device was attached originally?

So maybe the only thing needed for USB is a way to tell the parent port to
frob its port control bits to try to determine if a device is now present.
(set Wake on Connect Enable? Do a Port Reset? Cycle the Port Power bit if
possible?)

-- 
Paul

