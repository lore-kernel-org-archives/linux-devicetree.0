From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/3] rtc: pcf8563: Fix interrupt trigger method
Date: Thu, 20 Jun 2019 20:36:04 +0200
Message-ID: <20190620183604.GC23549@piout.net>
References: <20190604042337.26129-1-wens@kernel.org>
 <20190604042337.26129-2-wens@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190604042337.26129-2-wens@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, Vincent Donnefort <vdonnefort@gmail.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
List-Id: devicetree@vger.kernel.org

On 04/06/2019 12:23:35+0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The PCF8563 datasheet says the interrupt line is active low and stays
> active until the events are cleared, i.e. a level trigger interrupt.
> 
> Fix the flags used to request the interrupt.
> 
> Fixes: ede3e9d47cca ("drivers/rtc/rtc-pcf8563.c: add alarm support")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
> 
> Not sure if this would cause issues for other platforms. Ideally we'd
> take the flags from the device tree, but it seems not all platforms
> support this.
> 
> ---
>  drivers/rtc/rtc-pcf8563.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
