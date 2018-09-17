From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 2/6] pstore: Add event tracing support
Date: Tue, 18 Sep 2018 01:13:30 +0530
Message-ID: <03d47d84-a237-a94e-04ee-4447d8620697@codeaurora.org>
References: <cover.1536430404.git.saiprakash.ranjan@codeaurora.org>
 <b9b60ff2864a17fb05481aa33f90114ab051d6ce.1536430404.git.saiprakash.ranjan@codeaurora.org>
 <444d7b13-2653-ba0e-e9e6-a448fded2a77@codeaurora.org>
 <153720590027.119890.15984895820368075914@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <153720590027.119890.15984895820368075914@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Anton Vorontsov <anton@enomsg.org>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Colin Cross <ccross@android.com>, Ingo Molnar <mingo@redhat.com>, Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>, Joe Perches <joe@perches.com>, Joel Fernandes <joel@joelfernandes.org>, Kees Cook <keescook@chromium.org>, Laura Abbott <labbott@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Rob Herring <robh+dt@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Tony Luck <tony.luck@intel.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org
Cc: Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Tom Zanussi <tom.zanussi@linux.intel.com>, Prasad Sodagudi <psodagud@codeaurora.org>, tsoni@codeaurora.org, Bryan Huntsman <bryanh@codeaurora.org>, Tingwei Zhang <tingwei@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 9/17/2018 11:08 PM, Stephen Boyd wrote:
> Quoting Sai Prakash Ranjan (2018-09-11 03:46:01)
>> On 9/9/2018 1:57 AM, Sai Prakash Ranjan wrote:
>>> +void notrace pstore_event_call(struct trace_event_buffer *fbuffer)
>>> +{
>>> +     struct trace_iterator *iter;
>>> +     struct trace_seq *s;
>>> +     struct trace_event_call *event_call;
>>> +     struct pstore_record record;
>>> +     struct trace_event *event;
>>> +     struct seq_buf *seq;
>>> +     unsigned long flags;
>>> +
>>> +     if (!psinfo)
>>> +             return;
>>> +
>>> +     if (unlikely(oops_in_progress))
>>> +             return;
>>> +
>>> +     pstore_record_init(&record, psinfo);
>>> +     record.type = PSTORE_TYPE_EVENT;
>>> +
>>> +     iter = kmalloc(sizeof(*iter), GFP_KERNEL);
>>> +     if (!iter)
>>> +             return;
>>> +
>>> +     event_call = fbuffer->trace_file->event_call;
>>> +     if (!event_call || !event_call->event.funcs ||
>>> +         !event_call->event.funcs->trace)
>>> +             goto fail_event;
>>> +
>>> +     event = &fbuffer->trace_file->event_call->event;
>>> +
>>> +     spin_lock_irqsave(&psinfo->buf_lock, flags);
>>> +
>>> +     trace_seq_init(&iter->seq);
>>> +     iter->ent = fbuffer->entry;
>>> +     event_call->event.funcs->trace(iter, 0, event);
>>> +     trace_seq_putc(&iter->seq, 0);
>>> +
>>> +     if (seq->size > psinfo->bufsize)
>>> +             seq->size = psinfo->bufsize;
>>> +
>>> +     s = &iter->seq;
>>> +     seq = &s->seq;
>>> +
>>> +     record.buf = (char *)(seq->buffer);
>>> +     record.size = seq->len;
>>> +     psinfo->write(&record);
>>> +
>>> +     spin_unlock_irqrestore(&psinfo->buf_lock, flags);
>>> +
>>> +fail_event:
>>> +     kfree(iter);
>>> +}
>>> +
>>>
>>
>> When tracing sched events on sdm845 mtp, I hit below bug repeatedly.
>> Seems like pstore_event_call can be called in atomic context.
>> I will respin the below fix in next version of the patch.
>> Reviews on other parts would be appreciated, thanks.
>>
>> diff --git a/fs/pstore/ftrace.c b/fs/pstore/ftrace.c
>> index d47dc93ac098..a497cf782ee8 100644
>> --- a/fs/pstore/ftrace.c
>> +++ b/fs/pstore/ftrace.c
>> @@ -73,6 +73,7 @@ void notrace pstore_event_call(struct
>> trace_event_buffer *fbuffer)
>>           struct trace_event *event;
>>           struct seq_buf *seq;
>>           unsigned long flags;
>> +       gfp_t gfpflags;
>>
>>           if (!psinfo)
>>                   return;
>> @@ -83,7 +84,9 @@ void notrace pstore_event_call(struct
>> trace_event_buffer *fbuffer)
>>           pstore_record_init(&record, psinfo);
>>           record.type = PSTORE_TYPE_EVENT;
>>
>> -       iter = kmalloc(sizeof(*iter), GFP_KERNEL);
>> +       gfpflags = (in_atomic() || irqs_disabled()) ? GFP_ATOMIC :
>> GFP_KERNEL;
>> +
>

Hi Stephen

Thanks for the comments.

> Do you need to allocate at all? Can you throw the iter on the stack?
> 

Yes since we need to copy the contents to pstore buffer.

> Using in_atomic() and irqs_disabled() to figure out if an atomic or a
> non-atomic allocation should be used is not a good solution.
> 

I took reference from a similar use by graph_trace_open() which can be 
called in atomic context via ftrace_dump(). I am open to correct this if 
there is some other way.

Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
