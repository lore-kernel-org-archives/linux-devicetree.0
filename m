From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of/device.c: fix the wrong comments
Date: Fri, 26 Apr 2019 12:31:21 -0700
Message-ID: <d28a199c-eba3-7f10-0430-c3da58522a41@gmail.com>
References: <1556156754-18993-1-git-send-email-jojo_zeng@126.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556156754-18993-1-git-send-email-jojo_zeng@126.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: jojo_zeng@126.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 4/24/19 6:45 PM, jojo_zeng@126.com wrote:
> From: Jojo Zeng <jojo_zeng@126.com>
> 
> the comments which discribed the input parameters of of_match_device(). 
> the name is changed, so fix it.
> 
> Signed-off-by: Jojo Zeng <jojo_zeng@126.com>
> ---
>  drivers/of/device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index 3717f2a..da81583 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -17,7 +17,7 @@
>  
>  /**
>   * of_match_device - Tell if a struct device matches an of_device_id list
> - * @ids: array of of device match structures to search in
> + * @matches: array of of device match structures to search in
>   * @dev: the of device structure to match against
>   *
>   * Used by a driver to check whether an platform_device present in the
> 


Reviewed-by: Frank Rowand <frank.rowand@sony.com>
