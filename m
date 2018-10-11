From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RFC PATCH v2 3/3] cpuidle/powernv: save-restore sprs in opal
Date: Thu, 11 Oct 2018 12:56:07 -0700
Message-ID: <34eaec54-3846-54f5-463a-d80c9d95d79c@gmail.com>
References: <20181011132237.14604-1-akshay.adiga@linux.vnet.ibm.com>
 <20181011132237.14604-4-akshay.adiga@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181011132237.14604-4-akshay.adiga@linux.vnet.ibm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Akshay Adiga <akshay.adiga@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: huntbag@linux.vnet.ibm.com, npiggin@gmail.com, benh@kernel.crashing.org, mpe@ellerman.id.au, ego@linux.vnet.ibm.com
List-Id: devicetree@vger.kernel.org

+ devicetree mail list

On 10/11/18 06:22, Akshay Adiga wrote:
> From: Abhishek Goel <huntbag@linux.vnet.ibm.com>
> 
> This patch moves the saving and restoring of sprs for P9 cpuidle
> from kernel to opal.
> In an attempt to make the powernv idle code backward compatible,
> and to some extent forward compatible, add support for pre-stop entry
> and post-stop exit actions in OPAL. If a kernel knows about this
> opal call, then just a firmware supporting newer hardware is required,
> instead of waiting for kernel updates.
> 
> Signed-off-by: Abhishek Goel <huntbag@linux.vnet.ibm.com>
> Signed-off-by: Akshay Adiga <akshay.adiga@linux.vnet.ibm.com>
> ---
> Changes from v1 :
>  - Code is rebased on Nick Piggin's v4 patch "powerpc/64s: reimplement book3s
>    idle code in C"
>  - Set a global variable "request_opal_call" to indicate that deep
>    states should make opal_call.
>  - All the states that loses hypervisor states will be handled by OPAL
>  - All the decision making such as identifying first thread in
>    the core and taking locks before restoring in such cases have also been
>    moved to OPAL
>  arch/powerpc/include/asm/opal-api.h           |  4 +-
>  arch/powerpc/include/asm/opal.h               |  3 +
>  arch/powerpc/include/asm/processor.h          |  3 +-
>  arch/powerpc/kernel/idle_book3s.S             |  6 +-
>  arch/powerpc/platforms/powernv/idle.c         | 88 +++++++++++++------
>  .../powerpc/platforms/powernv/opal-wrappers.S |  2 +
>  6 files changed, 77 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
> index 8365353330b4..93ea1f79e295 100644
> --- a/arch/powerpc/include/asm/opal-api.h
> +++ b/arch/powerpc/include/asm/opal-api.h
> @@ -210,7 +210,9 @@
>  #define OPAL_PCI_GET_PBCQ_TUNNEL_BAR		164
>  #define OPAL_PCI_SET_PBCQ_TUNNEL_BAR		165
>  #define	OPAL_NX_COPROC_INIT			167
> -#define OPAL_LAST				167
> +#define OPAL_IDLE_SAVE				170
> +#define OPAL_IDLE_RESTORE			171
> +#define OPAL_LAST				171
>  
>  #define QUIESCE_HOLD			1 /* Spin all calls at entry */
>  #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
> diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
> index ff3866473afe..26995e16171e 100644
> --- a/arch/powerpc/include/asm/opal.h
> +++ b/arch/powerpc/include/asm/opal.h
> @@ -356,6 +356,9 @@ extern int opal_handle_hmi_exception(struct pt_regs *regs);
>  extern void opal_shutdown(void);
>  extern int opal_resync_timebase(void);
>  
> +extern int opal_cpuidle_save(u64 psscr);
> +extern int opal_cpuidle_restore(u64 psscr, u64 srr1);
> +
>  extern void opal_lpc_init(void);
>  
>  extern void opal_kmsg_init(void);
> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
> index 822d3236ad7f..26fa6c1836f4 100644
> --- a/arch/powerpc/include/asm/processor.h
> +++ b/arch/powerpc/include/asm/processor.h
> @@ -510,7 +510,8 @@ static inline unsigned long get_clean_sp(unsigned long sp, int is_32)
>  
>  /* asm stubs */
>  extern unsigned long isa300_idle_stop_noloss(unsigned long psscr_val);
> -extern unsigned long isa300_idle_stop_mayloss(unsigned long psscr_val);
> +extern unsigned long isa300_idle_stop_mayloss(unsigned long psscr_val,
> +						bool request_opal_call);
>  extern unsigned long isa206_idle_insn_mayloss(unsigned long type);
>  
>  extern unsigned long cpuidle_disable;
> diff --git a/arch/powerpc/kernel/idle_book3s.S b/arch/powerpc/kernel/idle_book3s.S
> index ffdee1ab4388..a2014d152035 100644
> --- a/arch/powerpc/kernel/idle_book3s.S
> +++ b/arch/powerpc/kernel/idle_book3s.S
> @@ -52,14 +52,16 @@ _GLOBAL(isa300_idle_stop_noloss)
>  _GLOBAL(isa300_idle_stop_mayloss)
>  	mtspr 	SPRN_PSSCR,r3
>  	std	r1,PACAR1(r13)
> -	mflr	r4
> +	mflr	r7
>  	mfcr	r5
>  	/* use stack red zone rather than a new frame */
>  	addi	r6,r1,-INT_FRAME_SIZE
>  	SAVE_GPR(2, r6)
>  	SAVE_NVGPRS(r6)
> -	std	r4,_LINK(r6)
> +	std	r7,_LINK(r6)
>  	std	r5,_CCR(r6)
> +	cmpwi	r4,0
> +	bne	opal_cpuidle_save
>  	PPC_STOP
>  	b	.	/* catch bugs */
>  
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index 681a23a066bb..bcfe08022e65 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -171,6 +171,7 @@ static void pnv_fastsleep_workaround_apply(void *info)
>  
>  static bool power7_fastsleep_workaround_entry = true;
>  static bool power7_fastsleep_workaround_exit = true;
> +static bool request_opal_call = false;
>  
>  /*
>   * Used to store fastsleep workaround state
> @@ -604,6 +605,7 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>  	unsigned long mmcr0 = 0;
>  	struct p9_sprs sprs;
>  	bool sprs_saved = false;
> +	bool is_hv_loss = false;
>  
>  	memset(&sprs, 0, sizeof(sprs));
>  
> @@ -648,7 +650,9 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>  		  */
>  		mmcr0		= mfspr(SPRN_MMCR0);
>  	}
> -	if ((psscr & PSSCR_RL_MASK) >= pnv_first_hv_loss_level) {
> +
> +	is_hv_loss = (psscr & PSSCR_RL_MASK) >= pnv_first_hv_loss_level;
> +	if (is_hv_loss && (!request_opal_call)) {
>  		sprs.lpcr	= mfspr(SPRN_LPCR);
>  		sprs.hfscr	= mfspr(SPRN_HFSCR);
>  		sprs.fscr	= mfspr(SPRN_FSCR);
> @@ -674,7 +678,8 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>  		atomic_start_thread_idle();
>  	}
>  
> -	srr1 = isa300_idle_stop_mayloss(psscr);
> +	srr1 = isa300_idle_stop_mayloss(psscr,
> +			is_hv_loss && request_opal_call);
>  
>  #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
>  	local_paca->requested_psscr = 0;
> @@ -685,6 +690,25 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>  	WARN_ON_ONCE(!srr1);
>  	WARN_ON_ONCE(mfmsr() & (MSR_IR|MSR_DR));
>  
> +	/*
> +	 * On POWER9, SRR1 bits do not match exactly as expected.
> +	 * SRR1_WS_GPRLOSS (10b) can also result in SPR loss, so
> +	 * always test PSSCR if there is any state loss.
> +	 */
> +	if (likely(((psscr & PSSCR_PLS) >> 60) < pnv_first_hv_loss_level)) {
> +		if (sprs_saved)
> +			atomic_stop_thread_idle();
> +		goto out;
> +	}
> +
> +	if (request_opal_call) {
> +		opal_cpuidle_restore(psscr, srr1);
> +		goto opal_return;
> +	}
> +
> +	/* HV state loss */
> +	BUG_ON(!sprs_saved);
> +
>  	if ((srr1 & SRR1_WAKESTATE) != SRR1_WS_NOLOSS) {
>  		unsigned long mmcra;
>  
> @@ -712,19 +736,6 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>  	if (unlikely((srr1 & SRR1_WAKEMASK_P8) == SRR1_WAKEHMI))
>  		hmi_exception_realmode(NULL);
>  
> -	/*
> -	 * On POWER9, SRR1 bits do not match exactly as expected.
> -	 * SRR1_WS_GPRLOSS (10b) can also result in SPR loss, so
> -	 * always test PSSCR if there is any state loss.
> -	 */
> -	if (likely((psscr & PSSCR_RL_MASK) < pnv_first_hv_loss_level)) {
> -		if (sprs_saved)
> -			atomic_stop_thread_idle();
> -		goto out;
> -	}
> -
> -	/* HV state loss */
> -	BUG_ON(!sprs_saved);
>  
>  	atomic_lock_thread_idle();
>  
> @@ -771,6 +782,7 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>  
>  	mtspr(SPRN_SPRG3,	local_paca->sprg_vdso);
>  
> +opal_return:
>  	if (!radix_enabled())
>  		__slb_restore_bolted_realmode();
>  
> @@ -1284,6 +1296,7 @@ static int pnv_parse_cpuidle_dt(void)
>  	u32 *temp_u32;
>  	u64 *temp_u64;
>  	const char **temp_string;
> +	bool fall_back_to_opal = false;
>  
>  	np = of_find_node_by_path("/ibm,opal/power-mgt");
>  	if (!np) {
> @@ -1396,23 +1409,48 @@ static int pnv_parse_cpuidle_dt(void)
>  	/* Parse each child node with appropriate parser_fn */
>  	for_each_child_of_node(np1, dt_node) {
>  		bool found_known_version = false;
> -		/* we don't have state falling back to opal*/
> -		for (i = 0; i < nr_known_versions ; i++) {
> -			if (of_device_is_compatible(dt_node, known_versions[i].name)) {
> -				rc = known_versions[i].parser_fn(dt_node);
> +		if (!fall_back_to_opal) {
> +			/* we don't have state falling back to opal*/
> +			for (i = 0; i < nr_known_versions ; i++) {
> +				if (of_device_is_compatible(dt_node, known_versions[i].name)) {
> +					rc = known_versions[i].parser_fn(dt_node);
> +					if (rc) {
> +						pr_err("%s could not parse\n", known_versions[i].name);
> +						continue;
> +					}
> +					found_known_version = true;
> +				}
> +			}
> +		}
> +
> +		/*
> +		 * If any previous state falls back to opal_call
> +		 * Then all futher states will either call opal_call
> +		 * or not be included for cpuidle/cpuoffline.
> +		 *
> +		 * Moreover, having any intermediate state with no
> +		 * kernel support or opal support can be potentially
> +		 * dangerous, as hardware can potentially wakeup from
> +		 * that state. Hence, no futher states are added to
> +		 * to cpuidle/cpuoffline
> +		 */
> +		if (!found_known_version || fall_back_to_opal) {
> +			if (of_device_is_compatible(dt_node, "opal-support")) {
> +				rc = known_versions[0].parser_fn(dt_node);
>  				if (rc) {
> -					pr_err("%s could not parse\n", known_versions[i].name);
> +					pr_err("%s could not parse\n", "opal-support");
>  					continue;
>  				}
> -				found_known_version = true;
> +				fall_back_to_opal = true;
> +			} else {
> +				pr_info("Unsupported state, skipping all further state\n");
> +				goto out;
>  			}
>  		}
> -		if (!found_known_version) {
> -			pr_info("Unsupported state, skipping all further state\n");
> -			goto out;
> -		}
>  		nr_pnv_idle_states++;
>  	}
> +	if (fall_back_to_opal)
> +		request_opal_call = true;
>  out:
>  	kfree(temp_u32);
>  	kfree(temp_u64);
> diff --git a/arch/powerpc/platforms/powernv/opal-wrappers.S b/arch/powerpc/platforms/powernv/opal-wrappers.S
> index 251528231a9e..7a039a81a67e 100644
> --- a/arch/powerpc/platforms/powernv/opal-wrappers.S
> +++ b/arch/powerpc/platforms/powernv/opal-wrappers.S
> @@ -331,3 +331,5 @@ OPAL_CALL(opal_pci_set_pbcq_tunnel_bar,		OPAL_PCI_SET_PBCQ_TUNNEL_BAR);
>  OPAL_CALL(opal_sensor_read_u64,			OPAL_SENSOR_READ_U64);
>  OPAL_CALL(opal_sensor_group_enable,		OPAL_SENSOR_GROUP_ENABLE);
>  OPAL_CALL(opal_nx_coproc_init,			OPAL_NX_COPROC_INIT);
> +OPAL_CALL(opal_cpuidle_save,			OPAL_IDLE_SAVE);
> +OPAL_CALL(opal_cpuidle_restore,			OPAL_IDLE_RESTORE);
> 
