From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v8 14/14] MAINTAINERS: add entry for Rockchip ISP1 driver
Date: Thu, 15 Aug 2019 16:56:43 +0300
Message-ID: <20190815135643.GV5011@pendragon.ideasonboard.com>
References: <20190730184256.30338-1-helen.koike@collabora.com>
 <20190730184256.30338-15-helen.koike@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190730184256.30338-15-helen.koike@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Helen Koike <helen.koike@collabora.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de, jacob2.chen@rock-chips.com, jeffy.chen@rock-chips.com, zyc@rock-chips.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, hans.verkuil@cisco.com, sakari.ailus@linux.intel.com, kernel@collabora.com, ezequiel@collabora.com, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, zhengsq@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Helen,

Thank you for the patch.

On Tue, Jul 30, 2019 at 03:42:56PM -0300, Helen Koike wrote:
> Add MAINTAINERS entry for the rockchip isp1 driver.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
> 
> Changes in v8: None
> Changes in v7: None
> 
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6426db5198f0..7f38abcb4114 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13743,6 +13743,14 @@ F:	drivers/hid/hid-roccat*
>  F:	include/linux/hid-roccat*
>  F:	Documentation/ABI/*/sysfs-driver-hid-roccat*
>  
> +ROCKCHIP ISP V1 DRIVER
> +M:	Helen Koike <helen.koike@collabora.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	drivers/media/platform/rockchip/isp1/
> +F:	Documentation/devicetree/bindings/media/rockchip-isp1.txt
> +F:	Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt

This is missing the include/ files and the custom format documentation.
Apart from that, I'm happy to see that you will maintain this driver :-)

> +
>  ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER
>  M:	Jacob chen <jacob2.chen@rock-chips.com>
>  L:	linux-media@vger.kernel.org

-- 
Regards,

Laurent Pinchart
