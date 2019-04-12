From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 1/6] arch: riscv: add support for building DTB files from
 DT source data
Date: Thu, 11 Apr 2019 17:08:11 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1904111618460.21321@viisi.sifive.com>
References: <20190411084304.5072-2-paul.walmsley@sifive.com>
 <20190411114616.GA10032@infradead.org>
 <alpine.DEB.2.21.9999.1904111405470.19990@viisi.sifive.com>
 <3cf7f2d8-3039-7dd7-e243-77433b1f23a6@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <3cf7f2d8-3039-7dd7-e243-77433b1f23a6@wdc.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Atish Patra <atish.patra@wdc.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 11 Apr 2019, Atish Patra wrote:

> On 4/11/19 2:12 PM, Paul Walmsley wrote:
> > On Thu, 11 Apr 2019, Christoph Hellwig wrote:
> > 
> > > On Thu, Apr 11, 2019 at 01:42:59AM -0700, Paul Walmsley wrote:
> > > > Similar to ARM64, add support for building DTB files from DT source
> > > > data for RISC-V boards.
> > > > 
> > > > This patch starts with the infrastructure needed for SiFive boards.
> > > > Boards from other vendors would add support here in a similar form.
> > > 
> > > What do we build it for?  We'd really need something like this:
> > > 
> > > http://git.infradead.org/users/hch/misc.git/commitdiff/d6242aa147baf57e05e2932199c74d8d24b9926e
> > > http://git.infradead.org/users/hch/misc.git/commitdiff/0cd5413c8094ab57b68e0629dacfed695f4c1ef1
> > > 
> > > To actually use the DT files.
> > 
> > Those patches might be useful - I have not reviewed them closely - but
> > they are not necessary.
> > 
> > The FSBL already supplies a DTB to Linux.  I assume the U-boot port works
> > the same way.
> > 
> 
> I am bit confused here. I thought the idea behind putting the the DTS in
> kernel so that Kernel don't need to depend on DT passed from boot loaders.

Some users will want to do that - mostly embedded device integrators and 
kernel developers.  We should definitely support these use-cases.  So the 
basic idea behind Christoph's patch to do that is good (I have not yet 
reviewed the code nor tested it).

In fact, there has been an unofficial patch to do something similar for 
ARM for about a decade now.  But for various reasons, some technical, some 
managerial - it was never merged.  To be clear, I do agree that we should 
merge something like that for RISC-V.

However: the vast majority of users -- even embedded users -- will not use 
a kernel with a bundled DTB.  This is because it irrevocably ties that 
kernel binary to one specific board type.  I hope it is obvious why this 
would be a non-starter for Linux distributions, and, more generally, 
anyone who wants their kernels to be usable on multiple boards.  Those 
distributors would need to ship one kernel binary per board, or bloat 
their kernels with DTBs and come up with some new mechanism to select one.

> Currently, DTB passed from FSBL is modified by OpenSBI/BBL before passing to
> U-Boot or Linux.

This should be avoided whenever possible.  I'd be interested in hearing 
what OpenSBI is doing now to the DTB; perhaps there is a case where it 
makes sense.  But in general, doing this makes development and maintenance 
quite difficult.  Considre that different operating systems that may use 
the same SBI layer may use different DT data formats, or may not even use 
DT at all.  And when the DT data format changes - as is happening now - a 
maintenance hassle is created, since then versions across multiple pieces 
of software may need to be synchronized.  It is also very disconcerting as 
a kernel developer to have multiple pieces of software modifying one's 
DTB.

The DT data is meant to represent hardware fact.  DT is also used to pass 
in some non-hardware-related runtime configuration parameters, via the 
"chosen" node.  But that's about it.  So from that point of view, only the 
first-stage bootloader should be altering the DT data, and only then in 
very minimal ways.

> If Linux kernel can boot from the DTS contained within its source code as is,
> that would be much more helpful.

If you are thinking about embedded system builders, and developers who 
only care about their test kernel being compatible with one board, I agree 
with you for those specific use-cases.  Almost everyone else will pass in 
a separate DTB, specific to the board they are using, from U-Boot or 
Coreboot or GRUB.

> > I haven't switched to U-boot yet for these driver tests, so I 
> > personally have been using the open-source FSBL 
> > (freedom-u540-c000-bootloader) with the following trivial patches 
> > applied:
> > 
> > https://github.com/sifive/freedom-u540-c000-bootloader/tree/dev/paulw/supply-fsbl-dtb-v5.1-rc4
> 
> > The fsbl/ux00_fsbl.dtb file can be symlinked to the kernel DTB output,
> > e.g., ~/linux/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dtb.
> 
> This assumes that FSBL has to be rebuilt every time I want to change the DT. I
> was hoping to avoid that.

The FSBL is on its way out.  It is just a short-term workaround until the 
various popular bootloader ports become more stable.  After that happens, 
it's likely that almost no one to use the current SiFive FSBLs.  We plan 
to transition our Freedom-U development environment away from it 
ourselves.

The point of what I wrote to Christoph earlier is simply that everyone is 
already using DTB data that is passed in from an early bootloader, whether 
they realize it or not.  So there is an existence proof that no additional 
patches are needed for the basics to function.  It may not be functioning 
well in some cases, and may need patching; but that is a separate matter.


- Paul
