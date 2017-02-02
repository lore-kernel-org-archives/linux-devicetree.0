From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH 2/4] arm64: dts: m3ulcb: Update memory node to 2 GiB map
Date: Thu, 2 Feb 2017 21:21:38 +0300
Message-ID: <04440249-fce4-f726-7c3a-de089b6c8fe9@cogentembedded.com>
References: <1485442422-18259-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1485442460-18339-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdU7dHC3rCeYGVbEPQ0riNU9PEptxT-0WhmLJp0S7CS1LQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdU7dHC3rCeYGVbEPQ0riNU9PEptxT-0WhmLJp0S7CS1LQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On 02.02.2017 21:19, Geert Uytterhoeven wrote:
> Hi Vladimir,
>
> On Thu, Jan 26, 2017 at 3:54 PM, Vladimir Barinov
> <vladimir.barinov@cogentembedded.com> wrote:
>> From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
>>
>> This patch updates memory region:
>>
>>    - After changes, the new map of the m3ulcb board on R8A7796 SoC
>>      Bank0: 1GiB RAM : 0x000048000000 -> 0x0007fffffff
>>      Bank1: 1GiB RAM : 0x000600000000 -> 0x0063fffffff
>>
>>    - Before changes, the old map looked like this:
>>      Bank0: 1GiB RAM : 0x000048000000 -> 0x0007fffffff
> BTW, this means M3ULCB has a different R-Car M3 SiP than Salvator-X,
> with half the RAM?
Yes,
http://elinux.org/R-Car/Boards/M3SK

Regards,
Vladimir

>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
