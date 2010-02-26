From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: Proposal to move PCI out of arch/powerpc and into drivers/of
Date: Fri, 26 Feb 2010 15:44:25 -0800
Message-ID: <20100226154425.00dde291@jbarnes-piketon>
References: <27bab769-0788-4b48-96a7-ced65e40144c@SG2EHSMHS007.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <27bab769-0788-4b48-96a7-ced65e40144c@SG2EHSMHS007.ehs.local>
Sender: linux-kernel-owner@vger.kernel.org
To: John Linn <John.Linn@xilinx.com>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@ozlabs.org, linuxppc-dev@ozlabs.org, microblaze-uclinux@itee.uq.edu.au, grant.likely@secretlab.ca, John Williams <john.williams@petalogix.com>, michal.simek@petalogix.com, benh@kernel.crashing.org
List-Id: devicetree@vger.kernel.org

On Fri, 26 Feb 2010 16:07:59 -0700
John Linn <John.Linn@xilinx.com> wrote:

> Hi all,
> 
> We are in the process of putting PCI/PCIe into the microblaze
> architecture.  
> 
> In order to not duplicate/fork the PCI code in Powerpc, we're
> proposing to move the PCI code from arch/powerpc into drivers/of such
> that it would be common code for Powerpc and MicroBlaze.
> 
> This would be the 1st part of a refactoring that would occur with the
> PCI code.
> 
> Ben H., would you mind if that happened (move arch/powerpc/kernel/pci*
> to drivers/of/*)?

Dave and Ben have been talking about this for awhile; seems like a good
excuse to do it.  IIRC they had even thought about just dumping the
code directly into drivers/pci so that API updates won't get missed...

-- 
Jesse Barnes, Intel Open Source Technology Center
