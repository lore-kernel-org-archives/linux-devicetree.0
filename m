From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 1/3] drm/bridge: sii902x: fix missing reference to mclk
 clock
Date: Fri, 12 Jul 2019 12:31:04 +0200
Message-ID: <5d87caa7-faac-4461-4184-aff5b8af04b5@samsung.com>
References: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
        <CGME20190702154805epcas2p2f95d733d2f0df9d311ab5ed37f452d34@epcas2p2.samsung.com>
        <1562082426-14876-2-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1562082426-14876-2-git-send-email-olivier.moysan@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Olivier Moysan <olivier.moysan@st.com>, narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@siol.net, airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, benjamin.gaignard@st.com, alexandre.torgue@st.com, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, jsarha@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02.07.2019 17:47, Olivier Moysan wrote:
> Add devm_clk_get call to retrieve reference to master clock.
>
> Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")
>
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index dd7aa466b280..36acc256e67e 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -750,6 +750,7 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
>  		sii902x->audio.i2s_fifo_sequence[i] |= audio_fifo_id[i] |
>  			i2s_lane_id[lanes[i]] |	SII902X_TPI_I2S_FIFO_ENABLE;
>  
> +	sii902x->audio.mclk = devm_clk_get(dev, "mclk");
>  	if (IS_ERR(sii902x->audio.mclk)) {
>  		dev_err(dev, "%s: No clock (audio mclk) found: %ld\n",
>  			__func__, PTR_ERR(sii902x->audio.mclk));

Acked-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej
