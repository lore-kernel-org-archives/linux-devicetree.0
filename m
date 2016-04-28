From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH v2 1/2] ARM: bcm2835: dt: Add the ethernet to the device
 trees
Date: Thu, 28 Apr 2016 18:29:47 +0200
Message-ID: <1461860987.3780.24.camel@v3.sk>
References: <1454571364-24708-1-git-send-email-lkundrak@v3.sk>
	 <1454571364-24708-2-git-send-email-lkundrak@v3.sk>
	 <56B572D8.9030701@wwwdotorg.org> <m3wpnhrj42.fsf@euphor.blino.org>
	 <572239A4.3030100@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <572239A4.3030100@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>, Olivier Blin <dev@blino.org>, eric@anholt.net
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Peter Chen <peter.chen@freescale.com>, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 2016-04-28 at 18:26 +0200, Stefan Wahren wrote:
> Hi Olivier
> 
> Am 28.04.2016 um 14:52 schrieb Olivier Blin:
> > 
> > Stephen Warren <swarren@wwwdotorg.org> writes:
> > 
> > > 
> > > On 02/04/2016 12:36 AM, Lubomir Rintel wrote:
> > > > 
> > > > The hub and the ethernet in its port 1 are hardwired on the
> > > > board.
> > > > 
> > > > Compared to the adapters that can be plugged into the USB
> > > > ports, this
> > > > one has no serial EEPROM to store its MAC. Nevertheless, the
> > > > Raspberry Pi
> > > > has the MAC address for this adapter in its ROM, accessible
> > > > from its
> > > > firmware.
> > > > 
> > > > U-Boot can read out the address and set the local-mac-address
> > > > property of the
> > > > node with "ethernet" alias. Let's add the node so that U-Boot
> > > > can do its
> > > > business.
> > > > 
> > > > Model B rev2 and Model B+ entries were verified by me, the
> > > > hierarchy and
> > > > pid/vid pair for the Version 2 was provided by Olivier Blin.
> > > > Original
> > > > Model B is a blind short, though very likely correct.
> > > The series,
> > > Tested-by: Stephen Warren <swarren@wwwdotorg.org>
> > > 
> > > A few nits though...
> > [...]
> > 
> > Is this still being queued in some tree?
> > Or does it need more fixes and a resubmit?
> Yes, a V3 should address the comments from Peter and Stephen.

I'll follow up with an updated patch set.

Sorry for the delay.

> 
> Regards
> Stefan
> 
> > 
> > 
> > Without this, Raspberry Pi devices boot with a random MAC address.
> > 
> 
