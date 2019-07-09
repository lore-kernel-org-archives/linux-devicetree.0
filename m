From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 05/10] net: hisilicon: HI13X1_GMAX need dreq reset at
 first
Date: Tue, 9 Jul 2019 12:35:57 +0300
Message-ID: <890c48d1-76b8-5aea-e175-aa7d9967acd2@cogentembedded.com>
References: <1562643071-46811-1-git-send-email-xiaojiangfeng@huawei.com>
 <1562643071-46811-6-git-send-email-xiaojiangfeng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1562643071-46811-6-git-send-email-xiaojiangfeng@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jiangfeng Xiao <xiaojiangfeng@huawei.com>, davem@davemloft.net, robh+dt@kernel.org, yisen.zhuang@huawei.com, salil.mehta@huawei.com, mark.rutland@arm.com, dingtianhong@huawei.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, leeyou.li@huawei.com, nixiaoming@huawei.com, jianping.liu@huawei.com, xiekunxun@huawei.com
List-Id: devicetree@vger.kernel.org

Hello!

On 09.07.2019 6:31, Jiangfeng Xiao wrote:

> HI13X1_GMAC delete request for soft reset at first,
> otherwise, the subsequent initialization will not
> take effect.
> 
> Signed-off-by: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
> ---
>   drivers/net/ethernet/hisilicon/hip04_eth.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/net/ethernet/hisilicon/hip04_eth.c b/drivers/net/ethernet/hisilicon/hip04_eth.c
> index fe61b01..19d8cfd 100644
> --- a/drivers/net/ethernet/hisilicon/hip04_eth.c
> +++ b/drivers/net/ethernet/hisilicon/hip04_eth.c
[...]
> @@ -853,6 +867,15 @@ static int hip04_mac_probe(struct platform_device *pdev)
>   		goto init_fail;
>   	}
>   
> +#if defined(CONFIG_HI13X1_GMAC)
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	priv->sysctrl_base = devm_ioremap_resource(d, res);

    There's devm_platform_ioremap_resource() now.

> +	if (IS_ERR(priv->sysctrl_base)) {
> +		ret = PTR_ERR(priv->sysctrl_base);
> +		goto init_fail;
> +	}
> +#endif
> +
>   	ret = of_parse_phandle_with_fixed_args(node, "port-handle", 2, 0, &arg);
>   	if (ret < 0) {
>   		dev_warn(d, "no port-handle\n");
[...]

MBR, Sergei
