From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and output-enable
Date: Sun, 7 May 2017 09:50:08 +0200
Message-ID: <CACRpkdY5z2RZ36hEODtTnhBKF-6xZyzrW4WMGGZgTXabNSijxg@mail.gmail.com>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
 <1493281194-5200-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAHp75Vcy1OE+9htFx9k3kQhGARQPT1C0gg3SEKZd7ULu_vkUMA@mail.gmail.com>
 <CACRpkdayW0qPXDcc_JofkwtX5UHhDPxiY_8deZZ7+hPNJkjgeQ@mail.gmail.com> <CAMuHMdXyWFw6YW=yruCijgzgapBZ_VAkFboTuWW=CMv+8npU4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXyWFw6YW=yruCijgzgapBZ_VAkFboTuWW=CMv+8npU4w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 28, 2017 at 12:09 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

>> You can certainly call it whatever the datasheet calls it
>> in your driver #defines but for the DT bindings we would
>> ideally have the physical world things.
>
> FWIW, you have already applied v4.

Yeah I noticed when sending pull requests.. let's see if it stays in or
I will have to revert it for more discussion.

Sorry for being so flimsy at times, I guess I'm overloaded.

Yours,
Linus Walleij
