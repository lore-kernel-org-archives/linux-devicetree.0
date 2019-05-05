Return-Path: <SRS0=s+4b=TF=gmail.com=jonas.gorski@kernel.org>
MIME-Version: 1.0
References: <20190502122657.15577-1-jonas.gorski@gmail.com>
 <20190502122657.15577-2-jonas.gorski@gmail.com> <11dc70cb-114b-fb40-1b5e-fd71b8ced1af@amsat.org>
In-Reply-To: <11dc70cb-114b-fb40-1b5e-fd71b8ced1af@amsat.org>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sun, 5 May 2019 20:57:57 +0200
Message-ID: <CAOiHx==tzUHU1nSf9c2+EtR0wJ=HDstRhHBCBQE5j79_uwJOLQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] devicetree: document the BCM63XX gated clock bindings
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-mips@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Philippe,

On Fri, 3 May 2019 at 16:36, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Hi Jonas,
>
> On 5/2/19 2:26 PM, Jonas Gorski wrote:
> > Add binding documentation for the gated clock controller found on MIPS
> > based BCM63XX SoCs.
>
> I'd have ordered this patch after the #2 of this series, or eventually
> squashed both together. It is weird to document an unexistant feature
> then implement it, while the opposite looks more natural.
> (If you agree, maybe Paul can invert those when applying this series).
>
> Anyway:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

You are documenting hardware, not a driver/feature. :-)

The binding is supposed to be a separate patch [1]. The natural order
is to first describe the hardware (with the binding documentation),
then add the actual driver making use of the binding. Checkpatch.pl
will also warn if you use a compatible that isn't documented, which
happens (shortly) if you first add the driver.


Regards
Jonas

[1] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree=
/bindings/submitting-patches.txt#L8
