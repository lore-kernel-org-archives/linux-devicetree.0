From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v9 04/12] RISC-V: Init and Halt Code
Date: Thu, 5 Oct 2017 12:01:12 +0100
Message-ID: <20171005110111.GB4929@leverpostej>
References: <20170927015638.19443-1-palmer@dabbelt.com>
 <20170927015638.19443-5-palmer@dabbelt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170927015638.19443-5-palmer@dabbelt.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Arnd Bergmann <arnd@arndb.de>, sfr@canb.auug.org.au, Olof Johansson <olof@lixom.net>, linux-kernel@vger.kernel.org, patches@groups.riscv.org, robh+dt@kernel.org, albert@sifive.com, yamada.masahiro@socionext.com, mmarek@suse.com, will.deacon@arm.com, peterz@infradead.org, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 26, 2017 at 06:56:30PM -0700, Palmer Dabbelt wrote:
> +/*
> + * This is particularly ugly: it appears we can't actually get the definition
> + * of task_struct here, but we need access to the CPU this task is running on.
> + * Instead of using C we're using asm-offsets.h to get the current processor
> + * ID.
> + */
> +#define raw_smp_processor_id() (*((int*)((char*)get_current() + TASK_TI_CPU)))

Are you using CONFIG_THREAD_INFO_IN_TASK?

I assume so, becauase 'TI' usually stands for thread_info.

So if you can include your <asm/thread_info.h> here, I think you can do
something like:

#define get_ti()		((struct thread_info *)get_current())
#define raw_smp_processor_id()	(get_ti()->cpu)

[...]

> +static void ci_leaf_init(struct cacheinfo *this_leaf,
> +			 struct device_node *node,
> +			 enum cache_type type, unsigned int level)
> +{
> +	this_leaf->of_node = node;
> +	this_leaf->level = level;
> +	this_leaf->type = type;
> +	/* not a sector cache */
> +	this_leaf->physical_line_partition = 1;
> +	/* TODO: Add to DTS */
> +	this_leaf->attributes =
> +		CACHE_WRITE_BACK
> +		| CACHE_READ_ALLOCATE
> +		| CACHE_WRITE_ALLOCATE;
> +}

In practice, it's very hard to remove implicit assumptions later down
the line, so I'd recommend you add this to your DT from the outset.

[...]

> +/* Return -1 if not a valid hart */
> +int riscv_of_processor_hart(struct device_node *node)

Perhaps s/hart/hart_id/ for the function name? Otherwise, it's not
immediately obvious what it is doing.

> +{
> +	const char *isa, *status;
> +	u32 hart;
> +
> +	if (!of_device_is_compatible(node, "riscv")) {
> +		pr_warn("Found incompatible CPU\n");
> +		return -(ENODEV);
> +	}
> +
> +	if (of_property_read_u32(node, "reg", &hart)) {
> +		pr_warn("Found CPU without hart ID\n");
> +		return -(ENODEV);
> +	}
> +	if (hart >= NR_CPUS) {
> +		pr_info("Found hart ID %d, which is above NR_CPUs.  Disabling this hart\n", hart);
> +		return -(ENODEV);
> +	}

Here you assume that the hard ID is equalt to the Linux logical ID.

I'd recommend that (as other architectures do), you decouple the two.

That's going to be necessary for things like kdump to work, as the kdump
kernel will run on (Linux logical) CPU0, but may have been executed from
any secondary CPU.

> +
> +	if (of_property_read_string(node, "status", &status)) {
> +		pr_warn("CPU with hartid=%d has no \"status\" property\n", hart);
> +		return -(ENODEV);
> +	}
> +	if (strcmp(status, "okay")) {
> +		pr_info("CPU with hartid=%d has a non-okay status of \"%s\"\n", hart, status);
> +		return -(ENODEV);
> +	}

Please use of_device_is_available().

> +
> +	if (of_property_read_string(node, "riscv,isa", &isa)) {
> +		pr_warn("CPU with hartid=%d has no \"riscv,isa\" property\n", hart);
> +		return -(ENODEV);
> +	}
> +	if (isa[0] != 'r' || isa[1] != 'v') {
> +		pr_warn("CPU with hartid=%d has an invalid ISA of \"%s\"\n", hart, isa);
> +		return -(ENODEV);
> +	}

As mentioned on the binding patch, I'd recommend that you use a set of
discrete flags.

[...]

> +static int c_show(struct seq_file *m, void *v)
> +{
> +	unsigned long hart_id = (unsigned long)v - 1;
> +	struct device_node *node = of_get_cpu_node(hart_id, NULL);
> +	const char *compat, *isa, *mmu;
> +
> +	seq_printf(m, "hart\t: %lu\n", hart_id);
> +	if (!of_property_read_string(node, "riscv,isa", &isa)
> +	    && isa[0] == 'r'
> +	    && isa[1] == 'v')
> +		seq_printf(m, "isa\t: %s\n", isa);
> +	if (!of_property_read_string(node, "mmu-type", &mmu)
> +	    && !strncmp(mmu, "riscv,", 6))
> +		seq_printf(m, "mmu\t: %s\n", mmu+6);
> +	if (!of_property_read_string(node, "compatible", &compat)
> +	    && strcmp(compat, "riscv"))
> +		seq_printf(m, "uarch\t: %s\n", compat);
> +	seq_puts(m, "\n");

I'd *very strongly* recommend that you don't pass the DT values straight
through to userspace.

Otherwise, things like riscv,isa = "rvtypo'd\nsomething" get exposed,
and inevitably, some subset of userspace ends up relying upon it, while
others break based upon it.

Further, specifically for the ISA parts, this is a very bad idea. If
some ISA extensions require kernel support (e.g. to context switch
state, or disable some configurable traps), they cannot work without
kernel support. Generally, the wayt to handle this is for the kernel to
detect the features at boot time, and save these in hwcaps.

Later, the hwcaps can be used to generate /proc/cpunifo output, and are
also exposed via auxv, which avoids applications and libraries having to
parse /proc/cpuinfo just to determine whether they have a particular
feature, which doesn't work in many situations (e.g. early boot where
/proc may not be mounted).

Take a look at arm64's hwcaps for an example of how to use hwcaps.

[...]

I deleted the context from my draft, but I didn't spot a header sta the
start of your head.S. I would very strongly recommend that you have a
header with magic, image size (including unpopulated BSS), and other
room for expansion, so that bootloaders can figure out how to load your
kernel correctly.

[...]

> +ENTRY(_start)
> +	/* Mask all interrupts */
> +	csrw sie, zero
> +
> +	/* Load the global pointer */
> +.option push
> +.option norelax
> +	la gp, __global_pointer$
> +.option pop
> +
> +	/*
> +	 * Disable FPU to detect illegal usage of
> +	 * floating point in kernel space
> +	 */
> +	li t0, SR_FS
> +	csrc sstatus, t0
> +
> +	/* Pick one hart to run the main boot sequence */
> +	la a3, hart_lottery
> +	li a2, 1
> +	amoadd.w a3, a2, (a3)
> +	bnez a3, .Lsecondary_start

I would *very strongly* recommend that you do not throw all CPUs into
the kernel at the start of time, and instead have a mechanism where you
can bring CPUs into the kernel individually.

While it's simple, it comes with a number of long term problems (e.g.
for kexec/kdump), some of which are unsolvable (e.g. as you cannot know
how many CPUs are stuck in the kernel text, which haven't been brought
online).

If you want a simple SMP bringup mechanism, ePAPR's spin-table (and
arm64's different-but-identically-named spin-table) are good starting
points. Just make sure you require each CPU is brought online
individually. We didn't do that for arm64 from day one, and it still
prevents us from making improvements that we'd like to, years later.

Doing that will also simplify decoupling the HART IDs from linux logical
IDs, necessary for kdump/kexec, etc.

[...]

> +/*
> + * Allow the user to manually add a memory region (in case DTS is broken);
> + * "mem_end=nn[KkMmGg]"
> + */

This doesn't have a start, so it can't work for discontiguous memory
blocks (e.g. if FW has reserved/carved-out a chunk in the middle).

Other architectures have "mem=" which would allow you to specify a
region. I'd generally recommend you provide an incentive to fix dts,
however.

> +void __init setup_arch(char **cmdline_p)
> +{
> +#if defined(CONFIG_HVC_RISCV_SBI)
> +	if (likely(early_console == NULL)) {
> +		early_console = &riscv_sbi_early_console_dev;
> +		register_console(early_console);
> +	}
> +#endif

This would be better driven by the DT or command line. Otherwise, this
may come back to bite you in future, as you have to come up with a new
mechanism to describe absence of the console, rather than using an
exsiting mechanism to describe its presence.

[...]

> +void __init smp_prepare_cpus(unsigned int max_cpus)
> +{
> +}
> +
> +void __init setup_smp(void)
> +{
> +	struct device_node *dn = NULL;
> +	int hart, im_okay_therefore_i_am = 0;
> +
> +	while ((dn = of_find_node_by_type(dn, "cpu"))) {
> +		hart = riscv_of_processor_hart(dn);
> +		if (hart >= 0) {
> +			set_cpu_possible(hart, true);
> +			set_cpu_present(hart, true);
> +			if (hart == smp_processor_id()) {
> +				BUG_ON(im_okay_therefore_i_am);
> +				im_okay_therefore_i_am = 1;
> +			}
> +		}
> +	}
> +
> +	BUG_ON(!im_okay_therefore_i_am);
> +}

That name is somewhat opaque. Perhaps bool found_boot_cpu?

> +
> +int __cpu_up(unsigned int cpu, struct task_struct *tidle)
> +{
> +	tidle->thread_info.cpu = cpu;
> +
> +	/*
> +	 * On RISC-V systems, all harts boot on their own accord.  Our _start
> +	 * selects the first hart to boot the kernel and causes the remainder
> +	 * of the harts to spin in a loop waiting for their stack pointer to be
> +	 * setup by that main hart.  Writing __cpu_up_stack_pointer signals to
> +	 * the spinning harts that they can continue the boot process.
> +	 */
> +	smp_mb();
> +	__cpu_up_stack_pointer[cpu] = task_stack_page(tidle) + THREAD_SIZE;
> +	__cpu_up_task_pointer[cpu] = tidle;

Shouldn't these be WRITE_ONCE() (or some atomic) to avoid tearing?

How are the secondaries reading these? Is there any requirement on the
order these become visible?

[...]

> +/*
> + * C entry point for a secondary processor.
> + */
> +asmlinkage void __init smp_callin(void)
> +{
> +	struct mm_struct *mm = &init_mm;
> +
> +	/* All kernel threads share the same mm context.  */
> +	atomic_inc(&mm->mm_count);

I beleive this should be:

	mmgrab(mm);

See commit f1f1007644ffc805 ("mm: add new mmgrab() helper")

> +	current->active_mm = mm;
> +
> +	trap_init();
> +	init_clockevent();
> +	notify_cpu_starting(smp_processor_id());
> +	set_cpu_online(smp_processor_id(), 1);
> +	local_flush_tlb_all();

Why do you need a TLB flush here?

> +	local_irq_enable();
> +	preempt_disable();

I believe these two should be the other way around, if the
preempt_disable() is necessary.

Thanks,
Mark.
