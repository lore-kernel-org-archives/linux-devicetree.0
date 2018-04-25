From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/7] gnss: add new GNSS subsystem
Date: Wed, 25 Apr 2018 10:11:20 +0200
Message-ID: <20180425081120.GL4615@localhost>
References: <20180424163458.11947-1-johan@kernel.org>
 <31CF06C6-D6ED-4930-8D81-12256A518059@goldelico.com>
 <20180424175050.GG4615@localhost>
 <8F4FAF5B-AAA9-4D46-A022-99B96C74ABFA@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8F4FAF5B-AAA9-4D46-A022-99B96C74ABFA@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 24, 2018 at 09:44:08PM +0200, H. Nikolaus Schaller wrote:

> > Am 24.04.2018 um 19:50 schrieb Johan Hovold <johan@kernel.org>:

> > I think it should be done the other way round (if I understand you
> > correctly), that is, by adding support for configurations were WAKEUP is
> > left not connected to the sirf driver instead.
> 
> Hm. Yes, the w2sg00x4 is a Sirf based chip.
> 
> > I had that use-case in mind when implementing
> 
> s/implementing/reinventing/
> 
> > the driver, and some ideas of how it should be
> > done, but did not get around to actually implement it yet.
> 
> What do you need ideas for? We have that function working and
> submitted year after year, but it was always rejected for API
> reasons.
> 
> You could have simply reused what we have proposed [1] and just
> adapt it to the new API instead of writing a new driver (which
> is missing some features for us).

Your code was broken or needed to be updated in several ways as I
pointed out in the thread you refer to.

It also did not support all those systems that use the same family of
chips, but which has the WAKEUP signal connected.

> "proof-of-concept" is misleading if you expect this to become
> *the* Sirf driver and we are just invited to add some features
> to that. Making our own work and proposals completely obsolete.
> 
> What I find really strange and foul play is that we are in the
> review process and then comes a hidden counter-proposal by the
> reviewer.

Dude, in the very same thread you refer to above, after being asked to
reiterate your proposal to find and appropriate abstraction level you
reply:

	"Yes, please feel free to write patches that implement it that
	way."

Now I've done just that for you, and then you whine about that too.

SiRF is a very common chip and I wanted to make sure that the common
setup with WAKEUP connected was supported from the start. I'll get to
your configuration in time too.

Johan

> [1]: https://patchwork.ozlabs.org/cover/843392/
