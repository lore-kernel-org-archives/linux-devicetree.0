From: jeffy <jeffy.chen@rock-chips.com>
Subject: Re: [RESENT PATCH v7 3/7] arm64: dts: rockchip: Update rt5514 devices'
 compatible for Gru
Date: Thu, 31 Aug 2017 01:00:44 +0800
Message-ID: <59A6EF3C.5090308@rock-chips.com>
References: <20170824045227.15504-1-jeffy.chen@rock-chips.com> <20170824045227.15504-4-jeffy.chen@rock-chips.com> <1649093.IvC24TsujL@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1649093.IvC24TsujL@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, dgreid@chromium.org, briannorris@chromium.org, mka@chromium.org, dianders@chromium.org, devicetree@vger.kernel.org, Klaus Goger <klaus.goger@theobroma-systems.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Caesar Wang <wxt@rock-chips.com>, Catalin Marinas <catalin.marinas@arm.com>Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

thanks for your reply.

On 08/30/2017 09:30 PM, Heiko Stübner wrote:
>> >-		compatible = "realtek,rt5514";
>> >+		compatible = "realtek,rt5514", "realtek,rt5514-i2c";
> the rt5514-i2c and -spi compatibles should be documented in the binding-txt
> of the chip, but I haven't found any mention of this.
>
>
> Heiko

these compatibles are only used for our snd driver to detect rt5514 i2c 
driver and rt5514 spi driver, suggested by Matthias at 
https://patchwork.kernel.org/patch/9904731/

should i add it in the rockchip,rk3399-gru-sound.txt or rt5514 binding 
document?
