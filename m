From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] devicetree: Add empty of_platform_populate() for
 !CONFIG_OF_ADDRESS (sparc)
Date: Mon, 5 Mar 2012 08:10:42 -0700
Message-ID: <20120305151042.GD27229@ponder.secretlab.ca>
References: <1330121218-10442-1-git-send-email-grant.likely@secretlab.ca>
 <4F513990.1030401@ti.com>
 <20120302170715.9f0a67ef.akpm@linux-foundation.org>
 <20120303040930.1E9283E190C@localhost>
 <4F54BFD9.8000802@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4F54BFD9.8000802@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Cousson, Benoit" <b-cousson@ti.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Samuel Ortiz <sameo@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 05, 2012 at 02:30:01PM +0100, Cousson, Benoit wrote:
> On 3/3/2012 5:09 AM, Grant Likely wrote:
> >On Fri, 2 Mar 2012 17:07:15 -0800, Andrew Morton<akpm@linux-foundation.org>  wrote:
> >>All twl is broken.  i386 allmodconfig with this monring's linux-next:
> >>
> >>drivers/mfd/twl-core.c: In function 'twl_probe':
> >>drivers/mfd/twl-core.c:1357: error: implicit declaration of function 'of_platform_populate'
> >>
> >
> >This patch seems to solve it finally against irqdomain/next.  Benoit, with
> >your ack I'll push it out.
> 
> I've just built it on x86 and tested it on OMAP4 board successfully.
> 
> Acked-by: Benoit Cousson <b-cousson@ti.com>

Okay, I've pushed it out.

g.
