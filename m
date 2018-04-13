Return-Path: <SRS0=Uqzc=HC=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <TY1PR06MB09922C1E3B83DF01EB084714D8BC0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1523439386-1032-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1523439386-1032-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVP5U2W3Zmpfe689UYBdNfS6nK7jFW5oQcJQ_QakW1UfQ@mail.gmail.com>
 <20180412075506.frylywvges5c6nzx@verge.net.au> <TY1PR06MB09922C1E3B83DF01EB084714D8BC0@TY1PR06MB0992.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Apr 2018 10:46:20 +0200
Message-ID: <CAMuHMdVXm52gCOx9KL+0Nn2pw507ansPVFGtAjN8sTTwEKWtdg@mail.gmail.com>
Subject: Re: [PATCH 3/4] soc: renesas: rcar-sysc: Add support for R-Car E3
 power areas
Content-Type: text/plain; charset="UTF-8"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, TAKESHI KIHARA <takeshi.kihara.df@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda-san,

On Thu, Apr 12, 2018 at 10:25 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>> From: Simon Horman <horms@verge.net.au>, Sent: Thursday, April 12, 2018 4:55 PM
>> On Wed, Apr 11, 2018 at 05:10:02PM +0200, Geert Uytterhoeven wrote:
>> > On Wed, Apr 11, 2018 at 11:36 AM, Yoshihiro Shimoda
>> > <yoshihiro.shimoda.uh@renesas.com> wrote:
>> > > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> > >
>> > > This patch adds Cortex-A53 CPU{0,1}, Cortex-A53 SCU, Cortex-R7, A3VC,
>> > > A2VC1 and 3DG-{A,B} power domain areas for the R8A77990 SoC.
>> >
>> > > - The 3DG power domain resume order of R-Car E3 is [3DG-B] -> [3DG-A],
>> >
>> > So 3DG-B is the parent of 3DG-A?
>> > I have to take your word on this, as I cannot find this in the documentation.
>
> Geert-san, you're correct. the documentation doesn't have any description about this.
> So, software team are asking HW guys about this.
> This means, should we drop 3DGs (or always on these domains) at initial support?

Using always-on is an acceptable solution, for now.

But let's wait and see the response from the HW guys. The v4.18 deadline is
sufficiently far in the future...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
