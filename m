From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/11] clocksource: new RISC-V SBI timer driver
Date: Fri, 3 Aug 2018 14:31:05 +0200
Message-ID: <20180803123105.GB18301@lst.de>
References: <20180802115008.4031-1-hch@lst.de> <20180802115008.4031-12-hch@lst.de> <78e56d2f-155b-72df-1094-fdfb45090216@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <78e56d2f-155b-72df-1094-fdfb45090216@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>
Cc: Christoph Hellwig <hch@lst.de>, "tglx@linutronix.de" <tglx@linutronix.de>, "palmer@sifive.com" <palmer@sifive.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Dmitriy Cherkasov <dmitriy@oss-tech.org>, "anup@brainfault.org" <anup@brainfault.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "shorne@gmail.com" <shorne@gmail.com>
List-Id: devicetree@vger.kernel.org

>> +/*
>> + * It is guarnteed that all the timers across all the harts are synchronized
>
> /s/guarnteed/guaranteed

Fixed.
