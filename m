From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: Re: [PATCH v10 11/11] drm: bridge/dw_hdmi: add rockchip rk3288 support
Date: Fri, 14 Nov 2014 10:23:18 +0000
Message-ID: <5465D816.3020708@imgtec.com>
References: <1415934583-16290-1-git-send-email-andy.yan@rock-chips.com>
 <1415935884-17130-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1415935884-17130-1-git-send-email-andy.yan@rock-chips.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Andy Yan <andy.yan@rock-chips.com>, airlied@linux.ie, heiko@sntech.de, fabio.estevam@freescale.com, rmk+kernel@arm.linux.org.uk
Cc: Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, mark.yao@rock-chips.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Andy

On 14/11/14 03:31, Andy Yan wrote:
> Rockchip RK3288 hdmi is compatible with dw_hdmi
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v10:
> - add more display mode support mpll configuration for rk3288
> 
> Changes in v9:
> - move some phy configuration to platform driver
> 
> Changes in v8: None
> Changes in v7: None
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  drivers/gpu/drm/bridge/dw_hdmi.c            |  10 +
>  drivers/gpu/drm/bridge/dw_hdmi.h            |   3 +-
>  drivers/gpu/drm/rockchip/Kconfig            |  10 +
>  drivers/gpu/drm/rockchip/Makefile           |   2 +-
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 355 ++++++++++++++++++++++++++++
>  include/drm/bridge/dw_hdmi.h                |   1 +
>  6 files changed, 379 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> 
> diff --git a/drivers/gpu/drm/bridge/dw_hdmi.c b/drivers/gpu/drm/bridge/dw_hdmi.c
> index a2876fe..1dd1f0b 100644
> --- a/drivers/gpu/drm/bridge/dw_hdmi.c
> +++ b/drivers/gpu/drm/bridge/dw_hdmi.c
> @@ -715,6 +715,13 @@ static void dw_hdmi_phy_enable_tmds(struct dw_hdmi *hdmi, u8 enable)
>  			 HDMI_PHY_CONF0_ENTMDS_MASK);
>  }
>  
> +static void dw_hdmi_phy_enable_spare(struct dw_hdmi *hdmi, u8 enable)
> +{
> +	hdmi_mask_writeb(hdmi, enable, HDMI_PHY_CONF0,
> +			 HDMI_PHY_CONF0_SPARECTRL_OFFSET,
> +			 HDMI_PHY_CONF0_SPARECTRL_MASK);
> +}
> +

What does enable spare do? Can other future SoCs use it?

This looks like DW specific. And can be a separate commit that adds a feature to the dw hdmi driver.

Thanks
ZubairLK

>  static void dw_hdmi_phy_gen2_pddq(struct dw_hdmi *hdmi, u8 enable)
>  {
>  	hdmi_mask_writeb(hdmi, enable, HDMI_PHY_CONF0,
> @@ -846,6 +853,9 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi, unsigned char prep,
>  	dw_hdmi_phy_gen2_txpwron(hdmi, 1);
>  	dw_hdmi_phy_gen2_pddq(hdmi, 0);
>  
> +	if (hdmi->dev_type == RK3288_HDMI)
> +		dw_hdmi_phy_enable_spare(hdmi, 1);
> +
>  	/*Wait for PHY PLL lock */
>  	msec = 5;
>  	do {
> diff --git a/drivers/gpu/drm/bridge/dw_hdmi.h b/drivers/gpu/drm/bridge/dw_hdmi.h
> index b8412a9..30a6b28 100644
> --- a/drivers/gpu/drm/bridge/dw_hdmi.h
> +++ b/drivers/gpu/drm/bridge/dw_hdmi.h
> @@ -837,7 +837,8 @@ enum {
>  	HDMI_PHY_CONF0_PDZ_OFFSET = 7,
>  	HDMI_PHY_CONF0_ENTMDS_MASK = 0x40,
>  	HDMI_PHY_CONF0_ENTMDS_OFFSET = 6,
> -	HDMI_PHY_CONF0_SPARECTRL = 0x20,
> +	HDMI_PHY_CONF0_SPARECTRL_MASK = 0x20,
> +	HDMI_PHY_CONF0_SPARECTRL_OFFSET = 5,

Cheers,
ZubairLK
