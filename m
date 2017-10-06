From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 04/18] arm64: dts: m3ulcb-kf: initial device tree
Date: Fri, 6 Oct 2017 09:20:31 +0200
Message-ID: <CAMuHMdUhe9x9kkbEtcu1=+tYARi1aJLPSG+CM-9bOAPo8aaPTA@mail.gmail.com>
References: <1505398732-4614-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdX-7MG2fCzJ-K5iQLnJcmZBaWjqMhmOhCxEemmWTh9pvw@mail.gmail.com> <9635bb2d-8695-a168-d49e-0bd51807cc19@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <9635bb2d-8695-a168-d49e-0bd51807cc19@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On Fri, Oct 6, 2017 at 4:47 AM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> Do you need extra actions from my side to accept this patch?

Not for me. Your patch is fine as-is, as upstream has no support for loading
DT overlays.

> On 20.09.2017 15:32, Geert Uytterhoeven wrote:
>> [CC Pantelis]
>>
>> On Thu, Sep 14, 2017 at 4:18 PM, Vladimir Barinov
>> <vladimir.barinov@cogentembedded.com> wrote:
>>>
>>> Add the initial device tree for the M3ULCB with Kingfisher extension
>>> infotainment board.
>>>
>>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>>> ---
>>> Changes in version 2:
>>> - added own compatible value "shimafuji,kingfisher"
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> Some food for thought below...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
