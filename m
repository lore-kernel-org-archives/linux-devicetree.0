From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH 2/4] dt-bindings: clock: mvebu: Add compatible string for
 98dx1135 core clock
Date: Mon, 17 Jun 2019 21:00:41 +0000
Message-ID: <52f0fe4f276e4088ac7ad47bc761722e@svr-chch-ex1.atlnz.lc>
References: <20190617100432.13037-1-chris.packham@alliedtelesis.co.nz>
 <20190617100432.13037-3-chris.packham@alliedtelesis.co.nz>
 <20190617170931.GG17551@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>, "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew,=0A=
=0A=
On 18/06/19 5:09 AM, Andrew Lunn wrote:=0A=
> On Mon, Jun 17, 2019 at 10:04:30PM +1200, Chris Packham wrote:=0A=
>> Add compatible string for the core clock on the 98dx1135 switch with=0A=
>> integrated CPU.=0A=
> =0A=
> Hi Chris=0A=
> =0A=
> Should there be a list of provider IDs and clock names?=0A=
> =0A=
=0A=
That list would be the same as the Kirkwood/Dove. I thought about adding =
=0A=
it but decided not to to avoid unnecessary duplication. One compromise =0A=
would be to change "for 98dx1135 SoC core clocks" to "for Kirkwood =0A=
98dx1135 SoC" which would fit with the MV88f6180 line above and make it =0A=
clear that it falls into the kirkwood bucket.=0A=
