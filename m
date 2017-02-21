From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/3] mtd: nand: Cleanup/rework the atmel_nand driver
Date: Tue, 21 Feb 2017 18:05:22 +0100
Message-ID: <20170221170522.fphb37d266fyg3to@piout.net>
References: <CAHp75VczsC9WdZWR9iCRh2JoNLFZyOtodrsDRYQoyaN7nkyf=A@mail.gmail.com>
 <CAHp75Vc_q-bEzA2-hVpHyR0GZ8mXxwJ8-UjECe31T04mb67q4w@mail.gmail.com>
 <20170221090610.6d531b94@bbrezillon>
 <CAHp75VfZfj-8ih3vg63w_dAq8xXE2Whu1bANXRcXS1_EGNq43A@mail.gmail.com>
 <20170221112641.6276c001@bbrezillon>
 <CAHp75Vcb9gtzF7LvH74JwL4dTUyQvKmg=dnTXKfjhVHuyK3WXg@mail.gmail.com>
 <20170221112720.ynehsryprhrhzjla@piout.net>
 <CAHp75VcKjYYAw8gw8yYXrd-vzZo50WOQ06AzPx+0g9Zakzjm-w@mail.gmail.com>
 <20170221162133.jch6yzpotj4s7zob@piout.net>
 <CAHp75VeB4eVuN5NMfAfQUtssuHezTyAM8FUswuR8FheUk1V-oA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VeB4eVuN5NMfAfQUtssuHezTyAM8FUswuR8FheUk1V-oA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hans-Christian Egtvedt <egtvedt-BrfabpQBY5qlHtIdYg32fQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, "open list:MEMORY TECHNOLOGY..." <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Haavard Skinnemoen <hskinnemoen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian
List-Id: devicetree@vger.kernel.org

On 21/02/2017 at 18:32:26 +0200, Andy Shevchenko wrote:
> I did it ~year or so before where another relocation bug was discovered (fixed).
> 
> > please feel free to
> > send a patch to remove the whole architecture.
> > The benefits for atmel will be: proper big endian support, removal of
> > platform data from all the drivers, better clocksource handling.
> 
> That is good point, but if maintainers don't care, why anyone else should?
> Neither do I.
> 
> >> > It can be frustrating at times to handle that platform but if it is
> >> > working for someone, I don't see why we would remove it.
> >>
> >> How it's working if it's not linked?
> >>
> >
> > Come on, v4.10 has just been release and v4.9 was building just fine. Do
> > you really expect everybody to closely follow linux-next or update
> > overnight?
> 
> What version do you use as compiler?
> 
> Today's linux-next:
> $ make O=~/prj/TMP/out/avr32 C=1 CF=-D__CHECK_ENDIAN__ -j64 CONFIG_DEBUG_INFO=
> y CONFIG_DEBUG_SECTION_MISMATCH=y
> 
>   CC      lib/sbitmap.o
> {standard input}: Assembler messages:
> {standard input}:378: Warning: Unary operator + ignored because bad
> operand follows
> {standard input}:378: Warning: missing operand; zero assumed
> {standard input}:378: Internal error!
> Assertion failure in finish_insn at .././gas/config/tc-avr32.c line 3498.
> Please report this bug.
> scripts/Makefile.build:294: recipe for target 'lib/sbitmap.o' failed
> 
> $ avr32-linux-gcc --version
> avr32-linux-gcc (GCC) 4.2.2-atmel.1.0.8
> 

avr32-linux-gcc (GCC) 4.2.4-atmel.1.1.3.avr32linux.1

Today's linux-next built without network support, the issue still being:
virt/built-in.o: warning: input is not relaxable net/built-in.o: In function `rtnl_fill_vfinfo':
rtnetlink.c:(.text+0x21974): relocation truncated to fit: R_AVR32_11H_PCREL against `.text'+2156c
rtnetlink.c:(.text+0x2198a): relocation truncated to fit: R_AVR32_11H_PCREL against `.text'+2156c
Makefile:983: recipe for target 'vmlinux' failed


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
