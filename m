From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCHv5 0/5] Support for Marvell switches with integrated CPUs
Date: Sun, 29 Jan 2017 20:30:34 +0000
Message-ID: <f8f6e8db585147d3adb025bed29694ab@svr-chch-ex1.atlnz.lc>
References: <20170127032546.14657-1-chris.packham@alliedtelesis.co.nz>
 <87wpdgwj72.fsf@free-electrons.com> <20170127184745.GD8801@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Brand <chris.brand@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>, Juri Lelli <juri.lelli@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>Laxman Dewangan <l>
List-Id: devicetree@vger.kernel.org

On 28/01/17 07:47, Stephen Boyd wrote:=0A=
> On 01/27, Gregory CLEMENT wrote:=0A=
>> Hi all,=0A=
>>=0A=
>>  On ven., janv. 27 2017, Chris Packham <chris.packham@alliedtelesis.co.n=
z> wrote:=0A=
>>=0A=
>>> The 98DX3236, 98DX3336 and 98DX4251 are a set of switch ASICs with=0A=
>>> integrated CPUs. They CPU block is common within these product lines an=
d=0A=
>>> (as far as I can tell/have been told) is based on the Armada XP. There=
=0A=
>>> are a few differences due to the fact they have to squeeze the CPU into=
=0A=
>>> the same package as the switch.=0A=
>>>=0A=
>>> I've rebased this series against linux-pinctrl/devel to get access to=
=0A=
>>> mvebu_mmio_mpp_ctrl. Everything else still applies cleanly to=0A=
>>> v4.10.0-rc5.=0A=
>>=0A=
>> Just to let you know that I plan to apply the 3 arm patch once Chris=0A=
>> will have sent the new series with the minor fixes I asked on patch 3.=
=0A=
>>=0A=
>> I already applied them in the for-next branch to benefit of some build=
=0A=
>> test coverage.=0A=
>>=0A=
>> Stephen,=0A=
>>=0A=
>> you gave your Acked-by on the first patch, but don't you plan to apply=
=0A=
>> it on the clk branch?=0A=
>=0A=
> It must have not been clear if I should apply it, hence the ack.=0A=
> I'll apply it now.=0A=
>=0A=
=0A=
Sorry my bad. I need all 5 together in one place to actually test the =0A=
series.=0A=
=0A=
I wasn't sure whether the series should go through mvebu with Acks from =0A=
clk and pinctrl or if things should go to the separate maintainers and =0A=
come together when they hit the main linux repo. Up until the latest =0A=
pinctrl change either approach would have worked.=0A=
