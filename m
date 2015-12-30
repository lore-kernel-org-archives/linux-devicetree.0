From: Yao Yuan <yao.yuan-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH v2 1/4] Documentation: fsl-quadspi: Add fsl,ls2080a-dspi
 compatible string
Date: Wed, 30 Dec 2015 03:17:50 +0000
Message-ID: <AM2PR04MB07228C97A751DA40EEDD231489FD0@AM2PR04MB0722.eurprd04.prod.outlook.com>
References: <1450954863-7540-1-git-send-email-yao.yuan@freescale.com>
 <20151229183501.GH12450@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151229183501.GH12450@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for your review.
So you mean that I should add the commit message for why I add this new compatible?

Best Regards,
Yuan Yao

On Wed, Dec 30, 2015 at 02:35AM, Rob Herring wrote:
> On Thu, Dec 24, 2015 at 07:01:00PM +0800, Yuan Yao wrote:
> > new compatible string: "fsl,ls2080a-qspi".
> >
> > Signed-off-by: Yuan Yao <yao.yuan-3arQi8VN3Tc@public.gmane.org>
> > ---
> > Changed in v2:
> > Update my email to <yao.yuan-3arQi8VN3Tc@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
> b/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
> > index fa77f87..2fe51d6 100644
> > --- a/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
> > +++ b/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
> > @@ -1,7 +1,8 @@
> >  ARM Freescale DSPI controller
> >
> >  Required properties:
> > -- compatible : "fsl,vf610-dspi", "fsl,ls1021a-v1.0-dspi", "fsl,ls2085a-dspi"
> > +- compatible : "fsl,vf610-dspi", "fsl,ls1021a-v1.0-dspi",
> > +		"fsl,ls2085a-dspi", "fsl,ls2080a-dspi"
> 
> You should explain what combinations of compatible strings are valid.
> 
> Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
