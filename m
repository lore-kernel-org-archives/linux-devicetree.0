From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v6 3/7] cpu-topology: Move cpu topology code to common
 code.
Date: Tue, 11 Jun 2019 16:55:43 +0100
Message-ID: <20190611155543.GJ4324@fuggles.cambridge.arm.com>
References: <20190529211340.17087-1-atish.patra@wdc.com>
 <20190529211340.17087-4-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190529211340.17087-4-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Jeffrey Hugo <jhugo@codeaurora.org>, Sudeep Holla <sudeep.holla@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, Linus Walleij <linus.walleij@linaro.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Morten Rasmussen <morten.rasmussen@arm.com>, Otto Sabart <ottosabart@seberm.com>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Peter Zijlstra
List-Id: devicetree@vger.kernel.org

On Wed, May 29, 2019 at 02:13:36PM -0700, Atish Patra wrote:
> Both RISC-V & ARM64 are using cpu-map device tree to describe
> their cpu topology. It's better to move the relevant code to
> a common place instead of duplicate code.
> 
> To: Will Deacon <will.deacon@arm.com>
> To: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> [Tested on QDF2400]
> Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>
> [Tested on Juno and other embedded platforms.]
> Tested-by: Sudeep Holla <sudeep.holla@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> 
> ---
> Hi Will/Catalin,
> Can we get ack for this patch ? We are hoping to get the entire series
> merged at one go.

If Sudeep is happy with it then that's good enough for me.

Acked-by: Will Deacon <will.deacon@arm.com>

Will
