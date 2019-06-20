From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 2/3] rtc: pcf8563: Clear event flags and disable
 interrupts before requesting irq
Date: Thu, 20 Jun 2019 20:37:42 +0200
Message-ID: <20190620183742.GD23549@piout.net>
References: <20190604042337.26129-1-wens@kernel.org>
 <20190604042337.26129-3-wens@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190604042337.26129-3-wens@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, Vincent Donnefort <vdonnefort@gmail.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
List-Id: devicetree@vger.kernel.org

On 04/06/2019 12:23:36+0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Besides the alarm, the PCF8563 also has a timer triggered interrupt.
> In cases where the previous system left the timer and interrupts on,
> or somehow the bits got enabled, the interrupt would keep triggering
> as the kernel doesn't know about it.
> 
> Clear both the alarm and timer event flags, and disable the interrupts,
> before requesting the interrupt line.
> 
> Fixes: ede3e9d47cca ("drivers/rtc/rtc-pcf8563.c: add alarm support")
> Fixes: a45d528aab8b ("rtc: pcf8563: clear expired alarm at boot time")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/rtc/rtc-pcf8563.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
