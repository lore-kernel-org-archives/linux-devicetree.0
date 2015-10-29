From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v8 10/17] phy: Add driver for rockchip Display Port PHY
Date: Thu, 29 Oct 2015 09:14:44 +0800
Message-ID: <56317304.5070506@rock-chips.com>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com>
 <1446021033-11537-1-git-send-email-ykk@rock-chips.com>
 <1657250.2TWeX0dr1C@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1657250.2TWeX0dr1C@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dri-deve
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 10/29/2015 04:36 AM, Heiko Stuebner wrote:
> Hi Yakir,
>
> Am Mittwoch, 28. Oktober 2015, 16:30:33 schrieb Yakir Yang:
>> +static int rockchip_dp_phy_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *np = dev->of_node;
>> +	struct phy_provider *phy_provider;
>> +	struct rockchip_dp_phy *dp;
>> +	struct resource *res;
> drivers/phy/phy-rockchip-dp.c: In function 'rockchip_dp_phy_probe':
> drivers/phy/phy-rockchip-dp.c:86:19: warning: unused variable 'res' [-Wunused-variable]

Oh, thanks, would send v9 of this one alone.

- Yakir

>> +	struct phy *phy;
>> +	int ret;
>> +
>> +	if (!np)
>> +		return -ENODEV;
>> +
>> +	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
>> +	if (IS_ERR(dp))
>> +		return -ENOMEM;
>> +
>> +	dp->dev = dev;
>> +
>> +	dp->phy_24m = devm_clk_get(dev, "24m");
>> +	if (IS_ERR(dp->phy_24m)) {
>> +		dev_err(dev, "cannot get clock 24m\n");
>> +		return PTR_ERR(dp->phy_24m);
>> +	}
>> +
>> +	ret = clk_set_rate(dp->phy_24m, 24000000);
>> +	if (ret < 0) {
>> +		dev_err(dp->dev, "cannot set clock phy_24m %d\n", ret);
>> +		return ret;
>> +	}
>> +
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
