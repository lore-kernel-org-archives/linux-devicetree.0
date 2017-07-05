From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0
 clock selector PHY
Date: Wed, 5 Jul 2017 14:22:12 +0200
Message-ID: <CAMuHMdWkSqNdzDNTyvHvGaG-Tw2md_aGHSWh7jXVyoBYMJ8m7w@mail.gmail.com>
References: <1498631315-15730-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdV1QvFAD3h7u0rL3-hx6OMRmxdvcj_jUo-ewdCHmcU0fQ@mail.gmail.com> <TY1PR06MB09928B28AAA01C47471B6969D8D40@TY1PR06MB0992.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <TY1PR06MB09928B28AAA01C47471B6969D8D40@TY1PR06MB0992.apcprd06.prod.outlook.com>
Sender: linux-clk-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Shimoda-san,

On Wed, Jul 5, 2017 at 1:57 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>> From: Geert Uytterhoeven
>> Sent: Wednesday, July 5, 2017 7:09 PM
>> On Wed, Jun 28, 2017 at 8:28 AM, Yoshihiro Shimoda
>> <yoshihiro.shimoda.uh@renesas.com> wrote:
>> > R-Car USB 2.0 controller can change the clock source from an oscillator
>> > to an external clock via a register. So, this patch adds support
>> > the clock source selector as a clock driver.

>> > --- /dev/null
>> > +++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c

>> > +/* Since this driver needs other ccf drivers, this uses subsys_initcall_sync */
>> > +subsys_initcall_sync(rcar_usb2_clock_sel_init);
>>
>> I suppose this is a workaround for the lack of probe deferral support in the
>> USB subsystem?
>
> This is my fault. I added "power-domains" property into this device's node.
> After I remove the power-domains like the cpg node, this driver can use subsys_initcall()
> instead of subsys_initcall_sync().

Does the clock sel module requires the functional clock "ehci_ohci" to be
running before you can access its registers?
If yes, I think there should be a "power-domains" property.

Then, you can simplify the code by calling

        pm_runtime_enable(dev);
        pm_runtime_get_sync(dev);

and remove the explicit handling of the functional clock.

That does not solve probe deferral handling in the USB subsystem, though.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
