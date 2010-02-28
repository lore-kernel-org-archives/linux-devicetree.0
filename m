From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: Proposal to move PCI out of arch/powerpc and into drivers/of
Date: Sun, 28 Feb 2010 11:33:06 +1100
Message-ID: <1267317186.23523.1860.camel@pasglop>
References: <27bab769-0788-4b48-96a7-ced65e40144c@SG2EHSMHS007.ehs.local>
	 <20100226154425.00dde291@jbarnes-piketon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100226154425.00dde291@jbarnes-piketon>
Sender: linux-kernel-owner@vger.kernel.org
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: John Linn <John.Linn@xilinx.com>, linux-kernel@vger.kernel.org, devicetree-discuss@ozlabs.org, linuxppc-dev@ozlabs.org, microblaze-uclinux@itee.uq.edu.au, grant.likely@secretlab.ca, John Williams <john.williams@petalogix.com>, michal.simek@petalogix.com
List-Id: devicetree@vger.kernel.org

On Fri, 2010-02-26 at 15:44 -0800, Jesse Barnes wrote:
> 
> Dave and Ben have been talking about this for awhile; seems like a
> good
> excuse to do it.  IIRC they had even thought about just dumping the
> code directly into drivers/pci so that API updates won't get
> missed... 

Depends which part. Not -all- of our PCI code as John seems to want.

The bits that generate PCI devices from the device-tree, for sure,
though again, even there, there are quite a few dependencies on
constructs and data structures that are powerpc specific, or even ppc64
specific in some cases, and that would have to be cleaned up and/or
abstracted first.

Cheers,
Ben.
