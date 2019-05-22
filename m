From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v3 1/3] thermal: rockchip: fix up the tsadc pinctrl
 setting error
Date: Wed, 22 May 2019 14:30:16 +0200
Message-ID: <f0581341-126a-5733-3c4b-8e6f67bfc32e@linaro.org>
References: <1556618986-18923-1-git-send-email-zhangqing@rock-chips.com>
 <785392a0-282a-1e51-a4d6-a6d5ca478949@linaro.org>
 <CAFqH_53nbiwzQKctNa7MBzgCcsRFn1p8g31Xgvo3E9k6eA8AKw@mail.gmail.com>
 <2174314.1vfUlvne1O@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2174314.1vfUlvne1O@phil>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Elaine Zhang <zhangqing@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, huangtao@rock-chips.com, Linux PM list <linux-pm@vger.kernel.org>, xxx@rock-chips.com, xf@rock-chips.com, linux-kernel <linux-kernel@vger.kernel.org>, Eduardo Valentin <edubezval@gmail.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Doug Anderson <dianders@chromium.org>, vicencb@gmail.com
List-Id: devicetree@vger.kernel.org

On 22/05/2019 14:27, Heiko Stuebner wrote:

[ ... ]

>> As this change is now in mainline and is causing veyron to hang I'd
>> suggest reverting this change for now. Even fixing the root cause
>> (maybe the one I pointed above) after this patch we will have the
>> thermal driver to fail because "gpio" and "otpout" states are not
>> defined nor documented (a change on this will need some reviews and
>> acks and time I guess).
> 
> I definitly agree here. Handling + checking the binding change
> as well as needed fallback code is definitly not material for -rc-kernels
> so we should just revert for now and let Elaine fix the issues for 5.3.
> 
> Anyone volunteering for sending a revert-patch to Eduardo? :-)

I can't right now :/


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
