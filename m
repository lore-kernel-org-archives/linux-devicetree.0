From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] ARM: davinci_all_defconfig: enable dumb vga-dac drm
 bridge
Date: Tue, 3 Jan 2017 14:50:53 +0530
Message-ID: <213a0474-b548-88fb-062b-958a905d1ea7@ti.com>
References: <1480065182-7095-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1480065182-7095-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, linux-drm <dri-devel@lists.freedesktop.org>, linux-devicetree <devicetree@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On Friday 25 November 2016 02:43 PM, Bartosz Golaszewski wrote:
> This enables the dumb-vga-dac driver by default for davinci boards.
> 
> The driver is needed for tilcdc support on da850-lcdk board.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  arch/arm/configs/davinci_all_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
> index b5e978f..ab1bf18 100644
> --- a/arch/arm/configs/davinci_all_defconfig
> +++ b/arch/arm/configs/davinci_all_defconfig
> @@ -127,6 +127,8 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
>  CONFIG_REGULATOR_TPS6507X=y
>  CONFIG_DRM=m
>  CONFIG_DRM_TILCDC=m
> +CONFIG_DRM_BRIDGE=y

DRM_BRIDGE is a 'def_bool y'. So no need to explicitly enable it. And
actually it will get dropped with the next savedefconfig refresh anyway.

Applying this patch with this line dropped.

Thanks,
Sekhar
