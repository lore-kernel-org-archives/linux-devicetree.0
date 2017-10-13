From: jeffy <jeffy.chen@rock-chips.com>
Subject: Re: [RESEND PATCH 2/2] arm64: dts: rockchip: Enable edp disaplay
 on kevin
Date: Sat, 14 Oct 2017 02:12:41 +0800
Message-ID: <59E10219.3060009@rock-chips.com>
References: <20171013104138.3216-1-jeffy.chen@rock-chips.com> <20171013104138.3216-3-jeffy.chen@rock-chips.com> <3037285.0MAZvLKA4I@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3037285.0MAZvLKA4I@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@chromium.org>
Cc: linux-kernel@vger.kernel.org, briannorris@chromium.org, broonie@kernel.org, dianders@chromium.org, Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Caesar Wang <wxt@rock-chips.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: devicetree@vger.kernel.org

Hi heiko,

On 10/13/2017 09:25 PM, Heiko Stuebner wrote:
> does this actually work with mainline kernel sources?
>
> Sean Paul did look at making the edp work on Chromebooks recently,
> but it seemed there were still parts missing to make it actually display
> something.

yes, it works, but only for boot-splash(boot animation). we still need 
mali gru stuff to bring chrome browser up...i think caesar tried that 
before(but i don't think he would submit that)
>
>
> Heiko
