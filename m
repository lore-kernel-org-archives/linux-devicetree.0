From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/5] dmaengine: qcom: bam_dma: make bam clk optional
Date: Wed, 14 Feb 2018 10:47:05 -0800
Message-ID: <20180214184705.GC93895@bjorns-mbp-2.lan>
References: <20180214144459.29813-1-srinivas.kandagatla@linaro.org>
 <20180214144459.29813-2-srinivas.kandagatla@linaro.org>
 <20180214154144.GB93895@bjorns-mbp-2.lan>
 <69c7a7e4-1a1f-e0e6-d5e9-c39ff666df64@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <69c7a7e4-1a1f-e0e6-d5e9-c39ff666df64-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhe-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org, ramkri-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org, sdharia-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed 14 Feb 10:19 PST 2018, Srinivas Kandagatla wrote:

> Thanks for the Review,
> 
> On 14/02/18 15:41, Bjorn Andersson wrote:
> > >   	bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
> > > -	if (IS_ERR(bdev->bamclk))
> > > -		return PTR_ERR(bdev->bamclk);
> > > -
> > > -	ret = clk_prepare_enable(bdev->bamclk);
> > > -	if (ret) {
> > > -		dev_err(bdev->dev, "failed to prepare/enable clock\n");
> > > -		return ret;
> > > +	if (IS_ERR(bdev->bamclk)) {
> > In the case of !bdev->controlled_remotely I think this should still be
> > an error.
> > 
> Yep makes sense,
> 
> You mean something like this?
> 
> ------------------------->cut<------------------------
>         bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
>         if (IS_ERR(bdev->bamclk)) {
>                 if (!bdev->controlled_remotely);
>                         return PTR_ERR(bdev->bamclk);
> 
>                 bdev->bamclk = NULL;
>         }
> 
>         ret = clk_prepare_enable(bdev->bamclk);
>         if (ret) {
>                 dev_err(bdev->dev, "failed to prepare/enable clock\n");
>                 return ret;
>         }
> 
> ------------------------->cut<------------------------
> 

Yes

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
