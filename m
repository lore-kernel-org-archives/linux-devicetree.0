From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 2/6] pstore: Add event tracing support
Date: Sat, 22 Sep 2018 23:02:37 +0530
Message-ID: <ab7c17a6-c853-d763-1f12-1c169ff7a579@codeaurora.org>
References: <cover.1536430404.git.saiprakash.ranjan@codeaurora.org>
 <b9b60ff2864a17fb05481aa33f90114ab051d6ce.1536430404.git.saiprakash.ranjan@codeaurora.org>
 <CAEXW_YRXQwKvnahv5X1F_Bu_98vMg=w1xpo8PZ+aNT02vBrwwg@mail.gmail.com>
 <e8fdef37-afcd-24b3-1005-e707b73f20b1@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e8fdef37-afcd-24b3-1005-e707b73f20b1@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Fernandes <joel@joelfernandes.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, Laura Abbott <labbott@redhat.com>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Colin Cross <ccross@android.com>, Jason Baron <jbaron@akamai.com>, Tony Luck <tony.luck@intel.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Joe Perches <joe@perches.com>, Jim Cromie <jim.cromie@gmail.com>, Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 9/22/2018 10:07 PM, Sai Prakash Ranjan wrote:
> On 9/22/2018 2:35 PM, Joel Fernandes wrote:
>> On Sat, Sep 8, 2018 at 4:28 PM Sai Prakash Ranjan
>> <saiprakash.ranjan@codeaurora.org> wrote:
>>>
>> Could you just split the pstore space into a per-cpu event buffer like
>> we are doing for ftrace-on-pstore? Then you don't need to lock. I fear
>> the lock contention will be apparent. The pstore code already has
>> plumbing to split the store buffer per CPU.
>>
> 
> Hi Joel,
> 
> Thanks a lot for reviewing.
> 
> I just looked at per-cpu buffer for ftrace and itseems the pstore percpu 
> records will need to be merged into one record if we add this support 
> for events. Merging of ftrace logs is based on timestamp, but for events 
> we do not have timestamp field (for this specific reason I have added 
> timestamp field for IO event tracing so that atleast we can know the cpu 
> number in pstore output). For example, the sched event pstore output 
> below has no timestamp field, so how do we merge per-cpu logs?
> 
> # tail /sys/fs/pstore/event-ramoops-0
> sched_waking: comm=rcu_sched pid=11 prio=120 target_cpu=002
> sched_wakeup: comm=rcu_sched pid=11 prio=120 target_cpu=002
> 
> Also Pstore ftrace log format is fixed i.e.,(CPU:%d ts:%llu %08lx  %08lx 
>   %pf <- %pF\n"), but different events will have different formats and 
> we will not be able to add timestamp field like how pstore ftrace does 
> using  pstore_ftrace_write_timestamp() and pstore_ftrace_read_timestamp().
> 
> Sorry if I am confusing you, I can explain better I guess.
> 

To add to this on db410c board with the current patch I just measured 
average throughput of dd over 60 seconds with sched event tracing 
enabled (trace_event=sched tp_pstore) : 190 MB/s

# dd if=/dev/zero of=/dev/null status=progress
11402907648 bytes (11 GB, 11 GiB) copied, 60 s, 190 MB/s^C
22430312+0 records in
22430312+0 records out
11484319744 bytes (11 GB, 11 GiB) copied, 60.4277 s, 190 MB/s

It seems fine or maybe I am testing it wrongly? Anyways let me know if I 
can test any additional things in some different ways.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
