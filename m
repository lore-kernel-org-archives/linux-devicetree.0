Return-Path: <SRS0=ANIs=F5=gmail.com=frowand.list@kernel.org>
Subject: Re: [PATCH] of: unittest: fix an error test in
 of_unittest_overlay_8()
References: <20180307061808.GA15765@mwanda>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <b493653d-3284-dd8b-1335-ff0409b3a556@gmail.com>
Date: Wed, 7 Mar 2018 11:09:26 -0800
MIME-Version: 1.0
In-Reply-To: <20180307061808.GA15765@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On 03/06/18 22:18, Dan Carpenter wrote:
> We changed this from of_overlay_apply() to overlay_data_apply().  The 
> overlay_data_apply() function returns 1 on success and 0 on error so
> the check for less than zero needs to be updated.
> 
> Fixes: 39a751a4cb7e ("of: change overlay apply input data from unflattened to FDT")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index ca5e86dadae2..b233f170b2ec 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -1666,8 +1666,7 @@ static void __init of_unittest_overlay_8(void)
>  
>  		overlay_name = overlay_name_from_nr(overlay_nr + i);
>  
> -		ret = overlay_data_apply(overlay_name, &ovcs_id);
> -		if (ret < 0)  {
> +		if (!overlay_data_apply(overlay_name, &ovcs_id)) {
>  			unittest(0, "could not apply overlay \"%s\"\n",
>  					overlay_name);
>  			return;
> 

Thank you.

Reviewed-by: Frank Rowand <frank.rowand@sony.com>
