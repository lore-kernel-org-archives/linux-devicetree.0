From: Mukesh Ojha <mojha@codeaurora.org>
Subject: Re: [PATCH] scripts/dtc: fix spelling mistake "endpont" -> "endpoint"
Date: Tue, 16 Apr 2019 18:46:06 +0530
Message-ID: <a3535cd0-dc5f-7f76-b808-b170c312214a@codeaurora.org>
References: <20190416111214.22107-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416111214.22107-1-colin.king@canonical.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 4/16/2019 4:42 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a FAIL message, fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh
> ---
>   scripts/dtc/checks.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/dtc/checks.c b/scripts/dtc/checks.c
> index 4834e44b37b2..faddf6a57236 100644
> --- a/scripts/dtc/checks.c
> +++ b/scripts/dtc/checks.c
> @@ -1714,7 +1714,7 @@ static void check_graph_endpoint(struct check *c, struct dt_info *dti,
>   		return;
>   
>   	if (!strprefixeq(node->name, node->basenamelen, "endpoint"))
> -		FAIL(c, dti, node, "graph endpont node name should be 'endpoint'");
> +		FAIL(c, dti, node, "graph endpoint node name should be 'endpoint'");
>   
>   	check_graph_reg(c, dti, node);
>   
