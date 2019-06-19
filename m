From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v7 7/7] MAINTAINERS: Add an entry for generic
 architecture topology
Date: Wed, 19 Jun 2019 19:37:49 +0200
Message-ID: <20190619173749.GA20916@kroah.com>
References: <20190617185920.29581-1-atish.patra@wdc.com>
 <20190617185920.29581-8-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190617185920.29581-8-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>
Cc: linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will.deacon@arm.com>, Juri Lelli <juri.lelli@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Catalin Marinas <catalin.marinas@arm.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Linus Walleij <linus.walleij@linaro.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Morten Rasmussen <morten.rasmussen@arm.com>, Otto Sabart <ottosabart@seberm.com>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Peter Zijlstra (Intel)" <peterz@infr>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 17, 2019 at 11:59:20AM -0700, Atish Patra wrote:
> From: Sudeep Holla <sudeep.holla@arm.com>
> 
> arm and arm64 shared lot of CPU topology related code. This was
> consolidated under driver/base/arch_topology.c by Juri. Now RISC-V
> is also started sharing the same code pulling more code from arm64
> into arch_topology.c
> 
> Since I was involved in the review from the beginning, I would like
> to assume maintenance for the same.
> 
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Juri Lelli <juri.lelli@redhat.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
