From: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH 2/3] macb: Update compatibility string for SiFive FU540-C000
Date: Tue, 20 Aug 2019 11:10:20 +0200
Message-ID: <mvm5zmskxs3.fsf@suse.de>
References: <1563534631-15897-1-git-send-email-yash.shah@sifive.com>
        <1563534631-15897-2-git-send-email-yash.shah@sifive.com>
        <4075b955-a187-6fd7-a2e6-deb82b5d4fb6@microchip.com>
        <CAJ2_jOEHoh+D76VpAoVq3XnpAZEQxdQtaVX5eiKw5X4r+ypKVw@mail.gmail.com>
        <alpine.DEB.2.21.9999.1908131142150.5033@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1908131142150.5033@viisi.sifive.com> (Paul
        Walmsley's message of "Tue, 13 Aug 2019 11:42:49 -0700 (PDT)")
Sender: netdev-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Nicolas Ferre <Nicolas.Ferre@microchip.com>, David Miller <davem@davemloft.net>, Yash Shah <yash.shah@sifive.com>, Rob Herring <robh+dt@kernel.org>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>, Sachin Ghadi <sachin.ghadi@sifive.com>
List-Id: devicetree@vger.kernel.org

On Aug 13 2019, Paul Walmsley <paul.walmsley@sifive.com> wrote:

> Dave, Nicolas,
>
> On Mon, 22 Jul 2019, Yash Shah wrote:
>
>> On Fri, Jul 19, 2019 at 5:36 PM <Nicolas.Ferre@microchip.com> wrote:
>> >
>> > On 19/07/2019 at 13:10, Yash Shah wrote:
>> > > Update the compatibility string for SiFive FU540-C000 as per the new
>> > > string updated in the binding doc.
>> > > Reference: https://lkml.org/lkml/2019/7/17/200
>> >
>> > Maybe referring to lore.kernel.org is better:
>> > https://lore.kernel.org/netdev/CAJ2_jOFEVZQat0Yprg4hem4jRrqkB72FKSeQj4p8P5KA-+rgww@mail.gmail.com/
>> 
>> Sure. Will keep that in mind for future reference.
>> 
>> >
>> > > Signed-off-by: Yash Shah <yash.shah@sifive.com>
>> >
>> > Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
>> 
>> Thanks.
>
> Am assuming you'll pick this up for the -net tree for v5.4-rc1 or earlier.
> If not, please let us know.

This is still missing in v5.4-rc5, which means that networking is broken.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
