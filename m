From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 0/3] Add R8A7743/SK-RZG1M PFC support
Date: Wed, 7 Jun 2017 19:52:20 +0200
Message-ID: <CAMuHMdUDO-+F_fOf4Z1ZPdZhs_MBn8J6ig-Pn4K0oMvv-EM2gw@mail.gmail.com>
References: <20170420185132.258111787@cogentembedded.com> <20170424061217.GC14843@verge.net.au>
 <4937ae78-8800-1a11-547b-2269d063d45a@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <4937ae78-8800-1a11-547b-2269d063d45a@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Wed, Jun 7, 2017 at 6:16 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 04/24/2017 09:12 AM, Simon Horman wrote:
>
>>>    Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
>>> 'renesas-devel-20170420-v4.11-rc7' tag.  We're adding the R8A7743 PFC
>>> node
>>> and then describing the pins for SCIF0 and Ether devices declared
>>> earlier.
>>> These patches depend on the R8A7743 PFC suport in order to work properly.
>>
>>
>> Thanks. I have marked these as deferred pending acceptance of the PFC
>> driver changes. Please repost or otherwise let me know when dependency
>> is satisfied.
>
>    FYI, Linus W. has pulled the R8A774x PFC patches for 4.13:
>
> https://www.spinics.net/lists/linux-renesas-soc/msg14824.html

But Simon has to wait for v4.13-rc1 to apply the DTS parts, to avoid
regressions in renesas/devel.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
