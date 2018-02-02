From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: use 'atmel' as at24 manufacturer for sama5d34ek
Date: Fri, 2 Feb 2018 23:51:53 +0100
Message-ID: <20180202225153.GK3404@piout.net>
References: <20180124212346.3823-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180124212346.3823-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Nicolas Ferre <nicolas.ferre@microchip.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 24/01/2018 at 22:23:46 +0100, Bartosz Golaszewski wrote:
> Using compatible strings without the <manufacturer> part for at24 is
> now deprecated. Use a correct 'atmel,<model>' value.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  arch/arm/boot/dts/sama5d34ek.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

I forgot to reply but I applied all of them for 4.17, thanks.

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
