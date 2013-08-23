Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-db8lp0184.outbound.messaging.microsoft.com ([213.199.154.184]:13898
	"EHLO db8outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753927Ab3HWHmA convert rfc822-to-8bit
	(ORCPT <rfc822;devicetree@vger.kernel.org>);
	Fri, 23 Aug 2013 03:42:00 -0400
Message-ID: <5217127C.3050602@freescale.com>
Date: Fri, 23 Aug 2013 15:42:52 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
Subject: Re: [PATCH -next] mtd: ofpart: use for_each_child_of_node() macro
References: <CAPgLHd_zSXzRWGgQUzsmsM4beiTFKoWtcic6QmJdxhfBvNEZYg@mail.gmail.com>
In-Reply-To: <CAPgLHd_zSXzRWGgQUzsmsM4beiTFKoWtcic6QmJdxhfBvNEZYg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: dwmw2@infradead.org, grant.likely@linaro.org, rob.herring@calxeda.com, devicetree@vger.kernel.org, yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

于 2013年08月23日 11:04, Wei Yongjun 写道:
> From: Wei Yongjun<yongjun_wei@trendmicro.com.cn>
>
> Use for_each_child_of_node() macro instead of open coding it.
>
> Signed-off-by: Wei Yongjun<yongjun_wei@trendmicro.com.cn>
> ---
>   drivers/mtd/ofpart.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
> index 7843a44..d64f8c3 100644
> --- a/drivers/mtd/ofpart.c
> +++ b/drivers/mtd/ofpart.c
> @@ -43,9 +43,8 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>   		return 0;
>
>   	/* First count the subnodes */
> -	pp = NULL;
>   	nr_parts = 0;
> -	while ((pp = of_get_next_child(node, pp))) {
> +	for_each_child_of_node(node,  pp) {
>   		if (node_has_compatible(pp))
>   			continue;
>
> @@ -59,9 +58,8 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>   	if (!*pparts)
>   		return -ENOMEM;
>
> -	pp = NULL;
>   	i = 0;
> -	while ((pp = of_get_next_child(node, pp))) {
> +	for_each_child_of_node(node,  pp) {
>   		const __be32 *reg;
>   		int len;
>   		int a_cells, s_cells;
Acked-by: Huang Shijie <b32955@freescale.com>

