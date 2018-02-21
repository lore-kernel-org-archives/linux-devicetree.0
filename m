Return-Path: <SRS0=Zag9=FP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from office2.cesnet.cz ([195.113.144.244]:49938 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752866AbeBULzP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 21 Feb 2018 06:55:15 -0500
From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Subject: Re: [PATCH v4 3/3] pinctrl: mcp23s08: add open drain configuration =?iso-8859-1?Q?for_irq_output?=
Date: Wed, 21 Feb 2018 12:55:11 +0100
MIME-Version: 1.0
Message-ID: <5c7d50e3-0c42-42e2-b2fa-2c7f1a6c6e2a@cesnet.cz>
In-Reply-To: <6667369.B4Kk5zL0O4@ws-stein>
References: <1519032320-103817-1-git-send-email-preid@electromag.com.au>
 <5e9a306c-c2da-3c7b-8fe6-52588ba4c898@electromag.com.au>
 <ef0b68d3-3e3e-4957-8ab4-7d4613a9538c@cesnet.cz>
 <6667369.B4Kk5zL0O4@ws-stein>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Phil Reid <preid@electromag.com.au>, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, sre@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On st=C5=99eda 21. =C3=BAnora 2018 8:11:25 CET, Alexander Stein wrote:
> Well, that is the exact situation on the board I had to deal=20
> with. The MCP was=20
> attached to a transisitor inverting the signal. The output on MCP has to be=
=20
> push-pull as there was no pull-up oder -down. But the line connecting the=20=

> inverter to the CPU was an open-drain one and this line was=20
> actually a shared=20
> IRQ line. So of course the line bewteen MCP and inverter cannot=20
> be shared, but=20
> the IRQ used on CPU is actually shared. How can this be respresented in DT?=


What I propose is to have it like this:

=09gpio@1 {
=09=09compatible =3D "microchip,mcp23s17";
=09=09irq-active-high;
=09=09interrupt-parent =3D <&gpio0>;
=09=09interrupts =3D <123 IRQ_TYPE_LEVEL_LOW>;
=09=09// ...
=09};

In other words, the "interrupt-parent" and "interrupts" DT statements=20
specify how the upstream interrupt controller should be set up, while other=20=

properties define settings of the IRQ source.

But as Phil points out, such a change would break the DT ABI. This means=20
that we should preserve the semantics of any existing DT. We can do that by=20=

introducing another property. Here's a rough sketch:

#define MCP23S08_IRQ_OPEN_DRAIN 1
#define MCP23S08_IRQ_PUSH_PULL_ACTIVE_LOW 2
#define MCP23S08_IRQ_PUSH_PULL_ACTIVE_HIGH 3

=09irqflags =3D IRQF_SHARED | IRQF_ONESHOT;

=09if (new_irq_mode !=3D -1) {
=09=09/* irqflags are only set to IRQF_SHARED | IRQF_ONESHOT,
=09=09nothing else */
=09} else if (irq_active_high) {
=09=09/* an existing property */
=09=09irqflags |=3D IRQF_ACTIVE_HIGH;
=09} else {
=09=09irqflags |=3D IRQF_ACTIVE_LOW;
=09}

A "new-style" DT then should look like this for your scenario with an=20
electrical invertor:

=09gpio@1 {
=09=09compatible =3D "microchip,mcp23s17";
=09=09irq-mode =3D MCP23S08_IRQ_PUSH_PULL_ACTIVE_HIGH;
=09=09interrupt-parent =3D <&gpio0>;
=09=09interrupts =3D <123 IRQ_TYPE_LEVEL_LOW>;
=09=09// ...
=09};

A downside of this approach is that it's using a custom enum, not a=20
standard property like drive-open-drain. Pick your poison.

Cheers,
Jan
