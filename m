From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH 5/6] arm64/io: Add header for instrumentation of io
 operations
Date: Tue, 18 Sep 2018 12:47:27 +0100
Message-ID: <20180918114727.GE16498@arm.com>
References: <cover.1536430404.git.saiprakash.ranjan@codeaurora.org>
 <bb322d763aa6c58f036e5209a481c769be92ab9b.1536430404.git.saiprakash.ranjan@codeaurora.org>
 <20180917193940.3d68ef88@gandalf.local.home>
 <c6470671-3abf-c296-586e-cca5131cc437@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c6470671-3abf-c296-586e-cca5131cc437@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, Laura Abbott <labbott@redhat.com>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Colin Cross <ccross@android.com>, Jason Baron <jbaron@akamai.com>, Tony Luck <tony.luck@intel.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Joel Fernandes <joel@joelfernandes.org>, Masami Hiramatsu <mhiramat@kernel.org>, Joe Perches <joe@perches.com>, Jim Cromie <jim.cromie@gmail.com>, Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.orglinux
List-Id: devicetree@vger.kernel.org

On Tue, Sep 18, 2018 at 12:40:57PM +0530, Sai Prakash Ranjan wrote:
> On 9/18/2018 5:09 AM, Steven Rostedt wrote:
> >On Sun,  9 Sep 2018 01:57:06 +0530
> >Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org> wrote:
> >
> >>The new asm-generic/io-instrumented.h will keep arch code
> >>clean and separate from instrumented version which traces
> >>io register accesses. This instrumented header can later
> >>be included in arm as well for tracing io register accesses.
> >>
> >
> >Looks good to me.
> >
> >Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> >
> >-- Steve
> 
> Thanks for the ack Steve.
> 
> @Will/Mark/Robin Let me know if you have any review comments, thanks.

As I said before, the arm64 bits looks fine to me. I just don't really want
to Ack the thing because the patch also contains the asm-generic changes.

Will
