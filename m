From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 0/9] Renesas RZ/A1 pin and gpio controller
Date: Tue, 11 Apr 2017 11:14:18 +0200
Message-ID: <CAMuHMdX_QAyJTs_M_KUyw=JfP0KuRw+2u5w+eo9AYxBc2BC+sA@mail.gmail.com>
References: <1491401247-7030-1-git-send-email-jacopo+renesas@jmondi.org> <CACRpkdaxdDX71m4EGSHD2OV1gQsCwQeOCyeMDCndPxNpZU-oPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaxdDX71m4EGSHD2OV1gQsCwQeOCyeMDCndPxNpZU-oPw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Tue, Apr 11, 2017 at 11:05 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Wed, Apr 5, 2017 at 4:07 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
>> Hi Linus,
>>    this is 4th round of gpio/pincontroller for RZ/A1 devices.
>>
>> As you suggested in v3 review, I have now added what we called pinmux flags
>> to the list of standard pinconf generic properties, and we're now using
>> generic parsing routines to collect them and apply them when multiplexing
>> pins.
>
> I have merged patch 1/9 so you have the necessary infrastructure in place.
>
> If Geert want to send a pull request based on my devel branch that is fine
> (but a bit late) else the requirements are there for a merge in the early
> v4.12 kernel cycle.

I agree it's a bit late. Will queue for v4.13.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
