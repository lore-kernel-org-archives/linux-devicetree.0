From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] scripts/dtc: fix spelling mistake "endpont" -> "endpoint"
Date: Tue, 16 Apr 2019 11:17:09 -0700
Message-ID: <2c66cb65-fd22-39f8-4446-fc0cfd611e00@gmail.com>
References: <20190416111214.22107-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416111214.22107-1-colin.king@canonical.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Colin,

On 4/16/19 4:12 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a FAIL message, fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  scripts/dtc/checks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/dtc/checks.c b/scripts/dtc/checks.c
> index 4834e44b37b2..faddf6a57236 100644
> --- a/scripts/dtc/checks.c
> +++ b/scripts/dtc/checks.c
> @@ -1714,7 +1714,7 @@ static void check_graph_endpoint(struct check *c, struct dt_info *dti,
>  		return;
>  
>  	if (!strprefixeq(node->name, node->basenamelen, "endpoint"))
> -		FAIL(c, dti, node, "graph endpont node name should be 'endpoint'");
> +		FAIL(c, dti, node, "graph endpoint node name should be 'endpoint'");
>  
>  	check_graph_reg(c, dti, node);
>  
> 

Thanks for catching the error.

This file is imported from an upstream project.  The error is fixed upstream in
commit 4762ad051ee0 ("checks: Fix spelling in check_graph_endpoint") in the
devicetree tools project.  Rob pulls the changes from this project on a
periodic basis.

-Frank
