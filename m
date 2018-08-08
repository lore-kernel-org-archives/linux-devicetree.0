From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 6/8] dt-bindings: interrupt-controller: RISC-V PLIC
        documentation
Date: Wed, 8 Aug 2018 18:41:27 +0200
Message-ID: <20180808164127.GA5733@lst.de>
References: <20180804082319.5711-1-hch@lst.de> <20180804082319.5711-7-hch@lst.de> <CAL_JsqKKCPhb1um_+68ya0ng_v2tSb5O+-8RQPqx7Od3sJ4FuA@mail.gmail.com> <20180808150448.GA31785@lst.de> <CAL_JsqKgawQA5V2W1e9QFb_Ri+Aka-08WizeSD9kdxyBdcwpEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKgawQA5V2W1e9QFb_Ri+Aka-08WizeSD9kdxyBdcwpEQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@sifive.com>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Anup Patel <anup@brainfault.org>, atish.patra@wdc.com, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 08, 2018 at 10:15:58AM -0600, Rob Herring wrote:
> 'interrupts' (via
> interrupt-parent) or 'interrupts-extended' has to point to an
> 'interrupt-controller' node. I guess you could make the cpu nodes
> interrupt-controllers. That's a bit strange, but I can't think of a
> reason why that wouldn't work.

It could work, and would actually match how the hardware works
fairly closely.

> Just because the cpu-intc is not made to be an irqchip in the kernel
> doesn't mean it can't still be represented as an interrupt-controller
> in DT. It shouldn't be designed just around how some OS happens to
> implement things.

Independent of how you implement it, there isn't really such a thing
as the cpu-intc.  The CPU itself has a number of exceptions, that
are all handled the same way.  One of them just happens to be
the connection to an external interrupt controller.

That being said I'm fine with keeping up the pretence (at least in
DT) that it is a separate entity and resubmit the cpu-intc docs
given how widespread they exist already.
