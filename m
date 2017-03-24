From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ARM: dts: r7s72100: add power-domains to sdhi
Date: Fri, 24 Mar 2017 08:55:44 +0100
Message-ID: <CAMuHMdUJMEjb8UhaHHK3aE2uEoUpKFtSFXLhYwgJHKu9YDeVHQ@mail.gmail.com>
References: <20170209133803.21539-1-chris.brandt@renesas.com>
 <CAMuHMdXRD3o7KdaADvPYxzeuEVo44nRVWHfCverPc+9s=0owPA@mail.gmail.com> <20170324070228.GI1319@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170324070228.GI1319@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Chris Brandt <chris.brandt@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

On Fri, Mar 24, 2017 at 8:02 AM, Simon Horman <horms@verge.net.au> wrote:
> On Wed, Mar 22, 2017 at 02:25:04PM +0100, Geert Uytterhoeven wrote:
>> (this time reply-to-all)
>>
>> On Thu, Feb 9, 2017 at 2:38 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
>> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
>> > Fixes: 66474697923c ("ARM: dts: r7s72100: add sdhi to device tree")
>>
>> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thanks, I have queued this up for v4.12.
>
> The fixes tag above indicates this is a fix for v4.10, however, when I
> tried to apply it on top of v4.11-rc1 there was a conflict.  So I think a
> backport will be required if we want it to be considered for v4.11 and be
> considered for and in turn v4.10-stable.

That's because of commit 3d2abda02ad2d06d
("ARM: dts: r7s72100: update sdhi clock bindings")

> This makes things a bit messy with regards to conflicts between v4.11 and
> v4.12 and I'm inclined to pass on the backport.

If you ever want to backport, you'll have two backport changes too the
SDHI driver, too.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
