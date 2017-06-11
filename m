From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and output-enable
Date: Sun, 11 Jun 2017 23:45:49 +0200
Message-ID: <CACRpkdZ=hNJLyV94FyRBSR3Dk8NLe-jEo3qbUKDya6ruqG3KNQ@mail.gmail.com>
References: <CACRpkdZkNGSUvTrEdjbGKO1hr799QpJBGSHPVbsBibph7Jx61A@mail.gmail.com>
 <20170508160120.GB25206@w540> <CAHp75VfOMKOhpkec+htA6DRQhivpSmNXy1=Ayig1W+ZC84gTLw@mail.gmail.com>
 <20170508172516.GC25206@w540> <CACRpkdY1h+yfFuk2y9=nZqqvW9=G33_eHCisvuMkJ5b3zizY7Q@mail.gmail.com>
 <CAA+hA=Q9hwe7_xL440Reoi7z7m8-SScZ5E057419KSA7dQK=tQ@mail.gmail.com>
 <20170523183735.GC13664@w540> <CACRpkdYcaGzSvAN2Trqwer+8GbqXyfpE=VqiYcQvCOqhDO9MMw@mail.gmail.com>
 <20170529104229.GB21347@w540> <CAA+hA=T56WHugmA+5V5ZC6TTxeSUVt1hr0v53YuDsUYgBcvKTw@mail.gmail.com>
 <20170609075028.GE15739@w540>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170609075028.GE15739@w540>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: jmondi <jacopo@jmondi.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Dong Aisheng <dongas86@gmail.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Chris Brandt <Chris.Brandt@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 9, 2017 at 9:50 AM, jmondi <jacopo@jmondi.org> wrote:
> On Fri, Jun 09, 2017 at 03:26:57PM +0800, Dong Aisheng wrote:

>> > I see three options here:
>> >
>> > 1) Add "output-buffer-enable" and "input-buffer-enable"
>> > we end up with
>> > "output-high"
>> > "output-low"
>> > "input-enable"
>> > "output-buffer-enable"
>> > "input-buffer-enable"
>> >
>> > 2) Add "output-buffer-enable" only
>> > we end up with
>> > "output-high"
>> > "output-low"
>> > "input-enable"
>> > "output-buffer-enable"
>> >
>> > Binding may be confusing as in one case we use "output-buffer-enable"
>> > while in the other "input-enable"
>> >
>> > 3) Add "output-enable" only
>> > "output-high"
>> > "output-low"
>> > "input-enable"
>> > "output-enable"
>> >
>> > As you, I don't like "output-enable" that much but it pairs better with
>> > "input-enable".
>> >
>> > I'll let you and DT people decide on this, as it's really an ABI definition
>> > problem and you have better judgment there.
>> >
>>
>> What's the final decision of this?
>
> I admit a was buying a bit of time and post-poned the gentle ping for
> any final word on this. But since you're asking I'll second your
> question :)

I suspect it is time to quote
Documentation/process/management-style.rst
(Torvalds):

1) Decisions

Everybody thinks managers make decisions, and that decision-making is
important.  The bigger and more painful the decision, the bigger the
manager must be to make it.  That's very deep and obvious, but it's not
actually true.

The name of the game is to **avoid** having to make a decision.  In
particular, if somebody tells you "choose (a) or (b), we really need you
to decide on this", you're in trouble as a manager.  The people you
manage had better know the details better than you, so if they come to
you for a technical decision, you're screwed.  You're clearly not
competent to make that decision for them.

(It goes on, it's the best part of the entire Documentation/* dir in my
opinion, please take the time to read it in full.)

So: what do you guys, using this feature, and Andy, who raised serious
concerns, think is the right binding? That is what *I* need to know.

Yours,
Linus Walleij
