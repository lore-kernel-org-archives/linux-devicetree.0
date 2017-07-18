From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 9/9] soc: mediatek: pwrap: fixup warnings from coding
 style
Date: Tue, 18 Jul 2017 09:31:49 -0700
Message-ID: <1500395509.25934.23.camel@perches.com>
References: <cover.1500368529.git.sean.wang@mediatek.com>
         <568c3b518b70a0af17cbef1223721b68448a8ac6.1500368529.git.sean.wang@mediatek.com>
         <1500395194.17774.6.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500395194.17774.6.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2017-07-19 at 00:26 +0800, Yingjoe Chen wrote:
> [Resend due to bad mail format, sorry about the noise if you got two]
> 
> 
> On Tue, 2017-07-18 at 17:49 +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> > From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > 
> > fixup those warnings such as lines over 80 words and parenthesis
> > alignment which would be complained by checkpatch.pl.
> > 
> > Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/soc/mediatek/mtk-pmic-wrap.c | 20 +++++++++++++-------
> >  1 file changed, 13 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > index 142f40a..5f1036f 100644
> > --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> > +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > @@ -1057,7 +1057,8 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
> >  	/* wait for cipher data ready@PMIC */
> >  	ret = pwrap_wait_for_state(wrp, pwrap_is_pmic_cipher_ready);
> >  	if (ret) {
> > -		dev_err(wrp->dev, "timeout waiting for cipher data ready@PMIC\n");
> > +		dev_err(wrp->dev,
> > +			"timeout waiting for cipher data ready@PMIC\n");
> 
> Sean,
> 
> I think the old code is easier to read. When the line is only slightly
> over the 80 chars limit, some maintainers will even ask to keep it in
> one line to make it easier to read.
> 
> So if it is OK with Matthias, I think we should just keep it as is.

checkpatch doesn't complain about this line.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
