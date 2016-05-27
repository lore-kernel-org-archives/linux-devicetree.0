From: YT Shen <yt.shen@mediatek.com>
Subject: Re: [RFC v2 3/5] drm/mediatek: add *driver_data for different
 hardware settings
Date: Fri, 27 May 2016 15:31:53 +0800
Message-ID: <1464334313.31149.16.camel@mtksdaap41>
References: <1463756736-46573-1-git-send-email-yt.shen@mediatek.com>
	 <1463756736-46573-4-git-send-email-yt.shen@mediatek.com>
	 <1463996582.30093.5.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463996582.30093.5.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Mao Huang <littlecvr@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, yingjoe.chen@mediatek.com, emil.l.velikov@gmail.com
List-Id: devicetree@vger.kernel.org

Hi CK,


On Mon, 2016-05-23 at 17:43 +0800, CK Hu wrote:
> Hi, YT:
> 
> One comment below.
> 
> On Fri, 2016-05-20 at 23:05 +0800, yt.shen@mediatek.com wrote:
> > From: YT Shen <yt.shen@mediatek.com>
> > 
> > There are some hardware settings changed, between MT8173 & MT2701:
> > DISP_OVL address offset changed, color format definition changed.
> > DISP_RDMA fifo size changed.
> > DISP_COLOR offset changed.
> > 
> > Signed-off-by: YT Shen <yt.shen@mediatek.com>
> > ---
> > +
> > +static inline struct mtk_ddp_comp_driver_data *mtk_ovl_get_driver_data(
> > +	struct platform_device *pdev)
> > +{
> > +	const struct of_device_id *of_id =
> > +		of_match_device(mtk_disp_ovl_driver_dt_match, &pdev->dev);
> > +
> > +	return (struct mtk_ddp_comp_driver_data *)of_id->data;
> > +}
> > +
> > +static inline struct mtk_ddp_comp_driver_data *mtk_rdma_get_driver_data(
> > +	struct platform_device *pdev)
> > +{
> > +	const struct of_device_id *of_id =
> > +		of_match_device(mtk_disp_rdma_driver_dt_match, &pdev->dev);
> > +
> > +	return (struct mtk_ddp_comp_driver_data *)of_id->data;
> > +}
> > +
> > +static inline struct mtk_ddp_comp_driver_data *mtk_color_get_driver_data(
> > +	struct device_node *node)
> > +{
> > +	const struct of_device_id *of_id =
> > +		of_match_node(mtk_disp_color_driver_dt_match, node);
> > +
> > +	return (struct mtk_ddp_comp_driver_data *)of_id->data;
> > +}
> > + 
> 
> These three functions looks the same with different parameter:
> mtk_disp_ovl_driver_dt_match, mtk_disp_rdma_driver_dt_match, and
> mtk_disp_color_driver_dt_match. So merge them to prevent duplicated
> code.
OK, I'll do this in the next version.
> 
> Regards,
> CK
> 
> 
