From: John Crispin <blogic@openwrt.org>
Subject: Re: [PATCH V2 1/2] pinctrl: mediatek: Modify pinctrl bindings for
 mt7623
Date: Fri, 19 Feb 2016 10:23:47 +0100
Message-ID: <56C6DF23.3060202@openwrt.org>
References: <1455866238-6102-1-git-send-email-blogic@openwrt.org>
 <CACRpkdYiQop2qDNuh4N2YZy2DTy9mOEyERro8hT4YogCPc2LGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYiQop2qDNuh4N2YZy2DTy9mOEyERro8hT4YogCPc2LGw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Biao Huang <biao.huang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 19/02/2016 10:03, Linus Walleij wrote:
> On Fri, Feb 19, 2016 at 8:17 AM, John Crispin <blogic@openwrt.org> wrote:
> 
>> Signed-off-by: John Crispin <blogic@openwrt.org>
>> Cc: devicetree@vger.kernel.org
>> ---
>> please apply to the devel-mt2701 branch
>>
>> Changes in V2
>> * make mt7623-pinfunc.h part of patch 1/2
>> * make sure the list stays sorted
> 
> Patch applied unless the Mediatek maintainers come with serious
> remarks (I can always revert).
> 
> Only minor comments from Yingjoe on the previous version so I guess
> it is finished.
> 
> MTK guys: do you even have this SoC? It appears MTK is churning out
> a plethora of SoCs and then they land in the lap of the OpenWRT
> developers before the MTK maintainers even start to look at it...
> 
> Yours,
> Linus Walleij
> 

I am doing this work in close collaboration with MTK. It is contractual
work. MTK is huge and has many BUs, one of them is WCN, formerly known
as Ralink. I have supported their MIPS silicon for many years now so
asking me to also take care of the Wireless SoCs based on ARM was the
natural next step.

	John
