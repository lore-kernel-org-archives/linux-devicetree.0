From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v6 5/7] RISC-V: Parse cpu topology during boot.
Date: Thu, 6 Jun 2019 22:00:51 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1906062159380.28147@viisi.sifive.com>
References: <20190529211340.17087-1-atish.patra@wdc.com> <20190529211340.17087-6-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529211340.17087-6-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>
Cc: linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Sudeep Holla <sudeep.holla@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Catalin Marinas <catalin.marinas@arm.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, Linus Walleij <linus.walleij@linaro.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Morten Rasmussen <morten.rasmussen@arm.com>, Otto Sabart <ottosabart@seberm.com>, Palmer Dabbelt <palmer@sifive.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rafael J. Wyso
List-Id: devicetree@vger.kernel.org

On Wed, 29 May 2019, Atish Patra wrote:

> Currently, there are no topology defined for RISC-V.
> Parse the cpu-map node from device tree and setup the
> cpu topology.
> 
> CPU topology after applying the patch.
> $cat /sys/devices/system/cpu/cpu2/topology/core_siblings_list
> 0-3
> $cat /sys/devices/system/cpu/cpu3/topology/core_siblings_list
> 0-3
> $cat /sys/devices/system/cpu/cpu3/topology/physical_package_id
> 0
> $cat /sys/devices/system/cpu/cpu3/topology/core_id
> 3
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>

Looks reasonable to me.

Acked-by: Paul Walmsley <paul.walmsley@sifive.com>

We're assuming, on the RISC-V side, that these patches will go in via 
another tree.


- Paul
