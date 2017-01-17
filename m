From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ARM: dts: r7s72100: fix sdhi clock define
Date: Tue, 17 Jan 2017 10:52:28 +0100
Message-ID: <CAMuHMdViHu7i_Lqk80toWrW=KsR49hodGnTd-Cpq35ts9gNgyw@mail.gmail.com>
References: <PS1PR06MB116243F531726538252C2BAE8A780@PS1PR06MB1162.apcprd06.prod.outlook.com>
 <CAMuHMdVkTS21UnZA9OyEZ=mR5+GtAEbiLwpe=uKB_O6deXBPyw@mail.gmail.com>
 <SG2PR06MB1165D0D67AD68A12030C961D8A780@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdUVnUS-iOM8cbXNP7jMLNFb5+hgnMp3edkCzpbEpAePzw@mail.gmail.com>
 <SG2PR06MB11659339E4A08373D3626BB28A780@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdX=cNuBSMqvPKYa7J5g7T4dSfHhSjcGdmuOPw_as=6RQQ@mail.gmail.com>
 <20170116114023.GA3029@katana> <SG2PR06MB11656A823E53F55C4FBCA7E88A7C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20170117082118.GA1487@katana> <CAMuHMdVW=HORcCA0brX4tZdtG9knqE7D_wnM5VtSrxz2LdBgUA@mail.gmail.com>
 <20170117094529.GC1487@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170117094529.GC1487@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Chris Brandt <Chris.Brandt@renesas.com>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: devicetree@vger.kernel.org

Hi Wolfram,

On Tue, Jan 17, 2017 at 10:45 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> I have no idea if the SDHI driver disables the module clock when it is
>> idle, but shouldn't the card detect clock be running all the time when the
>> driver is bound to the device?
>
> Yes, it should. And for all instances with just one clock, this means
> this main clock must be running. So, en-/disable functions are all about
> suspend/resume and bind/unbind. (Huh, looks like the unbind part is
> missing, though. Need to look closer).
>
> My take is: either we implement the power saving and handle the cd clock
> seperately. Or we ignore the power saving for now and handle both clocks
> as virtually one, i.e. en-/disable them at the same time.
>
> Doesn't make sense?

If we handle them as one, won't we miss card detect events due to the
card detect clock being disabled while SDHI is idle?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
