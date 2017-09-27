From: Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
Subject: RISC-V Linux Port v9
Date: Tue, 26 Sep 2017 18:56:26 -0700
Message-ID: <20170927015638.19443-1-palmer@dabbelt.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-q3qR2WxjNRFS9aJRtSZj7A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, albert-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, mmarek-IBi9RG/b67k@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, boqun.feng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

As per suggestions on our v8 patch set, I've split the core architecture code
out from our drivers and would like to submit this patch set to be included
into linux-next, with the goal being to be merged in during the next merge
window.  This patch set is based on 4.14-rc2, but if it's better to have it
based on something else then I can change it around.

This patch set contains just the core arch code for RISC-V, so while it builds
an nominally boots, you can't print or take an interrupt so it's not that
useful.  If you're looking to actually boot a system it would probably be
better to use the full patch set listed below.  We're in the process of
cleaning up our drivers so we can submit them to the relevant maintainers, but
I thought it was most important to get the core code in shape first.

We've collected a handful of tags from reviewers, and the remainder of the
patch set only got minimal feedback last time.  Here's what changed:

 * We now use the device tree to initialize the timer driver so it's less
   tighly coupled with the arch port.
 * I cleaned up the defconfigs -- there's actually now just one, and it's
   empty.  For now I think we're OK with what the kernel sets as defaults, but
   I anticipate we'll begin to expand this as people start to use the port
   more.
 * The VDSO symbols version is sane.
 * We WFI while spinning in the boot loop.
 * A handful of comments have been added.

While there are still a handful of FIXMEs in this patch set, we've started to
get enough interest from various users and contributors that maintaining an out
of tree patch set is starting to become a big burden.  I'm hoping the patches
are good enough that we can get them merged soon, as that way everyone will be
able to work in a more reasonable fashion.  I believe I've taken into account
everyone's feedback, but if I've missed anything please just ping me.

This patch set is also availiable on github

  https://github.com/riscv/riscv-linux/tree/riscv-for-submission-v9-arch

as is the entire patch set necessary to get a more functional RISC-V system up
and running, including a handful of patches that aren't ready for upstream yet.

  https://github.com/riscv/riscv-linux/tree/riscv-for-submission-v9

Thanks!



Here's the full patch list, in case something gets lost:

[PATCH v9 01/12] MAINTAINERS: Add RISC-V
[PATCH v9 02/12] lib: Add shared copies of some GCC library routines
[PATCH v9 03/12] dt-bindings: RISC-V CPU Bindings
[PATCH v9 04/12] RISC-V: Init and Halt Code
[PATCH v9 05/12] RISC-V: Atomic and Locking Code
[PATCH v9 06/12] RISC-V: Generic library routines and assembly
[PATCH v9 07/12] RISC-V: ELF and module implementation
[PATCH v9 08/12] RISC-V: Task implementation
[PATCH v9 09/12] RISC-V: Device, timer, IRQs, and the SBI
[PATCH v9 10/12] RISC-V: Paging and MMU
[PATCH v9 11/12] RISC-V: User-facing API
[PATCH v9 12/12] RISC-V: Build Infrastructure




Here's the change highlights from the whole patch set:

(v8) I know it may not be the ideal time to submit a patch set right now, as
it's the middle of the merge window, but things have calmed down quite a bit in
the last month so I thought it would be good to get everyone on the same page.
There's been a handful of changes since the last patch set, but most of them
are fairly minor:

* We changed PAGE_OFFSET to allowing mapping more physical memory on 64-bit
  systems.  This is user configurable, as it triggers a different code model
  that generates slightly less efficient code.
* The device tree binding documentation is back, I'd managed to lose it at some
  point.
* We now pass the atomic64 test suite.  The SBI timer driver has been
* refactored.

(v7) It's been a while since my last patch set, but the changes han been fairly
minimal:

 * The PCI cleanup patches have been dropped, we'll do them as a separate patch
   set later.
 * We've the Kconfig entries from CONFIG_ISA_* to CONFIG_RISCV_ISA_*, to make
   grep easier.
 * There have been a handful of memory model related tweaks in I/O land,
   particularly relating the PCI and the upcoming platform specification.
   There are significant comments in the relevant files.  This is still a WIP,
   but I think we're close to getting as good as we're going to get until we
   end up with some more specifications.

(v6) As it's been only a day since the v5 patch set, the changes are pretty
minimal:

 * The patch set is now based on linux-next/master, which I believe is a better
   base now that we're getting closer to upstream.
 * EARLY_PRINTK is no longer an option.  Since the SBI console is reasonable,
   there's no penalty to enabling it (and thus no benefit to disabling it).
 * The mmap syscalls were refactored a bit.

(v5) Things have really started to calm down, so this is fairly similar to the
v4 patch set.  The most interesting changes include:

 * We've moved back to a single patch set.

 * SMP support has been fixed, I was accidentally running on a non-SMP
   configuration.  There were various mistakes all over the tree as a result of
   this.

 * The cmpxchg syscalls have been removed, as they were deemed a bad idea.  As
   a result, RISC-V Linux systems mandate the A extension.  The corresponding
   Kconfig entry to enable builds on non-A systems has been removed.

 * A few more atomic fixes: mostly fence changes, but those resulted in a
   handful of additional macros that were no longer necessary.

 * riscv_early_sie has been removed.

(v4) There have only been a few changes since the v3 patch set:

 * The cmpxchg64 syscall is no longer enabled on 32-bit systems.  It's not
   possible to provide this on SMP systems, and it's not necessary as glibc
   knows not to call it.

 * We provide a ELF_HWCAP so users can determine the ISA of the machine the
   kernel is running on.

 * The multi-line comments are in a better form.

 * There were a handful of headers that could be replaced with the asm-generic
   versions, and a few unnecessary definitions.

 * We no longer use printk, but instead use pr_*.

 * A few Kconfig and defconfig entries have been cleaned up.

(v3) A highlight of the changes since the v2 patch set includes:

 * We've split out all our drivers into separate patch sets, which I've already
   sent out to the relevant maintainers.  I haven't included those patches in
   this patch set, but some of them are necessary to build our port.  A git
   tree that contains all our patch sets merged together lives at
   <https://github.com/riscv/riscv-linux/tree/riscv-for-submission-v3>.

 * The patch set is now split up differently: rather than being split per
   directory it is split per topic.  Hopefully this will make it easier to
   review the port on the mailing list.  The split is a bit rough, so you
   probably still want to look at the patch set as a whole.

 * atomic.h has been completely rewritten and is hopefully now correct.  I've
   attempted to sanitize the various other memory model related code as well,
   and I think it should all be sane now aside from a handful of FIXMEs
   commented in the code.

 * We've changed the cmpexchg syscall to always exist and to not be
   multiplexed.  There is also a VDSO entry for compare and exchange, which
   allows kernels with the A extension to execute user code without the A
   extension reasonably fast.

 * Our user-visible register state now contains enough space for the Q
   extension for 128-bit floating point, as well as a few words to allow
   extensibility to future ISA extensions like the eventual V extension for
   vectors.

 * A handful of driver cleanups, but these have been split into separate patch
   sets now so I won't duplicate them here.

(v2) A highlight of the changes since the v1 patch set includes:

  * We've split out our drivers into the right places, which means now there's
    a lot more patches.  I'll be submitting these patches to various subsystem
    maintainers and including them in any future RISC-V patch sets until
    they've been merged.

  * The SBI console driver has been completely rewritten to use the HVC helpers
    and is now significantly smaller.

  * We've begun to use weaker barriers as opposed to just the big "fence".
    There's still some work to do here, specifically:
    - We need fences in the relaxed MMIO functions.
    - The non-relaxed MMIO functions are missing R/W bits on their fences.
    - Many AMOs need the aq and rl bits set.

  * We now have thread_info in task_struct.  As a result, sscratch now contains
    TP instead of SP.  This was necessary because thread_info is no longer on
    the stack.

  * A few shared routines have been added that we use instead of creating
    another arch copy.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
