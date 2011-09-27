From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/3] mfd: allow mfd_cell association with device tree node
Date: Tue, 27 Sep 2011 16:18:51 +0100
Message-ID: <20110927151850.GN4289@opensource.wolfsonmicro.com>
References: <20110921120148.4A81E9D401D@zog.reactivated.net>
 <20110921124936.GA25620@sirena.org.uk>
 <CAMLZHHQZnajC4e12MjaK3W8WcAB2ZB+6L=5kS5BBFZF=+YWicQ@mail.gmail.com>
 <20110921131637.GF4374@opensource.wolfsonmicro.com>
 <CAMLZHHTJaOddSj00g0-WpFQu6pUTqizKjKaQF9hLrhceEMhY1Q@mail.gmail.com>
 <20110927150555.GF20588@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110927150555.GF20588@ponder.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Daniel Drake <dsd@laptop.org>, sameo@linux.intel.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, dilinger@queued.net
List-Id: devicetree@vger.kernel.org

On Tue, Sep 27, 2011 at 09:05:55AM -0600, Grant Likely wrote:
> On Tue, Sep 27, 2011 at 03:44:56PM +0100, Daniel Drake wrote:
> > On Wed, Sep 21, 2011 at 2:16 PM, Mark Brown

> > > My suspicion is that for device tree in cases where the MFD really is
> > > totally independent of the parent we shouldn't need explicit MFD code to
> > > instantiate the child at all any more in the same way that we should be
> > > avoiding this for the SoCs.

> Right. MFD seems to be most useful when IP blocks are used in multiple
> places and can be instantiated by multiple parents.  Sometimes a
> driver really should just register the interfaces that the device
> provides without the MFD framework.

Well, if you need a bunch of platform devices it's a good way of
creating them especially in the current world.  There's also generally
some core logic, for example routing interrupt lines, that can usefully
be provided by the MFD part of the driver.
