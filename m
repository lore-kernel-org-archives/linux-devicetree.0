From: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v4 11/11] lib/test_printf: Add tests for %pfw printk
 modifier
Date: Tue, 3 Sep 2019 15:38:41 +0200
Message-ID: <20190903133841.dhb6k2lwx2gglyjs@pathway.suse.cz>
References: <20190902083240.20367-1-sakari.ailus@linux.intel.com>
 <20190902083240.20367-12-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190902083240.20367-12-sakari.ailus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: rafael@kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 2019-09-02 11:32:40, Sakari Ailus wrote:
> Add a test for the %pfw printk modifier using software nodes.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  lib/test_printf.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/lib/test_printf.c b/lib/test_printf.c
> index 944eb50f38625..9c6d716979fb1 100644
> --- a/lib/test_printf.c
> +++ b/lib/test_printf.c
> @@ -22,6 +22,8 @@
>  #include <linux/gfp.h>
>  #include <linux/mm.h>
>  
> +#include <linux/property.h>
> +
>  #include "../tools/testing/selftests/kselftest_module.h"
>  
>  #define BUF_SIZE 256
> @@ -588,6 +590,40 @@ flags(void)
>  	kfree(cmp_buffer);
>  }
>  
> +static void __init fwnode_pointer(void)
> +{
> +	const struct software_node softnodes[] = {
> +		{ .name = "first", },
> +		{ .name = "second", .parent = &softnodes[0], },
> +		{ .name = "third", .parent = &softnodes[1], },
> +		{ NULL /* Guardian */ },
> +	};
> +	const char * const full_name = "/second/third";
> +	const char * const full_name_second = "/second";
> +	const char * const second_name = "second";
> +	const char * const third_name = "third";
> +	int rval;
> +
> +	rval = software_node_register_nodes(softnodes);
> +	if (rval) {
> +		pr_warn("cannot register softnodes; rval %d\n", rval);
> +		return;
> +	}
> +
> +	test(full_name_second, "%pfw",
> +	     software_node_fwnode(&softnodes[ARRAY_SIZE(softnodes) - 3]));

"ARRAY_SIZE(softnodes) - 3" is quite cryptic.
Is there any particular reason to use it instead of &softnodes[1] ?

And is it expected that it does not print the "/first" parent?

> +	test(full_name, "%pfw",
> +	     software_node_fwnode(&softnodes[ARRAY_SIZE(softnodes) - 2]));
> +	test(full_name, "%pfwf",
> +	     software_node_fwnode(&softnodes[ARRAY_SIZE(softnodes) - 2]));
> +	test(second_name, "%pfwP",
> +	     software_node_fwnode(&softnodes[ARRAY_SIZE(softnodes) - 3]));
> +	test(third_name, "%pfwP",
> +	     software_node_fwnode(&softnodes[ARRAY_SIZE(softnodes) - 2]));
> +
> +	software_node_unregister_nodes(softnodes);
> +}

Anyway, thanks for the tests.

Best Regards,
Petr
