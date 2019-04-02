From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 1/6] mfd: rk808: remove the id_table
Date: Tue, 2 Apr 2019 07:30:11 +0100
Message-ID: <20190402063011.GY4187@dell>
References: <20190102102002.29245-1-tony.xie@rock-chips.com>
 <20190102102002.29245-2-tony.xie@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190102102002.29245-2-tony.xie@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Xie <tony.xie@rock-chips.com>
Cc: heiko@sntech.de, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, chenjh@rock-chips.com, xsf@rock-chips.com, zhangqing@rock-chips.com, huangtao@rock-chips.com
List-Id: devicetree@vger.kernel.org

On Wed, 02 Jan 2019, Tony Xie wrote:

> Remove the id_table because it's not used.
> 
> Signed-off-by: Tony Xie <tony.xie@rock-chips.com>
> ---
>  drivers/mfd/rk808.c | 9 ---------
>  1 file changed, 9 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
