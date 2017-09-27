From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: RISC-V Linux Port v9
Date: Tue, 26 Sep 2017 23:08:02 -0700
Message-ID: <CAK8P3a1ROLHHY9HE0LtPywhTMqBaHjp8kd4ZVBr3iWTyveBh9A@mail.gmail.com>
References: <20170927015638.19443-1-palmer@dabbelt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170927015638.19443-1-palmer@dabbelt.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, patches@groups.riscv.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, albert@sifive.com, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Will Deacon <will.deacon@arm.com>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Oleg Nesterov <oleg@redhat.com>, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 26, 2017 at 6:56 PM, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> As per suggestions on our v8 patch set, I've split the core architecture code
> out from our drivers and would like to submit this patch set to be included
> into linux-next, with the goal being to be merged in during the next merge
> window.  This patch set is based on 4.14-rc2, but if it's better to have it
> based on something else then I can change it around.

-rc2 is good, just don't rebase it any more. I'd suggest that at the point this
becomes part of linux-next, you stop modifying the patches further and
move to adding any additional changes as patches on top.

>  * I cleaned up the defconfigs -- there's actually now just one, and it's
>    empty.  For now I think we're OK with what the kernel sets as defaults, but
>    I anticipate we'll begin to expand this as people start to use the port
>    more.

The kernel defaults are not really as sensible as one would hope. Maybe
go through your previous defconfig once more and pick up the items that
made sense.

         Arnd
