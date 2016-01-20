From: zhangqing <zhangqing@rock-chips.com>
Subject: Re: [PATCH v3 0/3] SoC: rockchip: support power domain for RK3368
Date: Wed, 20 Jan 2016 02:28:05 -0800
Message-ID: <569F6135.1070902@rock-chips.com>
References: <1452508600-3512-1-git-send-email-zhangqing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452508600-3512-1-git-send-email-zhangqing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, wxt@rock-chips.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, khilman@linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, huangtao@rock-chips.com, zyw@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 01/11/2016 02:36 AM, zhangqing wrote:
> add pd id in rk3368-power.h
> modify pm_domains.c to support RK3368 SoC
> add RK3368 document for Rockchip power domains
>
> zhangqing (3):
>    dt-bindings: add power-domain header for RK3368 SoCs
>    soc: rockchip: power-domain: Modify power domain driver for rk3368
>    dt-bindings: modify document of Rockchip power domains

Are there any other questions about the three patches.Please review.
>
>   .../bindings/soc/rockchip/power_domain.txt         | 21 ++++++++++++++
>   drivers/soc/rockchip/pm_domains.c                  | 33 ++++++++++++++++++++++
>   include/dt-bindings/power/rk3368-power.h           | 28 ++++++++++++++++++
>   3 files changed, 82 insertions(+)
>   create mode 100644 include/dt-bindings/power/rk3368-power.h
>
