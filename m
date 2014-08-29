From: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/7] Adding Skyworks SKY81452 regulator driver
Date: Fri, 29 Aug 2014 11:21:55 +0900
Message-ID: <20140829022155.GA28641@jack-ThinkPad-T520>
References: <1409222307-23225-1-git-send-email-jack.yoo@skyworksinc.com>
 <1409222797-23343-1-git-send-email-jack.yoo@skyworksinc.com>
 <20140828110254.GN17528@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140828110254.GN17528-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 28, 2014 at 12:02:54PM +0100, Mark Brown wrote:
> On Thu, Aug 28, 2014 at 07:46:37PM +0900, Gyungoh Yoo wrote:
> > v2:
> > Added 'compatible' attribute in the driver
> > Added message for exception or errors.
> 
> This driver has already been applied, please send any changes as
> incremental patches against current code.  I would *not* expect to see
> a compatible being defined for a MFD function device though unless it's
> genuinely reusable.

I am really sorry about confusing. I will resumit this regulator driver as the incremental patches.

BTW,
as Lee Jones-MFD supporter mentioned,
MFD core provides infrastructure for child drivers using compatible.
https://lkml.org/lkml/2014/8/27/132

I want your opinion.

Thank you.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
