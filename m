From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/11] dt-bindings: interrupt-controller: RISC-V PLIC
        documentation
Date: Wed, 8 Aug 2018 17:09:38 +0200
Message-ID: <20180808150938.GA32274@lst.de>
References: <CAL_Jsq+pVzqKUbhErRr15JX2mPUOSTp_ddGvu9KAuf=TtXfduQ@mail.gmail.com> <mhng-4bc89d00-bc90-440f-996f-861dde382aaa@palmer-si-x1c4> <CAL_JsqKPFSQYH3p6a0VoCr-VAzf_98H7N3fNJ+4+DquS8WcjUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKPFSQYH3p6a0VoCr-VAzf_98H7N3fNJ+4+DquS8WcjUQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, atish.patra@wdc.com, Christoph Hellwig <hch@lst.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Stafford Horne <shorne@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 08, 2018 at 08:16:14AM -0600, Rob Herring wrote:
> Is 1.0 an actual version number corresponding to an exact, revision
> controlled version of the IP or just something you made up? Looks like
> the latter to me and I'm not a fan of s/w folks making up version
> numbers for h/w. Standard naming convention is <vendor>,<soc>-<block>
> unless you have good reason to deviate (IP for FPGAs where version
> numbers are exposed to customers is one example).
> 
> And defining a version 2 when you find a quirk doesn't work. You've
> already shipped the DT. You need to be able to fix issues with just an
> OS update. This is why you are supposed to define a compatible string
> for each and every SoC (and use a fallback when they are "the
> same"TM).

Can you point to some existing examples of the multiple offered
compatible strings and what is actually matched for something that
largely hasn't changed?

For example the documentation for the arm GICv3 binding seems to just
match for arm,gic-v3.  On the other hand the GIC driver seems to match
for a lot of different strings.
