From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/3] mfd: allow mfd_cell association with device tree
 node
Date: Mon, 3 Oct 2011 11:28:47 +0100
Message-ID: <20111003102846.GA23811@sirena.org.uk>
References: <20110927150555.GF20588@ponder.secretlab.ca>
 <CAMLZHHQU-eMAtvBQJj6+WrMjkWWA+ET=z5NdQCEgXxh=m10d3Q@mail.gmail.com>
 <20110927181420.GQ4289@opensource.wolfsonmicro.com>
 <CAMLZHHSuoeAJ-AC9daxb83+EANV=YGK-aiYpQ_j2wFiyQa5ytw@mail.gmail.com>
 <20110927182636.GR4289@opensource.wolfsonmicro.com>
 <CAMLZHHR0rMZct2E91X8k+Lhv_y-pY_5+vshZw6dj194o9vSCJQ@mail.gmail.com>
 <20110927183832.GS4289@opensource.wolfsonmicro.com>
 <CAMLZHHRvr-diYGwZ2Kg647Ht7NNb8LEku0pCW8EujRuUeOW5yQ@mail.gmail.com>
 <20110928123154.GG3279@opensource.wolfsonmicro.com>
 <CAMLZHHRFY_MazF_MOzPrS06z-48-ohORTtbANMxUT=mjevXhhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMLZHHRFY_MazF_MOzPrS06z-48-ohORTtbANMxUT=mjevXhhQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Drake <dsd@laptop.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, sameo@linux.intel.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, dilinger@queued.net
List-Id: devicetree@vger.kernel.org

On Mon, Oct 03, 2011 at 09:40:10AM +0100, Daniel Drake wrote:
> On Wed, Sep 28, 2011 at 1:31 PM, Mark Brown
> > Right, but your modification was to the MFD core so it's going to affect
> > other devices...

> But only when they start using the newly added functionality. At this
> point, it affects nobody except vx855.

I'd really expect that if we're adding stuff to the framework then it
should be suitable for random drivers to use.  To be honest I don't
really understand why you're changing the framework at all here, the
child driver is entirely specific to the parent as far as I can see.
