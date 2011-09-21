From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/3] mfd: allow mfd_cell association with device tree node
Date: Wed, 21 Sep 2011 14:16:38 +0100
Message-ID: <20110921131637.GF4374@opensource.wolfsonmicro.com>
References: <20110921120148.4A81E9D401D@zog.reactivated.net>
 <20110921124936.GA25620@sirena.org.uk>
 <CAMLZHHQZnajC4e12MjaK3W8WcAB2ZB+6L=5kS5BBFZF=+YWicQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMLZHHQZnajC4e12MjaK3W8WcAB2ZB+6L=5kS5BBFZF=+YWicQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Drake <dsd@laptop.org>
Cc: grant.likely@secretlab.ca, sameo@linux.intel.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, dilinger@queued.net
List-Id: devicetree@vger.kernel.org

On Wed, Sep 21, 2011 at 02:02:43PM +0100, Daniel Drake wrote:

> Thanks for reviewing.
> The data can still be static, not needing allocation, it just has to
> be modified at runtime. See patch 2.

Right, but that means that you need to take a copy before using it
otherwise two devices of the same type might get into a fight with each
other.

> Not sure how the MFD cells could get at the OF node by using the
> parent device - if the parent device had a OF node, wouldn't this
> correspond to the parent instead of the child? Also, as far as I can

Well, obviously.  But then with a lot of MFDs (including this one, the
GPIO driver is entirely specific to the parent) it's not clear that we
should be splitting the device up in the device tree in the first place
- our use of MFDs is a Linux implementation detail.  If the child is
specific to the parent it can cooperate with the parent device happily.

My suspicion is that for device tree in cases where the MFD really is
totally independent of the parent we shouldn't need explicit MFD code to
instantiate the child at all any more in the same way that we should be
avoiding this for the SoCs.

> see, platform data is passed to the child in exactly the same way - by
> including it in the mfd_cell definition - see mfd_add_device():

Indeed, I have the same concerns there.  
