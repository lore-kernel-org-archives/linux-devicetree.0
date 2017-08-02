From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v1 0/4] media: rc: add support for IR receiver on MT7622
 SoC
Date: Wed, 2 Aug 2017 10:24:07 +0800
Message-ID: <1501640647.17690.25.camel@mtkswgap22>
References: <CGME20170630060312epcas4p351a77795e8469640d5177039f6b1955d@epcas4p3.samsung.com>
         <cover.1498794408.git.sean.wang@mediatek.com>
         <20170704101008.pgnjacbsk3twadzo@gangnam.samsung>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170704101008.pgnjacbsk3twadzo-8vUhnHFVuGn35fTxX1Dczw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, sean-hENCXIMQXOg@public.gmane.orgmchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org
Cc: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Hi, Mauro and Sean

Just a gentle ping on the whole patchset porting MediaTek CIR to another
platform.

	Sean


On Tue, 2017-07-04 at 19:10 +0900, Andi Shyti wrote:
> Hi Sean,
> 
> > This patchset introduces Consumer IR (CIR) support for MT7622 SoC
> > implements raw mode for more compatibility with different protocols
> > as previously SoC did. Before adding support to MT7622 SoC, extra
> > code refactor is done since there're major differences in register and
> > field definition from the previous SoC.
> > 
> > Sean Wang (4):
> >   dt-bindings: media: mtk-cir: Add support for MT7622 SoC
> >   media: rc: mtk-cir: add platform data to adapt into various hardware
> >   media: rc: mtk-cir: add support for MediaTek MT7622 SoC
> >   MAINTAINERS: add entry for MediaTek CIR driver
> 
> for the whole patchset:
> 
> Reviewed-by: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> Andi


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
