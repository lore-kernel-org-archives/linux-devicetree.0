From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v6 1/4] rtc: ds1307: fix data pointer to m41t0
Date: Mon, 16 Jul 2018 23:36:46 +0200
Message-ID: <20180716213646.GB2751@piout.net>
References: <20180516210842.5874-1-giulio.benetti@micronovasrl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180516210842.5874-1-giulio.benetti@micronovasrl.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Giulio Benetti <giulio.benetti@micronovasrl.com>
Cc: a.zummo@towertech.it, robh+dt@kernel.org, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com
List-Id: devicetree@vger.kernel.org

On 16/05/2018 23:08:39+0200, Giulio Benetti wrote:
> data field points to m41t00, instead it should point to m41t0.
> Driver works correctly because on both cases(m41t0 and m41t00) chip_desc
> are equal.
> 
> Point to right enum m41t0 instead of m41t00.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  drivers/rtc/rtc-ds1307.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
