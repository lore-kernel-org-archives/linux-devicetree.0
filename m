From: Nick Hu <nickhu@andestech.com>
Subject: Re: [PATCH 4/5] nds32: Fix perf multiple events map to same counter.
Date: Mon, 22 Oct 2018 18:20:27 +0800
Message-ID: <20181022102027.GC24110@andestech.com>
References: <cover.1539745993.git.nickhu@andestech.com>
 <a683ef0bac252d0a0982643e9095dc0fc46a1305.1539745993.git.nickhu@andestech.com>
 <20181018142905.bn73t7rvtdjr2tbf@lakrids.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181018142905.bn73t7rvtdjr2tbf@lakrids.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Greentime Ying-Han =?utf-8?B?SHUo6IOh6Iux5ryiKQ==?= <greentime@andestech.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "deanbo422@gmail.com" <deanbo422@gmail.com>, "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "acme@kernel.org" <acme@kernel.org>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "jolsa@redhat.com" <jolsa@redhat.com>, "namhyung@kernel.org" <namhyung@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "geert@linux-m68k.org" <geert@linux-m68k.org>, Zong Zong-Xian =?utf-8?B?TGko5p2O5a6X5oayKQ==?= <zong@andestech.com>, "ebiederm@xmission.com" <ebiederm@xmission.com>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Thu, Oct 18, 2018 at 10:29:05PM +0800, Mark Rutland wrote:
> On Thu, Oct 18, 2018 at 04:43:16PM +0800, Nickhu wrote:
> > When there are multiple events map to the same counter, the counter
> > counts inaccurately. This is because each counter only counts one event
> > in the same time.
> > So when there are multiple events map to same counter, they have to take
> > turns in each context.
> > 
> > There are two solution:
> > 1. Print the error message when multiple events map to the same counter.
> > But print the error message would let the program hang in loop. The ltp
> > (linux test program) would be failed when the program hang in loop.
> > 
> > 2. Don't print the error message, the ltp would pass. But the user need to
> > have the knowledge that don't count the events which map to the same
> > counter, or the user will get the inaccurate results.
> > 
> > We choose method 2 for the solution
> 
> This is the correct solution. Perf exposes the active/enabled time in
> the perf event, so the user can determine that the event wasn't enabled
> all of the time.
> 
> This should be folded into the commit adding perf support.
> 
> Thanks,
> Mark.
> 
> > 
> > Signed-off-by: Nickhu <nickhu@andestech.com>
> > ---
> >  arch/nds32/include/asm/pmu.h       |  1 +
> >  arch/nds32/kernel/perf_event_cpu.c | 30 ++++++++++++++++++++----------
> >  2 files changed, 21 insertions(+), 10 deletions(-)
> > 
> > diff --git a/arch/nds32/include/asm/pmu.h b/arch/nds32/include/asm/pmu.h
> > index 3fbbe97c2d42..e75ec34af5f6 100644
> > --- a/arch/nds32/include/asm/pmu.h
> > +++ b/arch/nds32/include/asm/pmu.h
> > @@ -55,6 +55,7 @@ enum { PFMC0, PFMC1, PFMC2, MAX_COUNTERS };
> >   */
> >  #define NDS32_IDX_CYCLE_COUNTER			0
> >  #define NDS32_IDX_COUNTER0			1
> > +#define NDS32_IDX_COUNTER1			2
> >  #define NDS32_IDX_COUNTER_LAST(cpu_pmu) \
> >  	(NDS32_IDX_CYCLE_COUNTER + (cpu_pmu)->num_events - 1)
> >  
> > diff --git a/arch/nds32/kernel/perf_event_cpu.c b/arch/nds32/kernel/perf_event_cpu.c
> > index 7bb4ebb87b5c..e9a0d8bb2bc1 100644
> > --- a/arch/nds32/kernel/perf_event_cpu.c
> > +++ b/arch/nds32/kernel/perf_event_cpu.c
> > @@ -566,16 +566,26 @@ static int nds32_pmu_get_event_idx(struct pmu_hw_events *cpuc,
> >  	/*
> >  	 * Try to get the counter for correpsonding event
> >  	 */
> > -	if (!test_and_set_bit(idx, cpuc->used_mask))
> > -		return idx;
> > -
> > -	/*
> > -	 * The counter is in use.
> > -	 * The system will hang in the loop.
> > -	 */
> > -	pr_err
> > -	("Multiple events map to one counter, the behavior is undefined.\n");
> > -	return -EPERM;
> > +	if (evtype == SPAV3_0_SEL_TOTAL_CYCLES) {
> > +		if (!test_and_set_bit(idx, cpuc->used_mask))
> > +			return idx;
> > +		if (!test_and_set_bit(NDS32_IDX_COUNTER0, cpuc->used_mask))
> > +			return NDS32_IDX_COUNTER0;
> > +		if (!test_and_set_bit(NDS32_IDX_COUNTER1, cpuc->used_mask))
> > +			return NDS32_IDX_COUNTER1;
> > +	} else if (evtype == SPAV3_1_SEL_COMPLETED_INSTRUCTION) {
> > +		if (!test_and_set_bit(idx, cpuc->used_mask))
> > +			return idx;
> > +		else if (!test_and_set_bit(NDS32_IDX_COUNTER1, cpuc->used_mask))
> > +			return NDS32_IDX_COUNTER1;
> > +		else if (!test_and_set_bit
> > +			 (NDS32_IDX_CYCLE_COUNTER, cpuc->used_mask))
> > +			return NDS32_IDX_CYCLE_COUNTER;
> > +	} else {
> > +		if (!test_and_set_bit(idx, cpuc->used_mask))
> > +			return idx;
> > +	}
> > +	return -EAGAIN;
> >  }
> >  
> >  static void nds32_pmu_start(struct nds32_pmu *cpu_pmu)
> > -- 
> > 2.17.0
> > 
Thanks for the comment.
I will folded it into the commit adding perf support.
