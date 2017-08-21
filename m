From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v9 RESEND 3/9] regulator: rk808: Add regulator driver for
 RK805
Date: Mon, 21 Aug 2017 09:15:30 +0100
Message-ID: <20170821081530.wa4hpm3455e7aqsf@dell>
References: <20170821012842.17875-1-heiko@sntech.de>
 <20170821012842.17875-4-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170821012842.17875-4-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: chenjh@rock-chips.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Elaine Zhang <zhangqing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

On Mon, 21 Aug 2017, Heiko Stuebner wrote:

> From: Elaine Zhang <zhangqing@rock-chips.com>
> 
> Add support for the rk805 regulator. The regulator module consists
> of 4 DCDCs, 3 LDOs.
> 
> The output voltages are configurable and are meant to supply power
> to the main processor and other components.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Signed-off-by: Joseph Chen <chenjh@rock-chips.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/regulator/Kconfig           |   4 +-
>  drivers/regulator/rk808-regulator.c | 130 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 132 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
