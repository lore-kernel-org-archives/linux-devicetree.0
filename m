From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v7 4/7] arm: Use common cpu_topology structure and
 functions.
Date: Wed, 19 Jun 2019 13:10:57 +0100
Message-ID: <20190619121057.GE1360@e107155-lin>
References: <20190617185920.29581-1-atish.patra@wdc.com>
 <20190617185920.29581-5-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190617185920.29581-5-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Catalin Marinas <catalin.marinas@arm.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Linus Walleij <linus.walleij@linaro.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Morten Rasmussen <morten.rasmussen@arm.com>, Otto Sabart <ottosabart@seberm.com>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Russell,

On Mon, Jun 17, 2019 at 11:59:17AM -0700, Atish Patra wrote:
> Currently, ARM32 and ARM64 uses different data structures to represent
> their cpu topologies. Since, we are moving the ARM64 topology to common
> code to be used by other architectures, we can reuse that for ARM32 as
> well.
> 
> Take this opprtunity to remove the redundant functions from ARM32 and
> reuse the common code instead.
> 
> To: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Tested-by: Sudeep Holla <sudeep.holla@arm.com> (on TC2)
> Reviewed-by : Sudeep Holla <sudeep.holla@arm.com>
> 
> ---
> Hi Russell,
> Can we get a ACK for this patch ? We are hoping that the entire
> series can be merged at one go.

It would be nice to get this in for v5.3 as it's almost there.
Are you fine with these changes ?

--
Regards,
Sudeep
