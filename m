From: Leif Lindholm <leif.lindholm@linaro.org>
Subject: Re: [PATCH 1/2] of: handle both '/' and ':' in path strings
Date: Tue, 17 Mar 2015 21:11:39 +0000
Message-ID: <20150317211139.GQ4278@bivouac.eciton.net>
References: <1425924225-22748-2-git-send-email-leif.lindholm@linaro.org>
 <1426620632-23383-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1426620632-23383-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Peter Hurley <peter@hurleysoftware.com>, stable@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 17, 2015 at 12:30:31PM -0700, Brian Norris wrote:
> Commit 106937e8ccdc ("of: fix handling of '/' in options for
> of_find_node_by_path()") caused a regression in OF handling of
> stdout-path. While it fixes some cases which have '/' after the ':', it
> breaks cases where there is more than one '/' *before* the ':'.
> 
> For example, it breaks this boot string
> 
>   stdout-path = "/rdb/serial@f040ab00:115200";
> 
> So rather than doing sequentialized checks (first for '/', then for ':';
> or vice versa), to get the correct behavior we need to check for the
> first occurrence of either one of them.
> 
> It so happens that the handy strcspn() helper can do just that.
> 
> Fixes: 106937e8ccdc ("of: fix handling of '/' in options for of_find_node_by_path()")
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: stable@vger.kernel.org
> ---
> This is for -stable only because the regression is marked for stable. Not sure
> the first one deserves to go to -stable, actually...
> 
>  drivers/of/base.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index adb8764861c0..966d6fdcf427 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -715,13 +715,8 @@ static struct device_node *__of_find_node_by_path(struct device_node *parent,
>  {
>  	struct device_node *child;
>  	int len;
> -	const char *end;
>  
> -	end = strchr(path, ':');
> -	if (!end)
> -		end = strchrnul(path, '/');
> -
> -	len = end - path;
> +	len = strcspn(path, "/:");
>  	if (!len)
>  		return NULL;
>  
> -- 
> 1.9.1

Yeah, that's neater that the fix I sent out earlier today.

Acked-by: Leif Lindholm <leif.lindholm@linaro.org>
