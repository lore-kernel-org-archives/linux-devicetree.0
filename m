From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/7] gnss: add new GNSS subsystem
Date: Wed, 25 Apr 2018 12:31:29 +0200
Message-ID: <20180425103129.GO4615@localhost>
References: <20180424163458.11947-1-johan@kernel.org>
 <20180425084819.GA13295@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180425084819.GA13295@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 25, 2018 at 10:48:19AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 24, 2018 at 06:34:51PM +0200, Johan Hovold wrote:
> > This series adds a new subsystem for GNSS receivers (e.g. GPS
> > receivers).
> 
> YEAH!!!!
> 
> Thanks so much for doing this, great work!

Thanks!

> > This all seems to work well-enough (e.g. with gpsd), but please let me
> > know if I've overlooked something which would indeed require a TTY
> > interface instead.
> > 
> > As proof-of-concept I have implemented drivers for receivers based on
> > two common GNSS chipsets (SiRFstar and u-blox), but due to lack of
> > hardware these have so far only been tested using mockup devices and a
> > USB-serial-based GPS device (using out-of-tree code). [ Let me know if
> > you've got any evalutation kits to spare. ]
> > 
> > Finally, note that documentation (including kerneldoc) remains to be
> > written, but hopefully this will not hinder review given that the
> > current interfaces are fairly self-describing.
> 
> Is this just a RFC, or a "here's a first cut at submitting this, review
> it please!" submission?  I'm glad to review if you think it's worth it
> at this point.

It's more than just an RFC, so thanks for starting to review it.

Johan
