From: John Keeping <john@metanate.com>
Subject: Re: [PATCH v2 11/11] drm/rockchip/dsi: fix insufficient bandwidth
 of some panel
Date: Mon, 16 Jan 2017 12:44:53 +0000
Message-ID: <20170116124453.2154def9.john@metanate.com>
References: <1484561311-494-1-git-send-email-zyw@rock-chips.com>
 <1484561311-494-12-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484561311-494-12-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, heiko@sntech.de, pawel.moll@arm.com, linux-rockchip@lists.infradead.org, yzq@rock-chips.com, linux-kernel@vger.kernel.org, dianders@chromium.org, dri-devel@lists.freedesktop.org, tfiga@chromium.org, David Airlie <airlied@linux.ie>, robh+dt@kernel.org, seanpaul@chromium.org, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org, Mark Yao <mark.yao@rock-chips.com>
List-Id: devicetree@vger.kernel.org

On Mon, 16 Jan 2017 18:08:31 +0800, Chris Zhong wrote:

> Set the lanes bps to 1 / 0.9 times of pclk, the margin is not enough
> for some panel, it will cause the screen display is not normal, so
> increases the badnwidth to 1 / 0.8.
> 
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> 
> ---
> 
>  drivers/gpu/drm/rockchip/dw-mipi-dsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
> index 9dfa73d..5a973fe 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
> @@ -501,8 +501,8 @@ static int dw_mipi_dsi_get_lane_bps(struct dw_mipi_dsi *dsi)
>  
>  	mpclk = DIV_ROUND_UP(dsi->mode->clock, MSEC_PER_SEC);
>  	if (mpclk) {
> -		/* take 1 / 0.9, since mbps must big than bandwidth of RGB */
> -		tmp = mpclk * (bpp / dsi->lanes) * 10 / 9;
> +		/* take 1 / 0.8, since mbps must big than bandwidth of RGB */
> +		tmp = mpclk * (bpp / dsi->lanes) * 10 / 8;

This and patch 9 are just hacking around the underlying problem in order
to make particular panels work.  I'm pretty sure the actual issue is the
use of hardcoded values when configuring the PHY, since the PHY
parameters are specified in clock cycles but the MIPI spec requires
absolute time durations.

I posted a series addressing this a while ago, although I screwed up
sending it so some patches were included twice and since no one
expressed any interest I didn't post a cleaned up version.

The relevant patch is here:

https://patchwork.kernel.org/patch/9340193/

>  		if (tmp < max_mbps)
>  			target_mbps = tmp;
>  		else
