From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH 0/6] Tracing register accesses with pstore and dynamic
 debug
Date: Tue, 11 Sep 2018 16:11:49 +0100
Message-ID: <20180911151148.GI2651@arm.com>
References: <cover.1536430404.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1536430404.git.saiprakash.ranjan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, Laura Abbott <labbott@redhat.com>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Colin Cross <ccross@android.com>, Jason Baron <jbaron@akamai.com>, Tony Luck <tony.luck@intel.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Joel Fernandes <joel@joelfernandes.org>, Masami Hiramatsu <mhiramat@kernel.org>, Joe Perches <joe@perches.com>, Jim Cromie <jim.cromie@gmail.com>, Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.orglinux
List-Id: devicetree@vger.kernel.org

Hello,

On Sun, Sep 09, 2018 at 01:57:01AM +0530, Sai Prakash Ranjan wrote:
> This patch series adds Event tracing support to pstore and is continuation
> to the RFC patch introduced to add a new tracing facility for register
> accesses called Register Trace Buffer(RTB). Since we decided to not introduce
> a separate framework to trace register accesses and use existing framework
> like tracepoints, I have moved from RFC. Details of the RFC in link below:
> 
> Link: https://lore.kernel.org/lkml/cover.1535119710.git.saiprakash.ranjan@codeaurora.org/

The arm64 backend bits look fine to be, but they're mixed up with core
changes that I haven't looked at closely.

Will
