From: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2.2 2/2] dt-bindings: Adding compatible attribute for
 SKY81452 regulator
Date: Fri, 5 Sep 2014 10:55:07 +0900
Message-ID: <20140905015507.GA2636@jack-ThinkPad-T520>
References: <20140813190423.GI17528@sirena.org.uk>
 <1409539218-5571-1-git-send-email-jack.yoo@skyworksinc.com>
 <1409539218-5571-3-git-send-email-jack.yoo@skyworksinc.com>
 <20140901103158.GO29327@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140901103158.GO29327-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 01, 2014 at 11:31:58AM +0100, Mark Brown wrote:
> On Mon, Sep 01, 2014 at 11:40:18AM +0900, Gyungoh Yoo wrote:
> > Adding compatible attribute for SKY81452 regulator driver.
> 
> >  Required properties:
> > +- compatible	: Must be "skyworks,sky81452-regulator"
> 
> Why is this a good idea - can this driver be used for anything other
> than a sky81452?

Thank you for the answer.

Yes. There is a possibility that this driver will be used by similar device with SKY81452.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
