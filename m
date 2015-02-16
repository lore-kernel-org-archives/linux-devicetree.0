From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC] ARM: shmobile: r8a7790: Fix HSUSB clock to hp_clk
 from mp_clk
Date: Mon, 16 Feb 2015 15:04:16 +0100
Message-ID: <CAMuHMdUHMA+cJTGWS-0Prt6-BT5=UkGQ4OWZ+bz-g2G7DSwLzw@mail.gmail.com>
References: <1424011746-3787-2-git-send-email-ykaneko0929@gmail.com>
	<CAMuHMdX=cdHaiHCnYsJvZFc2RNv=Pk8cLXuvkezg4Ht4U4mXsg@mail.gmail.com>
	<20150216135754.GA5479@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20150216135754.GA5479@verge.net.au>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>, Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>, Linux-sh list <linux-sh@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

On Mon, Feb 16, 2015 at 2:57 PM, Simon Horman <horms@verge.net.au> wrot=
e:
> On Mon, Feb 16, 2015 at 10:20:10AM +0100, Geert Uytterhoeven wrote:
>> Hi Kaneko-san, Mizuguchi-san,
>>
>> On Sun, Feb 15, 2015 at 3:49 PM, Yoshihiro Kaneko <ykaneko0929@gmail=
=2Ecom> wrote:
>> > From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
>> >
>> > HSUSB uses hp_clk for H/W register access.
>>
>> That indeed seems to be true, and that's what this patch is changing=
=2E
>>
>> > HSUSB uses mp_clk for USB-DMAC access.
>>
>> However, page 64-2 doesn't mention the MP clock for USB-DMAC:
>>    "AXI bus clock (ZS=CF=86: 260 MHz), HPB bus clock (HP=CF=86: 130 =
MHz).
>>     USB local bus clock (48 MHz)"
>> So your statement doesn't seem to be true?
>
> Thanks, I see that too.
>
>> Note that mstp3_clks in dtsi has hp_clk as the parent for both usbdm=
ac0 and
>> usbdmac1, so if your statement would be true, that has to changed, t=
oo?
>>
>> The same is true for other members of the R-Car Gen2 family, e.g. yo=
ur patch
>> for r8a7791.
>
> It seems to me that we could:
>
> 1. Apply this patch with the changelog updated and;
> 2. Follow up on the DMAC clocks
>
> Does that sound reasonable to you?

Yes, that sounds fine to me.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
