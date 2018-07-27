From: djw@t-chip.com.cn
Subject: Re: [PATCH v1] arm64: dts: rockchip: add support for ROC-RK3399-PC board
Date: Fri, 27 Jul 2018 15:10:32 +0800
Message-ID: <871sbpm9w7.fsf@archiso.i-did-not-set--mail-host-address--so-tickle-me>
References: <1532589205-10153-1-git-send-email-djw@t-chip.com.cn>
        <cd4706970b40b49373ad169e3f9651f29508194a.camel@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cd4706970b40b49373ad169e3f9651f29508194a.camel@collabora.com>
        (Ezequiel Garcia's message of "Thu, 26 Jul 2018 10:41:58 -0300")
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel@collabora.com>
Cc: djw@t-chip.com.cn, linux-rockchip@lists.infradead.org, Wayne Chou <zxf@t-chip.com.cn>, Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, Catalin Marinas <catalin.marinas@arm.com>, Pierre-Hugues Husson <phh@phh.me>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Jacob Chen <jacob-chen@iotwrt.com>, Brian Norris <briannorris@chromium.org>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org, Jianqun Xu <jay.xu@rock-chips.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, linux-kernel@vger.kernel.org, Heinrich
List-Id: devicetree@vger.kernel.org

Ezequiel Garcia <ezequiel@collabora.com> writes:

> On Thu, 2018-07-26 at 15:13 +0800, djw@t-chip.com.cn wrote:
>> From: Levin Du <djw@t-chip.com.cn>
>> 
>> ROC-RK3399-PC is a power efficient 4GB LPDDR4 single board
>> computer with USB 3.0 and Gigabit Ethernet in a form factor
>> compatible with the Raspberry Pi. It is based on the Rockchip
>> RK3399 SoC, powered by the Type-C port.
>> 
>> The devicetree currently supports peripherals of:
>> 
>> - Ethernet
>> - HDMI
>> - SD Card
>> - UART2 debug
>> - TYPE-C
>
> Hi Levin,
>
> Last time I tried to make the mainline fusb driver work, it really didn't.
> Is USB 3.0 Type-C actually working with mainline on this board?
>
> Thanks!
> Eze

That's what I added in the end:

  USB3 in type-c port currently only works with normal orientation,
  not flip one.

Adding 'extcon=<&fusb0>' to make the dwc3 core failed to initialize.

Regards,
Levin
