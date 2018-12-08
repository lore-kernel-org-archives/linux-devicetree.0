From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 4/4] RISC-V: Fix non-smp kernel boot on SMP systems
Date: Sat, 08 Dec 2018 12:25:36 -0800 (PST)
Message-ID: <mhng-13731457-9a18-4add-983c-decbae526c81@palmer-si-x1c4>
References: <CAAhSdy1gNB0sMAq4mtGSNJ96BND4tMxHShq==3B1hzL9ebs=oQ@mail.gmail.com>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAAhSdy1gNB0sMAq4mtGSNJ96BND4tMxHShq==3B1hzL9ebs=oQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: anup@brainfault.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com, aou@eecs.berkeley.edu, dmitriy@oss-tech.org, daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, atish.patra@wdc.com, robh+dt@kernel.org, linux-riscv@lists.infradead.org, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

On Fri, 07 Dec 2018 09:20:57 PST (-0800), anup@brainfault.org wrote:
> On Fri, 7 Dec, 2018, 10:30 PM Palmer Dabbelt <palmer@sifive.com wrote:
>
>> On Mon, 03 Dec 2018 12:57:31 PST (-0800), atish.patra@wdc.com wrote:
>> > Currently, clocksource registration happens for an invalid cpu
>> > for non-smp kernels. This lead to kernel panic as cpu hotplug
>> > registration will fail for those cpus.
>> >
>> > Do not proceed if hartid is invalid. Take this opprtunity to
>> > print appropriate error strings for different failure cases.
>> >
>> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> > ---
>> >  drivers/clocksource/riscv_timer.c | 13 ++++++++++---
>> >  1 file changed, 10 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/clocksource/riscv_timer.c
>> b/drivers/clocksource/riscv_timer.c
>> > index 39de6e49..4af4af47 100644
>> > --- a/drivers/clocksource/riscv_timer.c
>> > +++ b/drivers/clocksource/riscv_timer.c
>> > @@ -108,6 +108,8 @@ static int __init riscv_timer_init_dt(struct
>> device_node *n)
>> >       int cpuid, hartid, error;
>> >
>> >       hartid = riscv_of_processor_hartid(n);
>> > +     if (hartid < 0)
>> > +             return hartid;
>>
>> This seems like it's just hiding a bug somewhere else.  We should at least
>> put
>> out a WARN here, as I'm not sure the error will propagate anywhere useful.
>>
>
> We need separate DT node for riscv_timer. The riscv_timer is nothing but
> SOC timer accessed via rdtime and SBI calls. It can be viewed as one
> device. In fact, this is how it's done in ARM/ARM64.

We had that at some point, but this was changed.  The logic was that, since the 
RISC-V ISA mandates the presence of this timer for all harts, the RISC-V CPU 
node is sufficient to encode the presence of a RISC-V timer.

I'm OK changing this, but you should look at the old thread (which I can't 
find) to make sure all the arguments are taken into account.

>> >       cpuid = riscv_hartid_to_cpuid(hartid);
>> >
>> >       if (cpuid != smp_processor_id())
>> > @@ -115,14 +117,19 @@ static int __init riscv_timer_init_dt(struct
>> device_node *n)
>> >
>> >       /* This should be called only for boot cpu */
>> >       riscv_timebase = riscv_timebase_frequency(n);
>> > -     clocksource_register_hz(&riscv_clocksource, riscv_timebase);
>> > +     error = clocksource_register_hz(&riscv_clocksource,
>> riscv_timebase);
>> >
>> > +     if (error) {
>> > +             pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
>> > +                    error, cpuid);
>> > +             return error;
>> > +     }
>> >       error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
>> >                        "clockevents/riscv/timer:starting",
>> >                        riscv_timer_starting_cpu, riscv_timer_dying_cpu);
>> >       if (error)
>> > -             pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
>> > -                    error, cpuid);
>> > +             pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
>> > +                    error);
>> >       return error;
>> >  }
>>
>
> Regards,
> Anup
>
>>
