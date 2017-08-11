From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 3/9] regulator: mt6380: Add support for MT6380
Date: Fri, 11 Aug 2017 11:11:15 +0800
Message-ID: <1502421075.19230.23.camel@mtkswgap22>
References: <cover.1500368529.git.sean.wang@mediatek.com>
         <0cd2be9a7058bb51fbbc7cc96101cba44fc081f6.1500368529.git.sean.wang@mediatek.com>
         <20170718133136.xodadxf2crkcuhze@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170718133136.xodadxf2crkcuhze-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2017-07-18 at 14:31 +0100, Mark Brown wrote:
> On Tue, Jul 18, 2017 at 05:49:23PM +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> 
> > +	if (!info->modeset_mask) {
> > +		dev_err(&rdev->dev, "regulator %s doesn't support set_mode\n",
> > +			info->desc.name);
> > +		return -EINVAL;
> > +	}
> 
> This is mostly fine but the mode operations all have this code - if the
> regulator doesn't have modesetting facilities it just shouldn't have
> the ops so the core can handle things in a standard fashion.  It'd mean
> defining a separate set of operations for those regulators but that's
> fine.


Hi, Mark

it is really bad for those calls with certain regulator always returning
-EINVAL, that doesn't make sense.

we'll follow your suggestion and add them into the next version.

thanks for your help!

	Sean

> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
