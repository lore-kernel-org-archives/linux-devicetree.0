From: Chris Ball <cjb@laptop.org>
Subject: Re: [PATCH 2/2] mmc: dw_mmc: add dw_mmc-k3 for k3 platform
Date: Sat, 26 Oct 2013 22:28:19 -0400
Message-ID: <87a9hvla64.fsf@octavius.laptop.org>
References: <1382339639-16764-3-git-send-email-zhangfei.gao@linaro.org>
	<1382533396-6584-1-git-send-email-zhangfei.gao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1382533396-6584-1-git-send-email-zhangfei.gao@linaro.org>
	(Zhangfei Gao's message of "Wed, 23 Oct 2013 21:03:16 +0800")
Sender: linux-mmc-owner@vger.kernel.org
To: Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Zhangfei, just small changes,

On Wed, Oct 23 2013, Zhangfei Gao wrote:
> +* tune-table: should be array of clock tune mmc controller

This sounds like it should be "tuning-table", and shouldn't it also
have a prefix?

> +			node = of_find_compatible_node(NULL, NULL,
> +						"hisilicon,pctrl");

No need to use two lines here.

> +		ret = of_property_read_u32_array(np,
> +				"clken-reg", data, 2);

Or here, same with the other of_property_read_u32_array() calls.

> +MODULE_DESCRIPTION("K3 Specific DW-MSHC Driver Extension");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:dwmmc-k3");

Can you add a MODULE_AUTHOR too?

Thanks,

- Chris.
-- 
Chris Ball   <cjb@laptop.org>   <http://printf.net/>
