Return-Path: <SRS0=R4lo=WE=gmail.com=frowand.list@kernel.org>
Subject: Re: [PATCH] of/platform: Clean up a return type in of_link_property()
References: <20190808103207.GA30506@mwanda>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <b5afe4e9-db49-f50c-eb03-5d300a72e88b@gmail.com>
Date: Thu, 8 Aug 2019 09:09:58 -0700
MIME-Version: 1.0
In-Reply-To: <20190808103207.GA30506@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Rob Herring <robh+dt@kernel.org>, Saravana Kannan <saravanak@google.com>
Cc: Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 8/8/19 3:32 AM, Dan Carpenter wrote:
> This function is supposed to return zero on success and negative
> error codes on failure but currently it returns true on failure.  The
> caller only checks for zero and non-zero so this mixup doesn't cause any
> runtime issues.
> 
> Fixes: 690ff7881b26 ("of/platform: Add functional dependency link from DT bindings")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/of/platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 21838226d68a..86fb8ab8c012 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -625,7 +625,7 @@ static const struct supplier_bindings bindings[] = {
>  	{ },
>  };
>  
> -static bool of_link_property(struct device *dev, struct device_node *con_np,
> +static int of_link_property(struct device *dev, struct device_node *con_np,
>  			     const char *prop)
>  {
>  	struct device_node *phandle;
> 

Hi Dan,


Thanks for catching this.

Another patch was submitted to fix this just before your patch.

-Frank
