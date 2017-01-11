From: Xing Zheng <zhengxing@rock-chips.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: rockchip: add "rockchip, grf" property
 for RK3399 PMUCRU/CRU
Date: Wed, 11 Jan 2017 10:02:49 +0800
Message-ID: <58759249.4020808@rock-chips.com>
References: <1484028930-20305-1-git-send-email-zhengxing@rock-chips.com>
 <CAD=FV=Wwu3q_LqwYUWcJQRvp5neVOS9szgsYFONWTRJ0X8hRTA@mail.gmail.com>
 <58758498.40309@rock-chips.com> <1799437.apf7OqdtKq@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1799437.apf7OqdtKq@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Doug Anderson <dianders@google.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Caesar Wang <wxt@rock-chips.com>, Shawn Lin <shawn.lin@rock-chips.com>, Brian Norris <briannorris@chromium.org>, Jianqun Xu <jay.xu@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, David Wu <david.wu@rock-chips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 2017年01月11日 09:12, Heiko Stuebner wrote:
>> I just woud like to add this patch to avoid getting some unavailable
>> MUXGRF clock and need to debug it again,
>> if we support it one day in future.
> could you just check, if we have any other grf-based muxes that we may need in
> the future. Right now I only see pclkin_isp1_wrapper describing such a mux,
> but it would be cool if you could check again.
>
>
OK, we will check these.  :)

Thanks.

-- 
- Xing Zheng
