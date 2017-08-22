From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] arm64: dts: mt2712: add pintcrl device node.
Date: Tue, 22 Aug 2017 15:04:31 +0200
Message-ID: <CACRpkdZHyXec+L8ueRHOs=9TLT1Arqe3KeQpRZ6D0K1Ag1c+Zw@mail.gmail.com>
References: <1501489333-23145-1-git-send-email-zhiyong.tao@mediatek.com>
 <1501489333-23145-3-git-send-email-zhiyong.tao@mediatek.com> <2f883a8a-5402-5625-bada-bcfed53c098e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2f883a8a-5402-5625-bada-bcfed53c098e@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, srv_heupstream@mediatek.com, Liguo Zhang <liguo.zhang@mediatek.com>, "Joe.C" <yingjoe.chen@mediatek.com>, hongkun.cao@mediatek.com, Biao Huang <biao.huang@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Erin Lo <erin.lo@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 14, 2017 at 5:23 PM, Matthias Brugger
<matthias.bgg@gmail.com> wrote:
> On 07/31/2017 10:22 AM, Zhiyong Tao wrote:
>>
>> The commit includes two change:
>> 1)add pintcrl device node for mt2712.
>> 2)add pinfunc file for mt2712.
>>
>> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h | 1014
>> +++++++++++++++++++++++++
>
>
> Shouldn't this file be in include/dt-bindings/pinctrl?

Only if it is also #included in the driver.

Yours,
Linus Walleij
