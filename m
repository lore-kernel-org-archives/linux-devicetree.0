From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drm/rockchip: dw_hdmi: add basic rk3228 support
Date: Fri, 14 Jun 2019 10:47:02 -0600
Message-ID: <20190614164702.GA20322@bogus>
References: <20190522224631.25164-1-justin.swartz@risingedge.co.za>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190522224631.25164-1-justin.swartz@risingedge.co.za>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Justin Swartz <justin.swartz@risingedge.co.za>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 22 May 2019 22:46:29 +0000, Justin Swartz wrote:
> Like the RK3328, RK322x SoCs offer a Synopsis DesignWare HDMI transmitter
> and an Innosilicon HDMI PHY.
> 
> Add a new dw_hdmi_plat_data struct, rk3228_hdmi_drv_data.
> Assign a set of mostly generic rk3228_hdmi_phy_ops functions.
> Add dw_hdmi_rk3228_setup_hpd() to enable the HDMI HPD and DDC lines.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> ---
>  .../bindings/display/rockchip/dw_hdmi-rockchip.txt |  1 +
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 53 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
