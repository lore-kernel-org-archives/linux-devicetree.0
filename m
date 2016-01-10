From: Xing Zheng <zhengxing@rock-chips.com>
Subject: Re: [PATCH v2 0/5] fix some clock configuration for the RK3036 platform
Date: Sun, 10 Jan 2016 15:26:18 +0800
Message-ID: <5692079A.50007@rock-chips.com>
References: <1452169057-24467-1-git-send-email-zhengxing@rock-chips.com> <2423996.DXmZSXDRX7@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2423996.DXmZSXDRX7@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: keescook@google.com, leozwang@google.com, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?6YOR5YW0?= <xing.zheng@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 2016=E5=B9=B401=E6=9C=8810=E6=97=A5 04:10, Heiko Stuebner wrote:
> Hi Xing
>
> Am Donnerstag, 7. Januar 2016, 20:17:32 schrieb Xing Zheng:
>>    In the development work, we found that some of the previous
>> incorrect clock configuration on the RK3036 platform, we should
>> fix them.
> I've applied patches 1-4 as fixes for 4.5 [0] and will apply patch 5
> regularly once 4.5-rc1 is released and I have stable base again.
>
>
>> Xing Zheng (5):
>>    clk: rockchip: rk3036: fix the FLAGs for clock mux
>>    clk: rockchip: rk3036: fix uarts clock error
>>    clk: rockchip: rk3036: fix the div offset for emac clock
>>    clk: rockchip: rk3036: rename emac ext source clock
> please make sure to also update the binding document in such cases.
> I've done it myself for this one.
>
> [for people reading along: the rk3036 clock-driver + binding is new i=
n
> 4.5 so we should be ok to fix the naming before it is actually releas=
ed]
>
>
> Heiko
>
>
> [0] https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip=
=2Egit/log/?h=3Dv4.5-clk/fixes
>
OK, I have updated the rockchip,rk3036-cru.txt and sent a patch to the=20
upstream.

Thanks.
