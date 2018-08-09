From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/11] dt-bindings: interrupt-controller: RISC-V PLIC
        documentation
Date: Thu, 9 Aug 2018 08:43:53 +0200
Message-ID: <20180809064353.GA19566@lst.de>
References: <CAL_JsqKVTGcJP=AJR+6h1Brv8MW9xjD=v2__Xtegkd-+Hnua7g@mail.gmail.com> <mhng-cfa17eb2-3548-48ee-9216-74a3607a3091@palmer-si-x1c4>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <mhng-cfa17eb2-3548-48ee-9216-74a3607a3091@palmer-si-x1c4>
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: robh+dt@kernel.org, atish.patra@wdc.com, Christoph Hellwig <hch@lst.de>, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, anup@brainfault.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, Aug 08, 2018 at 11:29:17PM -0700, Palmer Dabbelt wrote:
>> So I guess to answer my question, you are just making up version
>> numbers. Unless you are doing the IP verilog too, don't do that.
>
> Well, in this case my proposal would be that we change the hardware team's 
> versioning scheme to match whatever we decide on the versioning scheme 
> should be as a part of this discussion.  I proposed accepting whatever 
> versioning scheme is decided upon hereto the hardware team before 
> discussing changing the naming scheme and they agreed to do so.
>
> So we're really in the drivers' seat here.
>
>> If you want to use just 'sifive,plic' then I'm fine with that. I've
>> given you the potential problems with that and they will be your
>> problems to deal with. Maybe you'll get lucky. Plus it won't be a
>> problem for the 1st implementation.
>
> I'd prefer to have some versioning scheme, that's why I'm talking so much 
> about this :).  I really just want to learn how to get the right one, as 
> I'm quite new to all this and we'll have many of these.

Based on the discussion so far I think we should settle for sifive,plic +
an actual implementation string suggested by Palmer and Andrew.

This is what I have right now:

http://git.infradead.org/users/hch/riscv.git/commitdiff/1972707029f8f1216dbe14bd7791295e4b37f560

and which I'd like to send out before it is too late.
