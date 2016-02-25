From: Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH 3/4] clk: rockchip: add dt-binding header for rk3399
Date: Thu, 25 Feb 2016 08:42:57 +0800
Message-ID: <56CE4E11.7090808@rock-chips.com>
References: <1456210864-29037-1-git-send-email-jay.xu@rock-chips.com>
 <1456210864-29037-4-git-send-email-jay.xu@rock-chips.com>
 <4483822.0pRK7cKepF@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4483822.0pRK7cKepF@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, catalin.marinas@arm.com, will.deacon@arm.com, sboyd@codeaurora.org, linus.walleij@linaro.org, sjoerd.simons@collabora.co.uk, jwerner@chromium.org, huangtao@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dianders@chromium.org, davidriley@chromium.org, smbarber@chromium.org, Xing Zheng <zhengxing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Hi Heiko:

=D4=DA 24/02/2016 21:27, Heiko Stuebner =D0=B4=B5=C0:
> Hi Jianqun,
>
> Am Dienstag, 23. Februar 2016, 15:01:03 schrieb jianqun.xu:
>> From: Xing Zheng <zhengxing@rock-chips.com>
>>
>> Add the dt-bindings header for the rk3399, that gets shared between
>> the clock controller and the clock references in the dts.
>>
>> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
>> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
>
> looks ok so far, do you have an estimate when the revised clk driver =
will be
> sent? Before committing to support this binding header forever I'd li=
ke to
> take a look over the clock-tree itself, just to be sure ;-)
>
No problem, since the cru head file is needed by many drivers, so it=20
must be pushed as
soon as possible.

It's better to send the clk driver by Xing in a separate patch. I will=20
co-work with xing.

Thanks
>
> Thanks
> Heiko
>
>
>
