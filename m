From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 7/9] irqchip: add a RISC-V PLIC driver
Date: Wed, 1 Aug 2018 18:09:42 -0700
Message-ID: <1b380e3c-e137-ebe9-4528-852062d2192e@wdc.com>
References: <20180726143723.16585-1-hch@lst.de>
 <20180726143723.16585-8-hch@lst.de>
 <1b3f6066-0c7c-a5f5-75ad-559fe81091ee@wdc.com>
 <dc69d688-f765-74cc-3234-563fecff6002@wdc.com> <20180731165712.GA2521@lst.de>
 <dcb17e67-9f83-0ff5-a2c6-a6dd1b4d9c0d@wdc.com>
 <20180801121656.GA25806@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180801121656.GA25806@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>, "palmer@sifive.com" <palmer@sifive.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "anup@brainfault.org" <anup@brainfault.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "shorne@gmail.com" <shorne@gmail.com>
List-Id: devicetree@vger.kernel.org

On 8/1/18 5:12 AM, Christoph Hellwig wrote:
> On Tue, Jul 31, 2018 at 05:38:01PM -0700, Atish Patra wrote:
>> crash details are at
>> https://paste.debian.net/1036078/
> 
> Is this running without kallsyms?  It seems to lack useful symbols
> and a backtrace unfortunately.
> 
Yes. I checked the config. All KALLSYMS options and STACKTRACE are enabled

CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y

CONFIG_STACKTRACE_SUPPORT=y
CONFIG_STACKTRACE=y

Not sure if I missed something.

Regards,
Atish
