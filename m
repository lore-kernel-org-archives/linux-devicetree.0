From: Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH v2 0/3] Add support rockchip RGB output interface
Date: Sat, 30 Sep 2017 16:25:06 +0800
Message-ID: <b66bc75d-b217-a54f-272a-b5ee7d0b57d3@rock-chips.com>
References: <1506049221-117283-1-git-send-email-hjc@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1506049221-117283-1-git-send-email-hjc@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Yao <mark.yao@rock-chips.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Do you  have any suggests for this series of patches?
Or apply to drm-misc-next?

ÔÚ 2017/9/22 11:00, Sandy Huang Ð´µÀ:
> This patches add support rockchip RGB output, Some Rockchip CRTCs, like rv1108,
> can directly output parallel and serial RGB data to panel or to conversion chip.
> So we add this driver to probe encoder and connector to support this case.
> 
> Sandy Huang (3):
>    dt-bindings: Add document for rockchip RGB output interface
>    drm/rockchip: Add support for Rockchip Soc RGB output interface
>    drm/rockchip: vop: Add more RGB output interface type
> 
>   .../bindings/display/rockchip/rockchip-rgb.txt     |  78 +++++
>   drivers/gpu/drm/rockchip/Kconfig                   |   9 +
>   drivers/gpu/drm/rockchip/Makefile                  |   1 +
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   2 +
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |   1 +
>   drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |   2 +
>   drivers/gpu/drm/rockchip/rockchip_rgb.c            | 343 +++++++++++++++++++++
>   7 files changed, 436 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-rgb.txt
>   create mode 100644 drivers/gpu/drm/rockchip/rockchip_rgb.c
> 
