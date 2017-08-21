From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v9 RESEND 1/9] mfd: rk808: fix up the chip id get failed
Date: Mon, 21 Aug 2017 09:14:54 +0100
Message-ID: <20170821081454.efadgk2c7lh3jk47@dell>
References: <20170821012842.17875-1-heiko@sntech.de>
 <20170821012842.17875-2-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170821012842.17875-2-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: chenjh@rock-chips.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Elaine Zhang <zhangqing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

On Mon, 21 Aug 2017, Heiko Stuebner wrote:

> From: Elaine Zhang <zhangqing@rock-chips.com>
> 
> the rk8xx chip id is:
> ((MSB << 8) | LSB) & 0xfff0
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Signed-off-by: Joseph Chen <chenjh@rock-chips.com>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/mfd/rk808.c       | 21 +++++++++++++++------
>  include/linux/mfd/rk808.h |  1 +
>  2 files changed, 16 insertions(+), 6 deletions(-)

Applied, thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
