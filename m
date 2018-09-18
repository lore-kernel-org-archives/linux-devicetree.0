From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 2/6] pstore: Add event tracing support
Date: Wed, 19 Sep 2018 02:43:34 +0530
Message-ID: <bad69c36-2600-f0b3-5bfd-c865039ae97f@codeaurora.org>
References: <cover.1536430404.git.saiprakash.ranjan@codeaurora.org>
 <b9b60ff2864a17fb05481aa33f90114ab051d6ce.1536430404.git.saiprakash.ranjan@codeaurora.org>
 <20180917193426.41c99fd5@gandalf.local.home>
 <cb17a8c9-fca1-5492-3255-eab0ea33577c@codeaurora.org>
 <20180918164434.472294f3@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180918164434.472294f3@gandalf.local.home>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>, Laura Abbott <labbott@redhat.com>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Colin Cross <ccross@android.com>, Jason Baron <jbaron@akamai.com>, Tony Luck <tony.luck@intel.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Joel Fernandes <joel@joelfernandes.org>, Masami Hiramatsu <mhiramat@kernel.org>, Joe Perches <joe@perches.com>, Jim Cromie <jim.cromie@gmail.com>, Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vg
List-Id: devicetree@vger.kernel.org

On 9/19/2018 2:14 AM, Steven Rostedt wrote:
> On Tue, 18 Sep 2018 23:22:48 +0530
> Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org> wrote:
> 
>> On 9/18/2018 5:04 AM, Steven Rostedt wrote:
>>>
>>> It looks like pstore_event_call() gets called from a trace event. You
>>> can't call kmalloc() from one. One thing is that kmalloc has
>>> tracepoints itself. You trace those you just entered an infinite loop.
>>>
>>>    
>>
>> Ok will remove it in v2. But any alternative way to do this?
> 
> I think I describe it below.
> 

Ok got it, will change and post the 2nd version soon.

>>
>>>> +
>>>> +	event_call = fbuffer->trace_file->event_call;
>>>> +	if (!event_call || !event_call->event.funcs ||
>>>> +	    !event_call->event.funcs->trace)
>>>> +		goto fail_event;
>>>> +
>>>> +	event = &fbuffer->trace_file->event_call->event;
>>>> +
>>>> +	spin_lock_irqsave(&psinfo->buf_lock, flags);
>>>> +
>>>> +	trace_seq_init(&iter->seq);
>>>> +	iter->ent = fbuffer->entry;
>>>
>>> I guess what you are doing is needing to translate the raw data into
>>> ascii output, and need the trace_iterator to do so.
>>>
>>> You are already under a psinfo->buf_lock. Add a dummy iterator to that
>>> and use it instead.
>>>
>>> 	trace_seq_init(&psinfo->iter->seq);
>>>    
>>>> +	event_call->event.funcs->trace(iter, 0, event);
>>>
>>> 				      (psinfo->iter, 0 , event);
>>>
>>> etc.
>>>    
>>
>> Sure, will update in v2.
>>
>>>> +	trace_seq_putc(&iter->seq, 0);
>>>> +
>>>> +	if (seq->size > psinfo->bufsize)
>>>> +		seq->size = psinfo->bufsize;
>>>> +
>>>> +	s = &iter->seq;
>>>> +	seq = &s->seq;
>>>> +
>>>> +	record.buf = (char *)(seq->buffer);
>>>> +	record.size = seq->len;
>>>> +	psinfo->write(&record);
>>>> +
>>>> +	spin_unlock_irqrestore(&psinfo->buf_lock, flags);
>>>
>>> You may also need to convert these spin_locks into raw_spin_locks as
>>> when PREEMPT_RT enters the kernel you don't want them to turn into
>>> mutexes.
>>>
>>> But that can be another patch.
>>>    
>>
>> I will change this in v2, but can't we have it in same patch?
> 
> I suggested a separate patch because buf_lock is used elsewhere.
> Changing it to "raw_spin_lock" will affect more than just what this
> patch series does. Thus, I recommend making it a separate patch to keep
> this patch series from being more intrusive than it needs to be.
> 

Sure, thanks a lot.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
