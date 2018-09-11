From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 0/6] Tracing register accesses with pstore and dynamic
 debug
Date: Tue, 11 Sep 2018 21:41:55 +0530
Message-ID: <2714af83-d2f7-473e-c234-428d2b8a84f0@codeaurora.org>
References: <cover.1536430404.git.saiprakash.ranjan@codeaurora.org>
 <20180911151148.GI2651@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180911151148.GI2651@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, Laura Abbott <labbott@redhat.com>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Colin Cross <ccross@android.com>, Jason Baron <jbaron@akamai.com>, Tony Luck <tony.luck@intel.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Joel Fernandes <joel@joelfernandes.org>, Masami Hiramatsu <mhiramat@kernel.org>, Joe Perches <joe@perches.com>, Jim Cromie <jim.cromie@gmail.com>, Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.orglinux
List-Id: devicetree@vger.kernel.org

On 9/11/2018 8:41 PM, Will Deacon wrote:
> Hello,
> 
> On Sun, Sep 09, 2018 at 01:57:01AM +0530, Sai Prakash Ranjan wrote:
>> This patch series adds Event tracing support to pstore and is continuation
>> to the RFC patch introduced to add a new tracing facility for register
>> accesses called Register Trace Buffer(RTB). Since we decided to not introduce
>> a separate framework to trace register accesses and use existing framework
>> like tracepoints, I have moved from RFC. Details of the RFC in link below:
>>
>> Link: https://lore.kernel.org/lkml/cover.1535119710.git.saiprakash.ranjan@codeaurora.org/
> 
> The arm64 backend bits look fine to be, but they're mixed up with core
> changes that I haven't looked at closely.
> 
Hi Will,

Thanks for the review. Let me know if you have any suggestions or points 
regarding this patch, I will be happy to incorporate it.
