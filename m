From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and output-enable
Date: Fri, 28 Apr 2017 15:15:33 +0300
Message-ID: <CAHp75Vcp_eMWrjZRX-x3=Tt3JRXcL_wWG43MymF=oyLLP4EJwg@mail.gmail.com>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
 <1493281194-5200-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAHp75Vcy1OE+9htFx9k3kQhGARQPT1C0gg3SEKZd7ULu_vkUMA@mail.gmail.com>
 <CACRpkdayW0qPXDcc_JofkwtX5UHhDPxiY_8deZZ7+hPNJkjgeQ@mail.gmail.com> <SG2PR06MB1165E7E651BE96CD7B7738B08A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB1165E7E651BE96CD7B7738B08A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 28, 2017 at 3:07 PM, Chris Brandt <Chris.Brandt@renesas.com> wr=
ote:
> On Friday, April 28, 2017, Linus Walleij wrote:
>> > For me it looks like you are trying to alias open-drain + bias or
>> > alike. Don't actually see the benefit of it.
>>
>> Andy is bringing up a valid point. And I remember asking about this befo=
re.
>>
>> What does "bi-directional" really mean, electrically speaking?

> Take the SDHI data pins. You send AND receive data over those pins (and t=
hey are not open drain).

Can you point to schematics and electrical characteristics of such buffer?
(Yes, I can imagine one case where it's possible to have an
"automatic" switch based on which current is bigger output of your
side or remote's. But! I would like to see actual specifications to
prove this or otherwise.)

> The issue is that the PFC HW that enables the connections between the SDH=
I IP block and the I/O pad buffers can only enable one path/signal/directio=
n to the buffer enables (in or out). So for a pin that needs both direction=
s, the PFC enables output and the "bidirectional register" is used to enabl=
e the input buffer as well.

> In the RZ/A1 HW manual you can kind of see that in 54.18 Port Control Log=
ical Diagram (but that wasn't obvious to me at first).

Please, post a link to it or copy essential parts.
I'm quite skeptical  that cheap hardware can implement something more
costable than simplest open-source / open-drain + bias.

--=20
With Best Regards,
Andy Shevchenko
