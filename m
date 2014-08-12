Return-Path: <ulf.hansson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VPHJKodvF6RHFwrQzew=RKpz68nUFgO3+2Y3hsM4jrGA@mail.gmail.com>
References: <1404963109-3906-1-git-send-email-addy.ke@rock-chips.com>
	<1406786498-3935-1-git-send-email-addy.ke@rock-chips.com>
	<CAD=FV=VPHJKodvF6RHFwrQzew=RKpz68nUFgO3+2Y3hsM4jrGA@mail.gmail.com>
Date: Tue, 12 Aug 2014 14:17:35 +0200
Message-ID: <CAPDyKFoCvRpGxeWgEtt4sa5+Ftji0BRaz=yiXg_0xuge_9ZN9Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: dw_mmc: add support for RK3288
From: Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset=UTF-8
To: Doug Anderson <dianders@chromium.org>, Addy Ke <addy.ke@rock-chips.com>
Cc: Chris Ball <chris@printf.net>, Jaehoon Chung <jh80.chung@samsung.com>, Seungwon Jeon <tgih.jun@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Dinh Nguyen <dinguyen@altera.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Olof Johansson <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "zhenfu.fang" <zhenfu.fang@rock-chips.com>, Eddie Cai <cf@rock-chips.com>, lintao <lintao@rock-chips.com>, chenfen <chenfen@rock-chips.com>, zyf <zyf@rock-chips.com>, Jianqun Xu <xjq@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>, Chris <zyw@rock-chips.com>, =?UTF-8?B?5aea5pm65oOF?= <yzq@rock-chips.com>, han jiang <hj@rock-chips.com>, Kever Yang <kever.yang@rock-chips.com>, zhangqing <zhangqing@rock-chips.com>, Lin Huang <hl@rock-chips.com>
List-ID: <devicetree@vger.kernel.org>

On 31 July 2014 17:40, Doug Anderson <dianders@chromium.org> wrote:
> Addy,
>
> On Wed, Jul 30, 2014 at 11:01 PM, Addy Ke <addy.ke@rock-chips.com> wrote:
>> This patch focuses on clock setting for RK3288 mmc controller.
>>
>> In RK3288 mmc controller, CLKDIV register can only be set 0 or 1,
>> and if DDR 8bit mode, CLKDIV register must be set 1.
>>
>> Reported-by Doug Anderson <dianders@chromium.org>
>> Suggested-by: Jaehoon Chung <jh80.chung@samsung.com>
>> Suggested-by: Doug Anderson <dianders@chromium.org>
>
> You don't need "Suggested-by" and "Reported-by" for people who
> reviewed your patch.  Suggested-by is usually when someone suggested
> an overall feature and Reported-by is usually when someone reported a
> bug in code that already landed.
>
> You could add me as a Signed-off-by, though, since you folded in some
> code that I wrote.
>
> I think whoever applies this could fixup the tags, so:
>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Tested-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
>

Thanks! Queued for 3.18, with corrected tags.

Kind regards
Uffe

>
> It would be great to see this applied unless there are other objections.  :)
>
> -Doug
