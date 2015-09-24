From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH v4 2/5] soc: sunxi: Add driver for
 Allwinner Reduced Serial Bus
Date: Thu, 24 Sep 2015 16:23:09 +0800
Message-ID: <CAGb2v65Q1fMs5mxk8m64US+82oVkfmRyx3D2Yf_VhZwOpPHXVA@mail.gmail.com>
References: <1443024323-9115-1-git-send-email-wens@csie.org>
 <1443024323-9115-3-git-send-email-wens@csie.org> <20150923164532.GT30445@sirena.org.uk>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBCHGR2YAKGQE4ITRBUQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150923164532.GT30445-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 24, 2015 at 12:45 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Sep 24, 2015 at 12:05:18AM +0800, Chen-Yu Tsai wrote:
>
>> +static int sunxi_rsb_device_probe(struct device *dev)
>> +{
>> +     const struct sunxi_rsb_driver *drv = to_sunxi_rsb_driver(dev->driver);
>> +     struct sunxi_rsb_device *rdev = to_sunxi_rsb_device(dev);
>> +     int ret;
>> +
>> +     if (dev->bus != &sunxi_rsb_bus)
>> +             return 0;
>
> That's a bit worrying...  why might this get called for something other
> than a rsb device?

You're right. sunxi_rsb_bus is self contained (not exported) in sunxi_rsb.c,
so it's safe to assume that the devices going through sunxi_rsb_device_probe()
and sunxi_rsb_device_remove() are indeed sunxi_rsb slave devices.

I'll remove the checks from both functions.

>> +struct regmap *devm_regmap_init_sunxi_rsb(struct sunxi_rsb_device *rdev,
>> +                                       const struct regmap_config *config);
>
> This should work most of the time but you might want to take a look at
> the changes introduced in 3cfe7a74d42b (regmap: Use different lockdep
> class for each regmap init call) and follow a similar pattern for RSB to
> avoid spurious lockdep warnings in some configurations - see the commit
> log for that change for a full explanation.

This seems easy enough. I'll follow the patterns found in linux/regmap.h.

> Otherwise the regmap bit of this looks good, I'll try to have another
> look through at the rest of the code later.

Thanks!


Regards
ChenYu
