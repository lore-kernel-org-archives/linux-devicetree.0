From: YT Shen <yt.shen@mediatek.com>
Subject: Re: [RFC v2 3/5] drm/mediatek: add *driver_data for different
 hardware settings
Date: Wed, 1 Jun 2016 17:10:26 +0800
Message-ID: <1464772226.10410.28.camel@mtksdaap41>
References: <1463756736-46573-1-git-send-email-yt.shen@mediatek.com>
	 <1463756736-46573-4-git-send-email-yt.shen@mediatek.com>
	 <1463996582.30093.5.camel@mtksdaap41> <20160530104553.GB8388@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160530104553.GB8388@ulmo.ba.sec>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: CK Hu <ck.hu@mediatek.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mao Huang <littlecvr@chromium.org>, srv_heupstream@mediatek.com, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Thierry,

On Mon, 2016-05-30 at 12:45 +0200, Thierry Reding wrote:
> On Mon, May 23, 2016 at 05:43:02PM +0800, CK Hu wrote:
> > Hi, YT:
> > 
> > One comment below.
> > 
> > On Fri, 2016-05-20 at 23:05 +0800, yt.shen@mediatek.com wrote:
> > > From: YT Shen <yt.shen@mediatek.com>
> > > 
> > > There are some hardware settings changed, between MT8173 & MT2701:
> > > DISP_OVL address offset changed, color format definition changed.
> > > DISP_RDMA fifo size changed.
> > > DISP_COLOR offset changed.
> > > 
> > > Signed-off-by: YT Shen <yt.shen@mediatek.com>
> > > ---
> > > +
> > > +static inline struct mtk_ddp_comp_driver_data *mtk_ovl_get_driver_data(
> > > +	struct platform_device *pdev)
> > > +{
> > > +	const struct of_device_id *of_id =
> > > +		of_match_device(mtk_disp_ovl_driver_dt_match, &pdev->dev);
> > > +
> > > +	return (struct mtk_ddp_comp_driver_data *)of_id->data;
> > > +}
> > > +
> > > +static inline struct mtk_ddp_comp_driver_data *mtk_rdma_get_driver_data(
> > > +	struct platform_device *pdev)
> > > +{
> > > +	const struct of_device_id *of_id =
> > > +		of_match_device(mtk_disp_rdma_driver_dt_match, &pdev->dev);
> > > +
> > > +	return (struct mtk_ddp_comp_driver_data *)of_id->data;
> > > +}
> > > +
> > > +static inline struct mtk_ddp_comp_driver_data *mtk_color_get_driver_data(
> > > +	struct device_node *node)
> > > +{
> > > +	const struct of_device_id *of_id =
> > > +		of_match_node(mtk_disp_color_driver_dt_match, node);
> > > +
> > > +	return (struct mtk_ddp_comp_driver_data *)of_id->data;
> > > +}
> > > + 
> > 
> > These three functions looks the same with different parameter:
> > mtk_disp_ovl_driver_dt_match, mtk_disp_rdma_driver_dt_match, and
> > mtk_disp_color_driver_dt_match. So merge them to prevent duplicated
> > code.
> 
> I think what you really want is of_device_get_match_data().
> 
> Thierry

Great, that function is really what we need, thanks.

yt.shen
