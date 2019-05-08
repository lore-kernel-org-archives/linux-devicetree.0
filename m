From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/3] mfd: axp20x: add USB power supply mfd cell to AXP803
Date: Wed, 8 May 2019 11:25:08 +0100
Message-ID: <20190508102508.GH3995@dell>
References: <20190418161804.17723-1-wens@kernel.org>
 <20190418161804.17723-2-wens@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190418161804.17723-2-wens@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 19 Apr 2019, Chen-Yu Tsai wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> The AXP803 has a VBUS power input. Its functionality is the same as the
> one found in the AXP813. Now that the axp20x_usb_power driver supports
> this variant, we can add an mfd cell for it to use it.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/mfd/axp20x.c | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
