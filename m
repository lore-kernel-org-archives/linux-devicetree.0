From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: clk: clk-mstp has never worked for RZ/A1
Date: Wed, 14 Dec 2016 19:57:58 +0100
Message-ID: <CAMuHMdVjHdquLp2fGbW2Q+pNKVyn3x5QF=KfdBiy5hLJXsz6oQ@mail.gmail.com>
References: <SG2PR06MB1165A4A8A555A3176D0C4ED98A9A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdUJFSbX96pqY2Ogxztxz-SWCNfbe=d3eWKn+eWSdHLwfw@mail.gmail.com> <SG2PR06MB11657308A9FA6EF71F5F89688A9A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <SG2PR06MB11657308A9FA6EF71F5F89688A9A0-ESzmfEwOt/xoAsOJh7vwSm0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org" <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Wed, Dec 14, 2016 at 5:22 PM, Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> On Dec 14, 2016, Geert Uytterhoeven wrote:
>> Another option is to let the driver bind against "renesas,r7s72100-mstp-
>> clocks", and switch to 8-bit access mode.
>>
>> CLK_OF_DECLARE(cpg_mstp_clks, "renesas,r7s72100-mstp-clocks",
>> cpg_mstp_clocks_init8);
>>
>> cpg_mstp_clocks_init8() can set a gloal flag, and call
>> cpg_mstp_clocks_init().
>>
>> The latter means no DT update is needed, and thus preserves compatibility
>> with old DTBs.
>
> I just coded that and it works good. Thank you.

I'm glad to hear that!

> Now, one more question before I submit a patch for review:
>
> I would like to add a "Fixes:" to the commit log so it can be considered for 4.9-stable (in reality it could go all the way back to when r7s72100 support was added)
>
> But, the current file path didn't exist until after commit b3a33077c0dd ("clk: renesas: move drivers to renesas directory") on 2016-03-02.
>
> So should I use that commit for my 'Fixes'?

Please use the original commit, as that's where the bug was introduced.
Git is quiet good in tracking renames, so cherry-picking it to v4.5 and older
kernels may just work ;-)

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
