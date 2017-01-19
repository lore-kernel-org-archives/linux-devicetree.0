From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCHv4 3/5] pinctrl: mvebu: pinctrl driver for 98DX3236 SoC
Date: Thu, 19 Jan 2017 21:10:39 +0000
Message-ID: <c873040cba1a4d5aa15dbaf3c5cc44e0@svr-chch-ex1.atlnz.lc>
References: <20170113091222.7132-1-chris.packham@alliedtelesis.co.nz>
 <20170113091222.7132-4-chris.packham@alliedtelesis.co.nz>
 <20170119100244.GX27312@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kalyan Kinthada <Kalyan.Kinthada@alliedtelesis.co.nz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On 19/01/17 23:03, Russell King - ARM Linux wrote:=0A=
> On Fri, Jan 13, 2017 at 10:12:18PM +1300, Chris Packham wrote:=0A=
>> +static struct mvebu_mpp_ctrl mv98dx3236_mpp_controls[] =3D {=0A=
>> +	MPP_FUNC_CTRL(0, 32, NULL, armada_xp_mpp_ctrl),=0A=
>> +};=0A=
>=0A=
> As Linus has taken my mvebu pinctrl series, this will need to be=0A=
> changed to "mvebu_mmio_mpp_ctrl" rather than "armada_xp_mpp_ctrl"=0A=
> when it's merged.=0A=
>=0A=
=0A=
OK I was thinking about rebasing my series so maybe it's time.=0A=
=0A=
