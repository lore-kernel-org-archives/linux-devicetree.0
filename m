From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v2 3/4] pinctrl: mvebu: Add support for MV98DX1135
Date: Tue, 25 Jun 2019 20:30:33 +0000
Message-ID: <f08d52a1c4864c6981f3631523965cf5@svr-chch-ex1.atlnz.lc>
References: <20190617215458.32688-1-chris.packham@alliedtelesis.co.nz>
 <20190617215458.32688-4-chris.packham@alliedtelesis.co.nz>
 <CACRpkdbSS18us3o=v7ki_=8cLXYjfDd8q321xMCounXPh11GAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 26/06/19 12:27 AM, Linus Walleij wrote:=0A=
> On Mon, Jun 17, 2019 at 11:55 PM Chris Packham=0A=
> <chris.packham@alliedtelesis.co.nz> wrote:=0A=
> =0A=
>> The 98DX1135 is a switch chip with an integrated CPU. This is similar to=
=0A=
>> the 98DX4122 except the MPP assignments differ.=0A=
>>=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>=0A=
> =0A=
> Patch applied.=0A=
> I just assume this one has no dependency on the clock patches=0A=
> so I can merge it separately.=0A=
=0A=
Correct. There's no dependency between the patches but they're all =0A=
needed to successfully boot a board.=0A=
