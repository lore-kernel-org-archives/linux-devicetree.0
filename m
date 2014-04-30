From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 01/11] ARM: shmobile: r7s72100: document MSTP clock support
Date: Wed, 30 Apr 2014 20:21:51 +0200
Message-ID: <CAMuHMdUYLrG53GgpPqixc7CBmgqSAGUo9Ue7t1Yy-8mDwEzM8Q@mail.gmail.com>
References: <1398765822-2314-1-git-send-email-wsa@the-dreams.de>
	<1398765822-2314-2-git-send-email-wsa@the-dreams.de>
	<20140430014148.GC24989@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20140430014148.GC24989@verge.net.au>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa@the-dreams.de>, Linux-sh list <linux-sh@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mike Turquette <mturquette@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 30, 2014 at 3:41 AM, Simon Horman <horms@verge.net.au> wrote:
> On Tue, Apr 29, 2014 at 12:03:32PM +0200, Wolfram Sang wrote:
>> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
>>  Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
>> index 02a25d99ca61..6c3c0847e4fd 100644
>> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
>> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
>> @@ -10,6 +10,7 @@ index in the group, from 0 to 31.
>>  Required Properties:
>>
>>    - compatible: Must be one of the following
>> +    - "renesas,r7s72100-mstp-clocks" for R7S72100 (RZ) MSTP gate clocks
>>      - "renesas,r8a7790-mstp-clocks" for R8A7790 (R-Car H2) MSTP gate clocks
>>      - "renesas,r8a7791-mstp-clocks" for R8A7791 (R-Car M2) MSTP gate clocks
>>      - "renesas,cpg-mstp-clock" for generic MSTP gate clocks
>> --
>> 1.9.2
>
> I believe that Mike Turquette (CCed) should take this.
>
> I also believe that as it is relates to bindings it
> needs to be reviewed by the devicetree people (CCed).
> (Please correct me if I am wrong.)

You're correct, but this change is fairly trivial.

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
