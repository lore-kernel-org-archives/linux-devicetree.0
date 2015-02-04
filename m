From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/5] ARM: shmobile: r8a7740: Migrate to generic l2c OF initialization
Date: Wed, 4 Feb 2015 18:04:57 +0100
Message-ID: <CAMuHMdU-GahSaQj6v2Yhmxsj8gmt1sbwrPfqm=ydMCc=uDcenA@mail.gmail.com>
References: <1423059315-28519-1-git-send-email-geert+renesas@glider.be>
	<7800327.b3sMA1XGtZ@wuerfel>
	<CAMuHMdVi3kq2p30cNFYW2WCM-OvMSFC1W0r5nYkaN5Np=zW4_Q@mail.gmail.com>
	<3598552.qKIyokxIlF@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <3598552.qKIyokxIlF@wuerfel>
Sender: linux-sh-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, Russell King <rmk@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Wed, Feb 4, 2015 at 5:36 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday 04 February 2015 15:43:43 Geert Uytterhoeven wrote:
>>
>> Indeed. Note that I only try to preserve the register value before and after
>> migrating to generic l2c OF initialization. I did read (part of) the pl310
>> documentation, but it's still not clear to me if we really need
>> L2C_AUX_CTRL_SHARED_OVERRIDE. Perhaps this was just copied from
>> somewhere else without much afterthought?
>
> Have you checked what the hardware/bootloader actually sets in that bit?

Yes, it boots with 0x02040000, i.e. L2C_AUX_CTRL_SHARED_OVERRIDE
(bit 22) is not set.

After the l2c driver is finished with it, it contains 0x46440001.

> Maybe you can remove that override completely and the initial Linux
> default was just set to the same that is already set on powerup?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
