From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: RFC: ARM Boot standard for passing device tree blob
Date: Thu, 25 Mar 2010 21:04:09 +0000
Message-ID: <20100325210409.GH24984@n2100.arm.linux.org.uk>
References: <fa686aa41003240811l6f40c8cfs6fdad496facdc089@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <fa686aa41003240811l6f40c8cfs6fdad496facdc089@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Rafal Jaworowski <raj@semihalf.com>, Philippe Robin <Philippe.Robin@arm.com>, David Rusling <David.Rusling@arm.com>, Jeremy Kerr <jeremy.kerr@canonical.com>, Dave P Martin <Dave.Martin@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 24, 2010 at 09:11:56AM -0600, Grant Likely wrote:
> Hi all,
> 
> Since work is being done to add ARM Flattened Device Tree support to
> both Linux and FreeBSD, I think it would be worth while to agree on a
> common boot interface for passing a device tree blob from firmware to
> the kernel (or in the case of kexec, from the old to new kernels).
> I've drafted up something quickly on fdt.secretlab.ca.  The page can
> be found here:
> 
> http://fdt.secretlab.ca/Boot_Environment#ARM
> 
> Feel free to modify the draft on the wiki if you notice any missing
> details.  I've also posted the current text below so it is easy to
> review and comment on.
> 
> (btw, the wiki at fdt.secretlab.ca should be moving to devicetree.org
> in the near future, but I'll keep the old domain name around.
> devicetree.org will be used to document new device tree bindings in an
> OS-agnostic location.)
> 
> 
> == ARM ==
> See Documentation/arm/Booting and arch/arm/include/asm/setup.h in the
> Linux kernel source tree for background information.  Some of the
> content of this section is extracted from those files.
> 
> '''Draft'''
> 
> ===Required System State===
> *Quiesce all DMA
> *CPU register contents
> **r0 = 0
> **r1 = Linux machine number (as defined in the ARM Linux machine database) or 0

0 is a valid machine number.  What is your purpose of passing 0?

> **r2 = physical address of tagged parameter list in system RAM
> *IRQs disabled
> *MMU off
> *Instruction cache either on or off
> *Data cache turned off

Would recommend saying "Data cache(s) turned off" so that L2 cache is
included.

> ===Minimal state for Flattened Device Tree Boot===
> For FDT booting, the tagged list only needs to contain a single device
> tree tag, and the device tree blob could be appended to the end of the
> tagged list so that everything resides in the same region of memory.

That's a bad idea.  Sometimes the tagged list can be extended by wrappers
around the kernel, and data placed at the end of the list would be
overwritten.

As the tagged list can encode arbitarily sized data chunks, there's no
reason to use a pointer in the tagged list.  However, there is a problem:
what do you do with a large chunk of data in the tagged list?  You can't
allocate memory to copy it in the kernel because no memory allocators
are up and running...

That's always been the catch-22 with passing binary data blobs to the
kernel.
