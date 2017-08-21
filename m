From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v9 RESEND 5/9] mfd: rk808: Add RK805 support
Date: Mon, 21 Aug 2017 09:16:03 +0100
Message-ID: <20170821081603.3uxtfjpdb2owyzbh@dell>
References: <20170821012842.17875-1-heiko@sntech.de>
 <20170821012842.17875-6-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170821012842.17875-6-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: chenjh@rock-chips.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Elaine Zhang <zhangqing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

On Mon, 21 Aug 2017, Heiko Stuebner wrote:

> From: Elaine Zhang <zhangqing@rock-chips.com>
> 
> The RK805 chip is a Power Management IC (PMIC) for multimedia and handheld
> devices. It contains the following components:
> 
>     - Regulators
>     - RTC
>     - Clocking
> 
> Both RK808 and RK805 chips are using a similar register map,
> so we can reuse the RTC and Clocking functionality.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Signed-off-by: Joseph Chen <chenjh@rock-chips.com>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/mfd/Kconfig |   4 +-
>  drivers/mfd/rk808.c | 108 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 110 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
