From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2] of: unittest: unflatten device tree on UML when
 testing
Date: Fri, 15 Feb 2019 18:18:09 -0800
Message-ID: <eabdd156-62f4-fadb-bfa4-ecbb5ba65527@gmail.com>
References: <20190216004647.206431-1-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190216004647.206431-1-brendanhiggins@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Brendan Higgins <brendanhiggins@google.com>, robh+dt@kernel.org, mcgrof@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2/15/19 4:46 PM, Brendan Higgins wrote:
> UML supports enabling OF, and is useful for running the device tree
> tests, so add support for unflattening device tree blobs so we can
> actually use it.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
>  drivers/of/unittest.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 84427384654d5..6de34d5fa0e85 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -2527,6 +2527,9 @@ static int __init of_unittest(void)
>  	}
>  	of_node_put(np);
>  
> +	if (IS_ENABLED(CONFIG_UML))
> +		unittest_unflatten_overlay_base();
> +

This is still the wrong location.  It should be at the top of the function.

I'll try moving it to the top and see if it still works -- should only
take me a few minutes.

-Frank

>  	pr_info("start of unittest - you will see error messages\n");
>  	of_unittest_check_tree_linkage();
>  	of_unittest_check_phandles();
> 
