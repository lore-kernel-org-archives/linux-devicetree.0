From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH RESEND v3 4/4] pinctrl: add drive for I2C related pins on
 MT8183
Date: Tue, 23 Apr 2019 16:10:03 +0200
Message-ID: <cee8dc3f-9081-84c1-5ed5-7518db143bf8@gmail.com>
References: <20190325124137.6117-1-zhiyong.tao@mediatek.com>
 <20190325124137.6117-5-zhiyong.tao@mediatek.com>
 <206361ee-b238-4017-83fe-702ea59ae9c5@gmail.com>
 <CACRpkdYV5cYUs21xCDMhMm=kUpFcOipE+3dZOEJYto2-w=8NtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYV5cYUs21xCDMhMm=kUpFcOipE+3dZOEJYto2-w=8NtQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sean Wang <sean.wang@kernel.org>, srv_heupstream@mediatek.com, hui.liu@mediatek.com, huang eddie <eddie.huang@mediatek.com>, chuanjia.liu@mediatek.com, Biao Huang <biao.huang@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Erin Lo <erin.lo@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 23/04/2019 12:59, Linus Walleij wrote:
> On Tue, Apr 16, 2019 at 10:08 AM Matthias Brugger
> <matthias.bgg@gmail.com> wrote:
>> On 25/03/2019 13:41, Zhiyong Tao wrote:
>>> This patch provides the advanced drive for I2C used pins on MT8183.
>>> The detail strength specification description of the I2C pin:
>>> When E1=0/E0=0, the strength is 0.125mA.
>>> When E1=0/E0=1, the strength is 0.25mA.
>>> When E1=1/E0=0, the strength is 0.5mA.
>>> When E1=1/E0=1, the strength is 1mA.
>>> For I2C pins, there are existing generic driving setup and the above
>>> specific driving setup. I2C pins can only support 2/4/6/8/10/12/14/16mA
>>> driving adjustment in generic driving setup. But in specific driving
>>> setup, they can support 0.125/0.25/0.5/1mA adjustment.
>>> If we enable specific driving setup for I2C pins,
>>> the existing generic driving setup will be disabled.
>>> For some special features, we need the I2C pins specific driving setup.
>>> The specific driving setup is controlled by E1E0EN.
>>> So we need add extra vendor driving preperty instead of the generic
>>> driving property. We can add "mediatek,drive-strength-adv = <XXX>;"
>>> to describe the specific driving setup property.
>>> "XXX" means the value of E1E0EN. So the valid arguments of
>>> "mediatek,drive-strength-adv" are from 0 to 7.
>>>
>>> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
>>> ---
>>>  drivers/pinctrl/mediatek/pinctrl-mt8183.c        | 50 ++++++++++++++++++++++++
>>>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 47 ++++++++++++++++++++++
>>>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 11 ++++++
>>>  drivers/pinctrl/mediatek/pinctrl-paris.c         | 12 ++++++
>>>  4 files changed, 120 insertions(+)
>>>
>>
>> Linus, did that fall through the cracks? Do you have any comments on this driver?
> 
> It's applied AFAICT. Maybe I forgot to push the branch, but its there.
> 
> Please confirm so I didn't miss anything!
> 

I can see now both of them 1/4 and 4/4.

Thanks!
Matthias
