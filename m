From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: Add dummy for of_node_is_root if not CONFIG_OF
Date: Tue, 7 May 2019 10:52:06 -0700
Message-ID: <a3573253-e3de-0a82-8af3-6bacea20bd97@gmail.com>
References: <20190507044801.250396-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190507044801.250396-1-dianders@chromium.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, Kees Cook <keescook@chromium.org>
Cc: linux-rockchip@lists.infradead.org, jwerner@chromium.org, groeck@chromium.org, briannorris@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 5/6/19 9:48 PM, Douglas Anderson wrote:
> We'll add a dummy to just return false.

A more complete explanation of why this is needed please.

My one guess would be compile testing of arch/sparc/kernel/prom_64.c
fails???

-Frank


> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  include/linux/of.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 0cf857012f11..62ae5c1cafa5 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -653,6 +653,11 @@ static inline bool of_have_populated_dt(void)
>  	return false;
>  }
>  
> +static inline bool of_node_is_root(const struct device_node *node)
> +{
> +	return false;
> +}
> +
>  static inline struct device_node *of_get_compatible_child(const struct device_node *parent,
>  					const char *compatible)
>  {
> 
