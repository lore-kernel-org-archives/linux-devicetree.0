From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 7/9] irqchip: add a RISC-V PLIC driver
Date: Wed, 1 Aug 2018 18:02:52 -0700
Message-ID: <41a996bf-b591-db0c-718e-524743f348fd@wdc.com>
References: <20180726143723.16585-1-hch@lst.de>
 <20180726143723.16585-8-hch@lst.de>
 <1b3f6066-0c7c-a5f5-75ad-559fe81091ee@wdc.com>
 <dc69d688-f765-74cc-3234-563fecff6002@wdc.com> <20180731165712.GA2521@lst.de>
 <dcb17e67-9f83-0ff5-a2c6-a6dd1b4d9c0d@wdc.com>
 <20180801141858.GA28203@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180801141858.GA28203@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>, "palmer@sifive.com" <palmer@sifive.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "anup@brainfault.org" <anup@brainfault.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "shorne@gmail.com" <shorne@gmail.com>
List-Id: devicetree@vger.kernel.org

On 8/1/18 7:14 AM, Christoph Hellwig wrote:
> I've pushed out an update to the riscv-irq-simple.2 branch to better
> handle with sparse contexid maps, please retry with that.
> 

I see you have changed the driver file name from irq-riscv-plic to 
irq-riscv-sifive along with default Y for SIFIVE_PLIC. I guess it was 
done because PLIC register spec is SIFIVE specific rather than RISC-V.

But can we keep the new kconfig option "SIFIVE_PLIC" enabled in 
driver/irqchip/Kconfig or arch/riscv/Kconfig for now to avoid breakage 
without linux_defconfig update.

With the config enabled, Qemu virt machine booting has no issues with 
riscv-irq-simple.2 branch. I am still looking at the crash from the 
hardware.

Regards,
Atish
