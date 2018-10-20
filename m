From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 0/6] Tracing register accesses with pstore and dynamic
 debug
Date: Sat, 20 Oct 2018 12:02:37 +0530
Message-ID: <1d3ddbe3-d3ac-aa3e-fc9e-36739ddd0c91@codeaurora.org>
References: <cover.1536430404.git.saiprakash.ranjan@codeaurora.org>
 <20181020052535.GA155509@joelaf.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181020052535.GA155509@joelaf.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Fernandes <joel@joelfernandes.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, Laura Abbott <labbott@redhat.com>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Colin Cross <ccross@android.com>, Jason Baron <jbaron@akamai.com>, Tony Luck <tony.luck@intel.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Joe Perches <joe@perches.com>, Jim Cromie <jim.cromie@gmail.com>, Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-m
List-Id: devicetree@vger.kernel.org

On 10/20/2018 10:55 AM, Joel Fernandes wrote:
> On Sun, Sep 09, 2018 at 01:57:01AM +0530, Sai Prakash Ranjan wrote:
>> Hi,
>>
>> This patch series adds Event tracing support to pstore and is continuation
>> to the RFC patch introduced to add a new tracing facility for register
>> accesses called Register Trace Buffer(RTB). Since we decided to not introduce
>> a separate framework to trace register accesses and use existing framework
>> like tracepoints, I have moved from RFC. Details of the RFC in link below:
>>
>> Link: https://lore.kernel.org/lkml/cover.1535119710.git.saiprakash.ranjan@codeaurora.org/
>>
>> MSR tracing example given by Steven was helpful in using tracepoints for
>> register accesses instead of using separate trace. But just having these
>> IO traces would not help much unless we could have them in some persistent
>> ram buffer for debugging unclocked access or some kind of bus hang or an
>> unexpected reset caused by some buggy driver which happens a lot during
>> initial development stages. By analyzing the last few entries of this buffer,
>> we could identify the register access which is causing the issue.
> 
> Hi Sai,
> 
> I wanted to see if I could make some time to get your patches working. We are
> hitting usecases that need something like this as well. Basically devices
> hanging and then the ramdump does not tell us much, so in this case pstore
> events can be really helpful. This usecase came up last year as well.
> 
> Anyway while I was going through your patches, I cleaned up some pstore code
> as well and I have 3 more patches on top of yours for this clean up. I prefer
> we submit the patches together and sync our work together so that there is
> least conflict.
> 
> Here's my latest tree:
> https://github.com/joelagnel/linux-kernel/commits/pstore-events
> (note that I have only build tested the patches since I just wrote them and
> its quite late in the night here ;-))
> 

Hi Joel,

Thanks for looking into this. Sure, I will be happy to sync up with you 
on this. I can test your additional patches on top of my pstore patches. 
BTW, I'm still stuck at copying binary record into pstore and then 
extract it during read time. Seems like I'm missing something.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
