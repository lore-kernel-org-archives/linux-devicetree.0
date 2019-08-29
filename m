From: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2 0/2] Update ethernet compatible string for SiFive FU540
Date: Thu, 29 Aug 2019 15:24:58 +0530
Message-ID: <CAJ2_jOGiTgGZ0TEZt6hBVB3oFxWkrrKVGQ6n__G4Zf_-ijY10Q@mail.gmail.com>
References: <1566882364-23891-1-git-send-email-yash.shah@sifive.com> <20190828.140644.534529249197568915.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190828.140644.534529249197568915.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>, Sachin Ghadi <sachin.ghadi@sifive.com>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 29, 2019 at 2:36 AM David Miller <davem@davemloft.net> wrote:
>
> From: Yash Shah <yash.shah@sifive.com>
> Date: Tue, 27 Aug 2019 10:36:02 +0530
>
> > This patch series renames the compatible property to a more appropriate
> > string. The patchset is based on Linux-5.3-rc6 and tested on SiFive
> > Unleashed board
>
> You should always base changes off of "net" or "net-next" and be explicitly
> in your Subject lines which of those two trees your changes are for f.e.:
>
>         Subject: [PATCH v2 net-next N/M] ...

I will keep this in mind for future patches.

>
> >
> > Change history:
> > Since v1:
> > - Dropped PATCH3 because it's already merged
> > - Change the reference url in the patch descriptions to point to a
> >   'lore.kernel.org' link instead of 'lkml.org'
>
> Series applied to 'net'.

Thanks!

- Yash
