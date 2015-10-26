From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/3] nvmem: mediatek: Add Mediatek EFUSE driver
Date: Mon, 26 Oct 2015 10:39:46 +0000
Message-ID: <562E02F2.50709@linaro.org>
References: <1444984751-4572-1-git-send-email-andrew-ct.chen@mediatek.com> <1444984751-4572-3-git-send-email-andrew-ct.chen@mediatek.com> <562DF8C8.8060600@linaro.org> <20151026102834.GE25308@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151026102834.GE25308@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: andrew-ct.chen@mediatek.com, Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org



On 26/10/15 10:28, Sascha Hauer wrote:
> On Mon, Oct 26, 2015 at 09:56:24AM +0000, Srinivas Kandagatla wrote:
>>> +	.val_bits = 32,
>>> +	.reg_stride = 4,
>>> +};
>>> +
>>> +static int mtk_efuse_probe(struct platform_device *pdev)
>>> +{
>>> +	struct device *dev = &pdev->dev;
>>> +	struct resource *res;
>>> +	struct nvmem_device *nvmem;
>>> +	struct nvmem_config *econfig;
>>> +	struct regmap *regmap;
>>> +	void __iomem *base;
>>> +
>>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +	base = devm_ioremap_resource(dev, res);
>>> +	if (IS_ERR(base))
>>> +		return PTR_ERR(base);
>>> +
>>> +	econfig = devm_kzalloc(dev, sizeof(*econfig), GFP_KERNEL);
>>> +	if (!econfig)
>>> +		return -ENOMEM;
>> Why not use static econfig variable?
>
> Because drivers should not assume there is only one instance of them in
> the system. The qfprom driver does this and it's only a matter of
Good point, Yes, you are right. If MTK has possibility of having more 
than one efuse we can leave the code as it is.
> putting a second qcom,qfprom node into the device tree to break the
> driver.
It would indeed.
--srini
>
> Sascha
>
