From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of/platform: fix compilation warning of
 of_link_property()
Date: Thu, 8 Aug 2019 09:09:52 -0700
Message-ID: <a4c12db8-bac3-0093-1f3f-0bd325acb03a@gmail.com>
References: <20190808141818.22724-1-anders.roxell@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808141818.22724-1-anders.roxell@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anders Roxell <anders.roxell@linaro.org>, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 8/8/19 7:18 AM, Anders Roxell wrote:
> GCC warns that a negative integer can be returned but the
> of_link_property() function should return a boolean.
> 
> ../drivers/of/platform.c: In function ‘of_link_property’:
> ../drivers/of/platform.c:650:18: warning: ?: using integer constants in boolean context [-Wint-in-bool-context]
>   return done ? 0 : -ENODEV;
> 
> Rework so function of_link_property() return an integer instead of a boolean.
> 
> Fixes: 690ff7881b26 ("of/platform: Add functional dependency link from DT bindings")
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
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

Hi Anders,

Thanks for catching this.

Another patch was submitted to fix this just before your patch.

-Frank
