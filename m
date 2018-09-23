From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 2/6] pstore: Add event tracing support
Date: Sun, 23 Sep 2018 21:03:04 +0530
Message-ID: <eb686156-95d2-2468-21be-13bfd97d5a58@codeaurora.org>
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
>>> +
>>> +       trace_seq_init(&iter->seq);
>>> +       iter->ent = fbuffer->entry;
>>> +       event_call->event.funcs->trace(iter, 0, event);
>>> +       trace_seq_putc(&iter->seq, 0);
>>
>> Would it be possible to store the binary trace record in the pstore
>> buffer instead of outputting text? I suspect that will both be faster
>> and less space.
>>
> 
> I will try this and come back.
> 

Hi Joel,

I removed trace_seq_putc and there is some improvement seen: 203 MB/s

# dd if=/dev/zero of=/dev/null status=progress
12207371264 bytes (12 GB, 11 GiB) copied, 60 s, 203 MB/s^C
24171926+0 records in
24171926+0 records out
12376026112 bytes (12 GB, 12 GiB) copied, 60.8282 s, 203 MB/s

This seems good when compared to 190 MB/s seen previously.
If this is Ok, then I will spin v2 with changes suggested.

Thanks,
Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
