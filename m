Return-Path: <SRS0=WaQ4=FP=systec-electronic.com=alexander.stein@kernel.org>
From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH v4 3/3] pinctrl: mcp23s08: add open drain configuration for irq output
Date: Wed, 21 Feb 2018 08:11:25 +0100
Message-ID: <6667369.B4Kk5zL0O4@ws-stein>
In-Reply-To: <ef0b68d3-3e3e-4957-8ab4-7d4613a9538c@cesnet.cz>
References: <1519032320-103817-1-git-send-email-preid@electromag.com.au> <5e9a306c-c2da-3c7b-8fe6-52588ba4c898@electromag.com.au> <ef0b68d3-3e3e-4957-8ab4-7d4613a9538c@cesnet.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
To: Jan =?ISO-8859-1?Q?Kundr=E1t?= <jan.kundrat@cesnet.cz>
Cc: Phil Reid <preid@electromag.com.au>, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, sre@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tuesday, February 20, 2018, 6:15:46 PM CET Jan Kundr=E1t wrote:
> I was told that the appropriate way forward are device drivers which do n=
ot
> specify the IRQ polarity. Apparently, people are supposed to do that in
> their DT.
>=20
> So, in this context:
>=20
> - pinctrl-mcp23s08.c should only specify IRQF_ONESHOT | IRQF_SHARED
> - the DT should use an appropriate IRQ_TYPE_LEVEL_LOW or
> IRQ_TYPE_LEVEL_HIGH based on what the CPU expects to see on its IRQ pins
> - the DT must also set a property to configure the MCP23xxx device to
> *generate* an IRQ by the active-high flag, or another flag for an
> open-drain active-low IRQ output suitable for connecting directly to an
> interrupt line which gets shared by several open-drain IRQ producers
> - whoever supplies the DT must now check that their settings "make sense"
>=20
> Yes, this means that people might have to update their DTs. To me, that
> makes sense. If you ask me, the DT is already sort-of broken because it's
> using IRQF_SHARED with a push-pull IRQ output. Yes, one can fix that with
> extra transistors, but that sounds quite ugly, doesn't it.=20

Well, that is the exact situation on the board I had to deal with. The MCP =
was=20
attached to a transisitor inverting the signal. The output on MCP has to be=
=20
push-pull as there was no pull-up oder -down. But the line connecting the=20
inverter to the CPU was an open-drain one and this line was actually a shar=
ed=20
IRQ line. So of course the line bewteen MCP and inverter cannot be shared, =
but=20
the IRQ used on CPU is actually shared. How can this be respresented in DT?

Best reagrds,
Alexander
