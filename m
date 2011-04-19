From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3] uio/pdrv_genirq: Add OF support
Date: Tue, 19 Apr 2011 15:02:37 +0200
Message-ID: <201104191502.37396.arnd@arndb.de>
References: <1303116654-5042-1-git-send-email-monstr@monstr.eu> <20110419061121.GB5252@ponder.secretlab.ca> <BANLkTin0krYi+MqngSQ5n-752vDa_a8ZtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BANLkTin0krYi+MqngSQ5n-752vDa_a8ZtA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Williams <john.williams@petalogix.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Wolfram Sang <w.sang@pengutronix.de>, Michal Simek <monstr@monstr.eu>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, hjk@hansjkoch.de
List-Id: devicetree@vger.kernel.org

On Tuesday 19 April 2011, John Williams wrote:
> OK, so let's talk about this interface.  As I see it, it must be able
> to handle bind per-instance, not per compatibility.

Yes.

> For example, we make systems with multiple, identical timers.  One
> will be used as the system timer, the others need to be (optionally)
> bound to generic UIO.
> 
> Therefore, it's not OK to just do
> 
> echo "vendor,device" >> /sys/class/something/generic-uio/compatlist
> 
> or whatever, as this would bind all instances matching vendor,device.
> 
> So, the question I have is, how to handle bind per-instance?
> 
> I can accept that the generic-uio idea is permanently blocked, but
> please can we have some concrete suggestions on an approach that would
> be acceptable?

I think nobody has had a good idea so far, unfortunately. It would
be nice if you could research how libusb, vfio and qemu pci passthrough
work. Hopefully one of these uses a method that we can do here, too.

> > In the mean time, explicitly modifying the match table is an okay
> > compromise.
> 
> My mind is still boggling that in this day and age it could possibly
> be preferred to modify code, instead of a data structure.  However,
> clearly this is a lost cause!

It's preferred to do a local modification to a single kernel build over
introducing an interface that we have to maintain compatibility with
when we already know we don't want it.

	Arnd
