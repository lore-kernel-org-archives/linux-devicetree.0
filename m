From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH][next] scripts/dtc: fix spelling mistake: "endpont" ->
 "endpoint"
Date: Tue, 15 May 2018 13:42:15 -0700
Message-ID: <ff9f1b12-6d29-d247-81e6-92b10faac0d1@gmail.com>
References: <20180515090209.9165-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180515090209.9165-1-colin.king@canonical.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Colin,

On 05/15/18 02:02, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in FAIL message.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  scripts/dtc/checks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/dtc/checks.c b/scripts/dtc/checks.c
> index a2cc1036c915..9d253819e12c 100644
> --- a/scripts/dtc/checks.c
> +++ b/scripts/dtc/checks.c
> @@ -1536,7 +1536,7 @@ static void check_graph_endpoint(struct check *c, struct dt_info *dti,
>  		return;
>  
>  	if (!strprefixeq(node->name, node->basenamelen, "endpoint"))
> -		FAIL(c, dti, node, "graph endpont node name should be 'endpoint'");
> +		FAIL(c, dti, node, "graph endpoint node name should be 'endpoint'");
>  
>  	check_graph_reg(c, dti, node);
>  
> 

Thanks for catching this.

We import this file from the upstream dtc project.  Please send this same exact patch
to:

   David Gibson <david@gibson.dropbear.id.au>
   devicetree-compiler@vger.kernel.org

Thanks,

Frank
