From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v2 1/5] RISC-V: Remove per cpu clocksource
Date: Mon, 26 Aug 2019 16:48:02 -0700 (PDT)
Message-ID: <mhng-6a5026a2-d727-4c08-969d-712b303903df@palmer-si-x1e>
References: <089a5ee46759074af391c50f5e9d28344b429de4.camel@wdc.com>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <089a5ee46759074af391c50f5e9d28344b429de4.camel@wdc.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Atish Patra <Atish.Patra@wdc.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, daniel.lezcano@linaro.org, Greg KH <gregkh@linuxfoundation.org>, Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, johan@kernel.org, alexios.zavras@intel.com, aou@eecs.berkeley.edu, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, info@metux.net, tglx@linutronix.de, allison@lohutok.net
List-Id: devicetree@vger.kernel.org

On Fri, 16 Aug 2019 11:55:14 PDT (-0700), Atish Patra wrote:
> On Fri, 2019-08-16 at 17:09 +0200, Daniel Lezcano wrote:
>> On 31/07/2019 03:24, Atish Patra wrote:
>> > There is only one clocksource in RISC-V. The boot cpu initializes
>> > that clocksource. No need to keep a percpu data structure.
>> 
>> That is not what is stated in the initial patch [1].
>> 
>> Can you clarify that ?
>> 
> 
> I think what I meant to say was "There is only one clocksource used in
> RISC-V Linux" as it is guranteed that all the timers across all the
> harts are synchronized within one tick of each other [2]. 
> Apologies for not being verbose here.
> 
> However, reading the privilege specification(1.12-draft) 
> 
> Section. 3.1.10 states that 
> 
> "Accurate real-time clocks (RTCs) are relatively expensive to provide
> (requiring a crystal or MEMS oscillator) and have to run even when the
> rest of system is powered down, and so there is usually only one in a
> system located in a different frequency/voltage domain from the
> processors. Hence, the RTC must be shared by all the harts in a system"
> 
> This is different from the commit text in [1].
> 
> Perhaps I misunderstood something. @Palmer ?

This is one of those places the ISA has drifted around a bit: in the user ISA 
there is a time CSR, and CSRs are all per-hart state so logically there is a 
timer per hart.  We used to actually build systems this way (with an SOC agent 
what would actively increment each CSR whenever the RTC fired), but it ended up 
being impractical for a bunch of reasons.  There was never a way to actually 
write these time CSRs from supervisor mode, but machine-mode software could 
write them so it would have been possible to build system that had different 
time values on different harts.

As a result we ended up with per-CPU timers in Linux, but they never actually 
worked correctly: there's a bunch of per-CPU state in the driver, but nothing 
to actually enforce that timer reads go to the correct hart.  For example, get 
the time on hart 0 you'd have to IPI over to that hart, do a local CSR read, 
and then IPI the time back.  As a result the per-CPU state never really made 
any sense, but it kind of just hung around because it worked fine on the 
systems we were building (which always had time synced up anyway) and was 
closer to what the spec allowed -- we didn't IPI over because time was always 
synchronized on systems that actually existed and the IPIs are super slow, but 
the scaffolding stuck around.

As part of cleaning up the privileged ISA for ratification we decided to 
mandate that the time CSRs on every hart are always within a single tick of 
each other, effectively mandating a single time across the system.  This was 
partially motivated by Linux, but mostly by a new approach we were taking to 
the hypervisor specification -- rather than a hypervisor mode, we decided to 
just extend supervisor mode to support fast nested virtualization, which means 
we now have "htimedelta" (a per-hart timer offset) rather than per-hart timers.  
This is more efficient because the per-state stays constant so we don't need to 
actively tick it, and since it makes the per-hart time state unnecessary we 
decided to drop that extra state.

The change to global time on RISC-V systems rendered the per-CPU timers 
defunct, but since they weren't really doing anything they just stuck around.  
The cleanup seems perfectly reasonable to me, modulo the issue I've pointed out 
below...

> 
> 
> [2] 
> https://elixir.bootlin.com/linux/v5.3-rc4/source/drivers/clocksource/timer-riscv.c#L44
> 
>> Thanks
>> 
>>   -- Daniel
>> 
>> [1] https://lkml.org/lkml/2018/8/4/51
>> 
>> 
>> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> > ---
>> >  drivers/clocksource/timer-riscv.c | 6 ++----
>> >  1 file changed, 2 insertions(+), 4 deletions(-)
>> > 
>> > diff --git a/drivers/clocksource/timer-riscv.c
>> > b/drivers/clocksource/timer-riscv.c
>> > index 5e6038fbf115..09e031176bc6 100644
>> > --- a/drivers/clocksource/timer-riscv.c
>> > +++ b/drivers/clocksource/timer-riscv.c
>> > @@ -55,7 +55,7 @@ static u64 riscv_sched_clock(void)
>> >  	return get_cycles64();
>> >  }
>> >  
>> > -static DEFINE_PER_CPU(struct clocksource, riscv_clocksource) = {
>> > +static struct clocksource riscv_clocksource = {
>> >  	.name		= "riscv_clocksource",
>> >  	.rating		= 300,
>> >  	.mask		= CLOCKSOURCE_MASK(64),
>> > @@ -92,7 +92,6 @@ void riscv_timer_interrupt(void)
>> >  static int __init riscv_timer_init_dt(struct device_node *n)
>> >  {
>> >  	int cpuid, hartid, error;
>> > -	struct clocksource *cs;
>> >  
>> >  	hartid = riscv_of_processor_hartid(n);
>> >  	if (hartid < 0) {
>> > @@ -112,8 +111,7 @@ static int __init riscv_timer_init_dt(struct
>> > device_node *n)
>> >  
>> >  	pr_info("%s: Registering clocksource cpuid [%d] hartid [%d]\n",
>> >  	       __func__, cpuid, hartid);
>> > -	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
>> > -	error = clocksource_register_hz(cs, riscv_timebase);
>> > +	error = clocksource_register_hz(&riscv_clocksource,
>> > riscv_timebase);

Someone's client has mangled the patches, but I think there's an issue here: 
we're still calling the init code for every "riscv" DT entry, but there's now 
only a single "struct clocksource".  This will result in a single clocksource 
being initialized multiple times, which I assume is an issue.

>> >  	if (error) {
>> >  		pr_err("RISCV timer register failed [%d] for cpu =
>> > [%d]\n",
>> >  		       error, cpuid);
>> > 
>> 
>> 
> 
