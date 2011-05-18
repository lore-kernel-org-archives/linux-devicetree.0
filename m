From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH 1/2] of: fix race when matching drivers
Date: Wed, 18 May 2011 12:54:49 -0700
Message-ID: <20110518195449.GA28653@suse.de>
References: <20110518185751.28986.69446.stgit@ponder>
 <20110518192100.28986.94335.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <sparclinux-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110518192100.28986.94335.stgit@ponder>
Sender: sparclinux-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Milton Miller <miltonm@bga.com>, sparclinux@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, David Miller <davem@davemloft.net>, Josip Rodin <joy@entuzijast.net>
List-Id: devicetree@vger.kernel.org

On Wed, May 18, 2011 at 01:21:00PM -0600, Grant Likely wrote:
> From: Milton Miller <miltonm@bga.com>
> 
> If two drivers are probing devices at the same time, both will write
> their match table result to the dev->of_match cache at the same time.
> 
> Only write the result if the device matches.
> 
> In a thread titled "SBus devices sometimes detected, sometimes not",
> Meelis reported his SBus hme was not detected about 50% of the time.
> >From the debug suggested by Grant it was obvious another driver matched
> some devices between the call to match the hme and the hme discovery
> failling.
> 
> Reported-by: Meelis Roos <mroos@linux.ee>
> Signed-off-by: Milton Miller <miltonm@bga.com>
> [grant.likely: modified to only call of_match_device() once]
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>

Acked-by: Greg Kroah-Hartman <gregkh@suse.de>

