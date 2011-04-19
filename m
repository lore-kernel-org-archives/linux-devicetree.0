From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3] uio/pdrv_genirq: Add OF support
Date: Tue, 19 Apr 2011 09:32:31 +0200
Message-ID: <201104190932.31777.arnd@arndb.de>
References: <1303116654-5042-1-git-send-email-monstr@monstr.eu> <BANLkTimFnfgiQ5aMq_KwqHP8p92pjOJJwg@mail.gmail.com> <20110419061121.GB5252@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110419061121.GB5252@ponder.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: John Williams <john.williams@petalogix.com>, Wolfram Sang <w.sang@pengutronix.de>, Michal Simek <monstr@monstr.eu>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, hjk@hansjkoch.de
List-Id: devicetree@vger.kernel.org

On Tuesday 19 April 2011, Grant Likely wrote:
> On Tue, Apr 19, 2011 at 11:58:25AM +1000, John Williams wrote:
> >
> > I know the arguments against the 'generic-uio' tag, but come on, let's
> > look at the lesser of two evils here!  I call BS on this DTS purity.

Both a specific device ID and something like "generic-uio" are
equally broken:

If you have generic-uio, it is impossible to write an in-kernel driver
for the same hardware without changing the device tree, meaning that
it is impossible to correctly describe the hardware in the device tree.

If you put a meaningful identifier into the match table, it is also
impossible to have an in-kernel driver for the hardware, because now
you have no way to choose whether to handle the device with UIO
or an in-kernel driver.

There may be cases where you have two instances of the same device
in a machine and  want one of them to be driven by UIO and the other
by another driver. A common example of this would be a virtual machine
where one device is passed through to the guest and the other is
used by the host. I've done this for USB input devices and PCI network
interfaces.
 
> Call it what you like, but the reasons are well founded.  The alternative
> that has been proposed which I am in agreement with is to investigate
> giving userspace the hook to tell the kernel at runtime which devices
> should be picked up by the uio driver.

Yes, I believe this is the best option.

> In the mean time, explicitly modifying the match table is an okay
> compromise.

Agreed.

	Arnd
