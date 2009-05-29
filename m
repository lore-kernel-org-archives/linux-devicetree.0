From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Fri, 29 May 2009 13:34:11 +0100
Message-ID: <20090529123411.GB14650@rakim.wolfsonmicro.main>
References: <20090527234801.GP6805@pengutronix.de> <4A1DD3A0.3010501@freescale.com> <20090528000707.GR6805@pengutronix.de> <20090527.171525.204909140.davem@davemloft.net> <20090528103745.GA19523@sirena.org.uk> <fa686aa40905281532l76996593ocdc36760eb468e04@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759382AbZE2MeU@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fa686aa40905281532l76996593ocdc36760eb468e04@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: David Miller <davem@davemloft.net>, r.schwebel@pengutronix.de, scottwood@freescale.com, devicetree-discuss@ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk, yuan-bo.ye@motorola.com, timur@freescale.com, rmk@arm.linux.org.uk
List-Id: devicetree@vger.kernel.org

On Thu, May 28, 2009 at 04:32:40PM -0600, Grant Likely wrote:

> and half-assed example of this).  However, when it comes to complex
> configurations that cannot be easily described, I'm all for using
> platform specific code.

Indeed, and I do appreciate this.  The problem in the audio area is more
when new people come along since everyone working with the device tree
expects to be able to use the device tree to cover everything which
means going round things again and explaining how non-trivial that would
be.

> In fact, I may have been premature in pursuing the generic description
> and generic fabric driver approach for the MPC5200 audio driver.  It
> may have been better to get a few similar MPC5200 boards under our
> belt before trying to identifying the common cases.

Sure.  My only big concern with it is that it compeltely sidesteps
clocking decisions so there's a lot of codecs it's not going to be
immediately useful with and I don't have a clear idea how it could be
extended to be so.  Most other things look like they can be added on
fairly easily when required.

It'd also be nice if there were a way for systems to say that they're
able to use it but that's getting back to the whole OS-specifics in the
device tree thing.
