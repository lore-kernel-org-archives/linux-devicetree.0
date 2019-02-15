From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v1 1/1] of: unittest: unflatten device tree on UML when
 testing
Date: Thu, 14 Feb 2019 16:10:42 -0800
Message-ID: <4cb7ca12-ce60-7516-b7eb-aef08f607acc@gmail.com>
References: <20190212185305.112847-1-brendanhiggins@google.com>
 <20190212185305.112847-2-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212185305.112847-2-brendanhiggins@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Brendan Higgins <brendanhiggins@google.com>, robh+dt@kernel.org, mcgrof@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2/12/19 10:53 AM, Brendan Higgins wrote:
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
> index 84427384654d5..effa4e2b9d992 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -2527,6 +2527,9 @@ static int __init of_unittest(void)
>  	}
>  	of_node_put(np);
>  
> +	if (IS_ENABLED(CONFIG_UML))
> +		unflatten_device_tree();
> +
>  	pr_info("start of unittest - you will see error messages\n");
>  	of_unittest_check_tree_linkage();
>  	of_unittest_check_phandles();
> 

(Insert my usual disclaimer that I am clueless about UML, I still need to learn
about it...)

This does not look correct to me.

A few lines earlier in of_unittest(), the live devicetree needs to exist for
unittest_data_data() and a few of_*() functions to succeed.  So it seems
that the unflatten_device_tree() for uml should be at the beginning of
of_unittest().

Rob, if I am correct please revert this patch.

-Frank
