From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [RFT PATCH v1 1/4] Documentation: DT: arm: add support for
 sockets defining package boundaries
Date: Mon, 3 Dec 2018 16:46:43 +0000
Message-ID: <20181203164643.GA17883@e107155-lin>
References: <1543534100-3654-1-git-send-email-atish.patra@wdc.com>
 <1543534100-3654-2-git-send-email-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1543534100-3654-2-git-send-email-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org, Dmitriy Cherkasov <dmitriy@oss-tech.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, Juri Lelli <juri.lelli@arm.com>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Morten Rasmussen <morten.rasmussen@arm.com>, Palmer Dabbelt <palmer@sifive.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob
List-Id: devicetree@vger.kernel.org

On Thu, Nov 29, 2018 at 03:28:17PM -0800, Atish Patra wrote:
> From: Sudeep Holla <sudeep.holla@arm.com>
> 
> The current ARM DT topology description provides the operating system
> with a topological view of the system that is based on leaf nodes
> representing either cores or threads (in an SMT system) and a
> hierarchical set of cluster nodes that creates a hierarchical topology
> view of how those cores and threads are grouped.
> 
> However this hierarchical representation of clusters does not allow to
> describe what topology level actually represents the physical package or
> the socket boundary, which is a key piece of information to be used by
> an operating system to optimize resource allocation and scheduling.
> 
> Lets add a new "socket" node type in the cpu-map node to describe the
> same.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Thanks for picking this up and putting it as part of your unification
work. I will try to test the series and review it soon.

--
Regards,
Sudeep
