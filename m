From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] arm64: dts: mt2712: add pintcrl device node.
Date: Thu, 21 Sep 2017 14:17:21 +0200
Message-ID: <CACRpkdaX0n7BZVkXYFEh_XSN3P7huvhE6j5My=p=2Lh45oFZaQ@mail.gmail.com>
References: <1501489333-23145-1-git-send-email-zhiyong.tao@mediatek.com>
 <1501489333-23145-3-git-send-email-zhiyong.tao@mediatek.com>
 <2f883a8a-5402-5625-bada-bcfed53c098e@gmail.com> <CACRpkdZHyXec+L8ueRHOs=9TLT1Arqe3KeQpRZ6D0K1Ag1c+Zw@mail.gmail.com>
 <1505981592.22452.7.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1505981592.22452.7.camel@mhfsdcap03>
Sender: linux-gpio-owner@vger.kernel.org
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, srv_heupstream@mediatek.com, Liguo Zhang <liguo.zhang@mediatek.com>, "Joe.C" <yingjoe.chen@mediatek.com>, hongkun.cao@mediatek.com, Biao Huang <biao.huang@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Erin Lo <erin.lo@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 21, 2017 at 10:13 AM, Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
> On Tue, 2017-08-22 at 15:04 +0200, Linus Walleij wrote:
>> On Mon, Aug 14, 2017 at 5:23 PM, Matthias Brugger
>> <matthias.bgg@gmail.com> wrote:
>> > On 07/31/2017 10:22 AM, Zhiyong Tao wrote:
>> >>
>> >> The commit includes two change:
>> >> 1)add pintcrl device node for mt2712.
>> >> 2)add pinfunc file for mt2712.
>> >>
>> >> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
>> >> ---
>> >>   arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h | 1014
>> >> +++++++++++++++++++++++++
>> >
>> >
>> > Shouldn't this file be in include/dt-bindings/pinctrl?
>>
>> Only if it is also #included in the driver.
>>
>> Yours,
>> Linus Walleij
>
> ==>
> Thanks for your comment.
> We see our some ICs(mt7623) which move the file to
> "include/dt-bindings/pinctrl". other ICs(mt2701) which is put in
> "arch/arm64/boot/dts/mediatek".
> In mt2712, mt2712-pinfunc.h is only include by dts file. It won't be
> included by driver. So which is better? "arch/arm64/boot/dts/mediatek/"
> or "include/dt-bindings/pinctrl".

If it is used in both arm and arm64 it is helpful to have it in
include/dt-bindings so it can be shared between the two
archs.

If it is just (ever) for arm64 it can stay inside the arch tree.

Yours,
Linus Walleij
