From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of/fdt: avoid undefined behaviour in
 populate_properties()
Date: Fri, 6 Jul 2018 09:51:11 -0700
Message-ID: <c1f615b6-6e56-414c-b4f8-e75ad4c114e7@gmail.com>
References: <20180706113715.30053-1-mark.rutland@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180706113715.30053-1-mark.rutland@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/06/18 04:37, Mark Rutland wrote:
> We unflatten a device tree in two passes: the first calculating the size
> of the unflattened tree, and the second performing the actual
> unflattening into a suitably-sized buffer.
> 
> During the first (dryrun) pass, the memory pool is NULL, and we derive
> other pointers from this. Mostly these are done though intermediate
> casts to unsigned long, which prevents the compiler from being able to
> observe this as undefined behaviour. However, in populate_properties()
> we derive the pprev pointer from the np pointer, which is NULL if it is
> the first element allocated from the memory pool.
> 
> This is detected by UBSAN:
> 
> ================================================================================
> UBSAN: Undefined behaviour in drivers/of/fdt.c:190:8
> member access within null pointer of type 'struct device_node'
> CPU: 0 PID: 0 Comm: swapper Not tainted 4.18.0-rc3+ #13
> Hardware name: ARM Juno development board (r1) (DT)
> Call trace:
>  dump_backtrace+0x0/0x458
>  show_stack+0x20/0x30
>  dump_stack+0x18c/0x248
>  ubsan_epilogue+0x18/0x94
>  handle_null_ptr_deref+0x1d4/0x228
>  __ubsan_handle_type_mismatch_v1+0x188/0x1e0
>  unflatten_dt_nodes+0xd40/0x1000
>  __unflatten_device_tree+0x58/0x248
>  unflatten_device_tree+0x38/0x4c
>  setup_arch+0x3b0/0xcc4
>  start_kernel+0xd8/0xb9c
> ================================================================================
> 
> In the dryrun pass we don't actually use the pprev value, so let's only
> set it when !dryrun, and avoid the undefined behaviour.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: devicetree@vger.kernel.org
> ---
>  drivers/of/fdt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 6da20b9688f7..c1d0c348f2b3 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -187,7 +187,9 @@ static void populate_properties(const void *blob,
>  	int cur;
>  	bool has_name = false;
>  
> -	pprev = &np->properties;
> +	if (!dryrun)
> +		pprev = &np->properties;
> +
>  	for (cur = fdt_first_property_offset(blob, offset);
>  	     cur >= 0;
>  	     cur = fdt_next_property_offset(blob, cur)) {
> 

Please add a one line comment explaining why "if (!dryrun)" so that no one
decides to remove the test in the future as not needed.  Otherwise,

Reviewed-by: Frank Rowand <frank.rowand@sony.com>

-Frank
