From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 09/32] bcm2837-rpi-3-b.dts for 32bit arm
Date: Thu, 02 Jun 2016 17:23:22 +0200
Message-ID: <71381147.fkGgHS4v7X@wuerfel>
References: <1464817421-8519-1-git-send-email-kraxel@redhat.com> <4795604.XAe8xnhung@wuerfel> <1464880291.24775.111.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464880291.24775.111.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thursday, June 2, 2016 5:11:31 PM CEST Gerd Hoffmann wrote:
> 
> > > > > Reference to ../../../arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
> > > > > directly in the Makefile?
> 
> Actually tried that, and to my surprise this worked fine for both "make
> dtbs" and "make dtbs_install".
> 
> So we should just do that I guess ...

Right.

> > > Yes, in theory.  No, in practice.  As far I know the rpi3 is the only
> > > 64bit soc where a almost identical 32bit version exists, so running
> > > 32bit kernels on a 64bit processor actually happens in practice and I
> > > expect this to continue.  If you want create sdcard images which run on
> > > any rpi variant this is pretty much the only reasonable way to do it.
> > 
> > I think the Allwinner A64 and the Samsung s5p6818 are other examples
> > for this, where the initial run of boards all run 32-bit kernels
> > for much of the same reasons. If users want to run a 32-bit distro
> > on rpi-3 and on e.g. orange-pi, I don't see why they wouldn't also run
> > the same binary on A64.
> 
> ... and others can join the party on a case-by-case basis.
> 
> I still expect for the majority of arm64 boards it is not very useful,
> so I don't think we should build all of them unconditionally.

Well, they are still controlled by Kconfig symbols. Some of them
are shared between arm and arm64 and you would just get all dtbs in that
case, while other symbols are specific to one of the two.

Just for fun, which machines do we actually get if we decide to
just enter the arch/arm64/boot/dts/ directory in an allmodconfig
build?

	Arnd
