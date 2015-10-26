From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/3] nvmem: mediatek: Add Mediatek EFUSE driver
Date: Mon, 26 Oct 2015 11:28:34 +0100
Message-ID: <20151026102834.GE25308@pengutronix.de>
References: <1444984751-4572-1-git-send-email-andrew-ct.chen@mediatek.com>
 <1444984751-4572-3-git-send-email-andrew-ct.chen@mediatek.com>
 <562DF8C8.8060600@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <562DF8C8.8060600-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 26, 2015 at 09:56:24AM +0000, Srinivas Kandagatla wrote:
> >+	.val_bits = 32,
> >+	.reg_stride = 4,
> >+};
> >+
> >+static int mtk_efuse_probe(struct platform_device *pdev)
> >+{
> >+	struct device *dev = &pdev->dev;
> >+	struct resource *res;
> >+	struct nvmem_device *nvmem;
> >+	struct nvmem_config *econfig;
> >+	struct regmap *regmap;
> >+	void __iomem *base;
> >+
> >+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >+	base = devm_ioremap_resource(dev, res);
> >+	if (IS_ERR(base))
> >+		return PTR_ERR(base);
> >+
> >+	econfig = devm_kzalloc(dev, sizeof(*econfig), GFP_KERNEL);
> >+	if (!econfig)
> >+		return -ENOMEM;
> Why not use static econfig variable?

Because drivers should not assume there is only one instance of them in
the system. The qfprom driver does this and it's only a matter of
putting a second qcom,qfprom node into the device tree to break the
driver.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
