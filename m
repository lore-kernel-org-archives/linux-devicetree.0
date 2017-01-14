From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCHv4 3/5] pinctrl: mvebu: pinctrl driver for 98DX3236 SoC
Date: Sat, 14 Jan 2017 07:50:13 +0000
Message-ID: <9996b6a215f944e1a47fa6239d8de21f@svr-chch-ex1.atlnz.lc>
References: <20170113091222.7132-1-chris.packham@alliedtelesis.co.nz>
 <20170113091222.7132-4-chris.packham@alliedtelesis.co.nz>
 <2fca7ac2-9a88-19b1-28c5-5192b9c4a2bc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Kalyan Kinthada <Kalyan.Kinthada@alliedtelesis.co.nz>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 13/01/17 22:54, Sebastian Hesselbarth wrote:=0A=
> On 13.01.2017 10:12, Chris Packham wrote:=0A=
>> From: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>=0A=
>>=0A=
>> This pinctrl driver supports the 98DX3236, 98DX3336 and 98DX4251 SoCs=0A=
>> from Marvell.=0A=
>>=0A=
>> Signed-off-by: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>> Acked-by: Rob Herring <robh@kernel.org>=0A=
>> Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>=0A=
>> ---=0A=
>>=0A=
>> Notes:=0A=
>>     Changes in v2:=0A=
>>     - include sdio support for the 98DX4251=0A=
>>     Changes in v3:=0A=
>>     - None=0A=
>>     Changes in v4:=0A=
>>     - Correct some discrepencies between binding and driver.=0A=
>=0A=
> Well, unfortunately I still see differences between the "gpio" in=0A=
> the binding and "gpo" in the driver.=0A=
>=0A=
> Please go back to that list I sent you yesterday and fix them all.=0A=
>=0A=
=0A=
I think you may have missed my initial reply [1]. Or I have missed your =0A=
response to it. Long story short "gpo" is intentional because some of =0A=
those pins can't be used as inputs. But if you still want me to change =0A=
it I will.=0A=
=0A=
[1] - https://lkml.org/lkml/2017/1/12/117=0A=
=0A=
