From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 6/6] dt-bindings: interrupt-controller: RISC-V PLIC documentation
Date: Fri, 03 Aug 2018 18:48:43 -0700 (PDT)
Message-ID: <mhng-6ecc7259-6cd2-4649-a0b5-be7c79176657@palmer-si-x1c4>
References: <CAL_JsqJWOXX7-_sb4W63wPRqFjHuU-DM-LNYgczieWjAE5ABfQ@mail.gmail.com>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJWOXX7-_sb4W63wPRqFjHuU-DM-LNYgczieWjAE5ABfQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org
Cc: Christoph Hellwig <hch@lst.de>, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, 01 Aug 2018 11:26:31 PDT (-0700), robh@kernel.org wrote:
> On Wed, Aug 1, 2018 at 1:12 AM Christoph Hellwig <hch@lst.de> wrote:
>>
>> On Tue, Jul 31, 2018 at 04:46:30PM -0600, Rob Herring wrote:
>> > Perhaps this should be 'sifive,plic0'
>>
>> Excepet for the fact this the old name has already been in shipping
>> hardware and release of qemu and other emulators it should.
>
> Not really my problem that they didn't follow the process and upstream
> their binding first. But this alone is just a string identifier, so I
> don't really care that much. If things are really a mess, then the
> next implementations will have to have better compatible strings. More
> likely, I'll just see folks trying to add various properties to deal
> with all the differences.
>
> You could always define a better compatible and leave 'riscv,plic0' as
> a fallback to avoid breaking things.

Ya, sorry about that.  FWIW, we don't consider any of the bindings stable until 
they're actually accepted upstream, so it's on us to fix our bootloaders to 
match what actually lands upstream.  Luckily there's not that much hardware out 
there and none of it is in production, so I'm OK forcing people to upgrade 
bootloaders to make this all work.

I think it's probably best to leave the extra compat string out of the kernel 
proper, as then it'll never be enshrined as a RISC-V standard.

>> > Normally this would have an SoC specific compatible too. Sometimes we
>> > can get away without, but it doesn't seem like the PLIC is very tightly
>> > specified nor has common implementations.
>>
>> It is a giant f***cking mess to be honest.  Adding a highlevel spec
>> to the ISA but not a register layout is completely idotic, but if you
>> look at the current riscv-sw list this decision is still defended by
>> SiFive / the RISC-V foundation.  The whole stale of the RISC-V platform
>> Ecosystem is rather pathetic unfortunately, and people don't seem to
>> be willing to learn from past good practice nor mistakes in ARM land.
>
> Interrupt controllers are where the differentiation is. ;)

Again, sorry about that :).  The RISC-V platform specification really should 
have started a year ago, but I'm afraid there's just a bit too much going on on 
my end.

If it helps any, we just submitted a plumbers dev room with one topic being the 
RISC-V platform spec, so I guess I'm in official trouble now it there isn't at 
least something to talk about by November...
