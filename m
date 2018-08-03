From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/11] dt-bindings: interrupt-controller: RISC-V PLIC
        documentation
Date: Fri, 3 Aug 2018 15:30:01 +0200
Message-ID: <20180803133001.GA23900@lst.de>
References: <20180802115008.4031-1-hch@lst.de> <20180802115008.4031-4-hch@lst.de> <0093fadc-a150-3745-e73d-e579bfdfabfb@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0093fadc-a150-3745-e73d-e579bfdfabfb@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>
Cc: Christoph Hellwig <hch@lst.de>, "tglx@linutronix.de" <tglx@linutronix.de>, "palmer@sifive.com" <palmer@sifive.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "anup@brainfault.org" <anup@brainfault.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "shorne@gmail.com" <shorne@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 02, 2018 at 03:08:15PM -0700, Atish Patra wrote:
> The one in the real device tree has two entries.
> reg = <0x00000000 0x0c000000 0x00000000 0x04000000>;
>
> Is it intentional or just incorrect entry left over from earlier days?

I'll need to SiFive folks to comment on that.  The driver itself uses
of_iomap, which as far as I can tell only needs two entries.
