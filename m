From: Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: [PATCH v4 01/11] drm/hisilicon: Add device tree binding for
 hi6220 display subsystem
Date: Mon, 15 Feb 2016 15:30:10 +0800
Message-ID: <CAGd==07aNFtr6yEgULxg+7WLbqq7GAAWng4GV=oohSnM5fP45A@mail.gmail.com>
References: <1454729098-79807-1-git-send-email-xinliang.liu@linaro.org>
	<1454729098-79807-2-git-send-email-xinliang.liu@linaro.org>
	<20160208201246.GA17459@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20160208201246.GA17459@rob-hp-laptop>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@linux.ie>, Jon Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Emil Velikov <emil.l.velikov@gmail.com>, linux-doc@vger.kernel.org, LAKML <linux-arm-kernel@lists.infradead.org>, Linuxarm <linuxarm@huawei.com>, Andy Green <andy.green@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>, Xu Wei <xuwei5@hisilicon.com>, Wang Fei <w.f@huawei.com>, Feng Chen <puck.chen@hisilicon.com>, Bintian Wang <bintian.wang@huawei.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Yiping Xu <xuyiping@hisilicon.com>, XinWei Kong <kong.kongxinwei@hisilicon.com>, zourongrong@hu
List-Id: devicetree@vger.kernel.org

On 9 February 2016 at 04:12, Rob Herring <robh@kernel.org> wrote:
> On Sat, Feb 06, 2016 at 11:24:48AM +0800, Xinliang Liu wrote:
>> Add ADE display controller binding doc.
>> Add DesignWare DSI Host Controller v1.20a binding doc.
>
> One comment, otherwise:
>
> Acked-by: Rob Herring <robh@kernel.org>
>
>> +Board specific:
>> +     &dsi {
>> +             status = "ok";
>> +
>> +             ports {
>> +                     /* 1 for output port */
>> +                     port@1 {
>> +                             #address-cells = <1>;
>> +                             #size-cells = <0>;
>> +                             reg = <1>;
>> +
>> +                             /* 0 for bridge, other value for panel */
>
> The endpoint address would not change based on bridge or panel. So you
> can drop the unit address here.

yes, I can drop the unit address, since it only support bridge in the
DSI code currently, right?

One question: How to distinguish panel and bridge endpoint?  I am
thinking to support panel now.

Thanks,
-xinliang

>
>> +                             dsi_out0: endpoint@0 {
>> +                                     reg = <0>;
>> +                                     remote-endpoint = <&adv7533_in>;
>> +                             };
>> +                     };
>> +             };
>> +     };
