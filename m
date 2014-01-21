From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] dtc: Sort unit addresses by number
Date: Tue, 21 Jan 2014 10:02:21 +0000
Message-ID: <20140121100221.GJ28747@e106331-lin.cambridge.arm.com>
References: <20140121134935.1f9cebcc@kryten>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140121134935.1f9cebcc@kryten>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 21, 2014 at 02:49:35AM +0000, Anton Blanchard wrote:
> 
> The sort option in dtc treats unit addresses as strings. This causes
> cpu nodes to end up out of order:
> 
> # dtc -s -I fs -O dts /proc/device-tree | grep PowerPC,POWER7
> 
> 		PowerPC,POWER7@30 {
> 		PowerPC,POWER7@68 {
> 		PowerPC,POWER7@70 {
> 		PowerPC,POWER7@828 {
> 		PowerPC,POWER7@860 {
> 		PowerPC,POWER7@868 {
> 		PowerPC,POWER7@8a0 {
> 		PowerPC,POWER7@8b0 {
> 		PowerPC,POWER7@8f0 {
> 		PowerPC,POWER7@a0 {
> 		PowerPC,POWER7@a8 {
> 		PowerPC,POWER7@e0 {
> 
> If we use this device tree for a kexec boot we end up with a confusing
> layout of logical CPUs:
> 
> node 0 cpus: 0-23 72-95
> node 0 size: 32633 MB
> 
> node 1 cpus: 24-71
> node 1 size: 32631 MB
> 
> The reason for this is that we allocate logical CPU ids as we walk
> through the device tree.
> 
> In cmp_subnode, if both nodes have a hex unit address and the
> basenames match, then compare by number.
> 
> This fixes the issue:
> 
> # dtc -s -I fs -O dts /proc/device-tree | grep PowerPC,POWER7
> 		PowerPC,POWER7@30 {
> 		PowerPC,POWER7@68 {
> 		PowerPC,POWER7@70 {
> 		PowerPC,POWER7@a0 {
> 		PowerPC,POWER7@a8 {
> 		PowerPC,POWER7@e0 {
> 		PowerPC,POWER7@828 {
> 		PowerPC,POWER7@860 {
> 		PowerPC,POWER7@868 {
> 		PowerPC,POWER7@8a0 {
> 		PowerPC,POWER7@8b0 {
> 		PowerPC,POWER7@8f0 {
> 
> And the CPU layout is as expected:
> 
> node 0 cpus: 0-47
> node 0 size: 32633 MB
> 
> node 1 cpus: 48-95
> node 1 size: 32631 MB
> 
> Signed-off-by: Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
> --
> 
> Index: b/livetree.c
> ===================================================================
> --- a/livetree.c
> +++ b/livetree.c
> @@ -656,12 +656,38 @@ static void sort_properties(struct node
>  	free(tbl);
>  }
>  
> +static bool is_hex(const char *str)
> +{
> +	while (*str) {
> +		if (!isxdigit(*str++))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>  static int cmp_subnode(const void *ax, const void *bx)
>  {
> -	const struct node *a, *b;
> +	struct node *a, *b;
> +	const char *a_unit, *b_unit;
> +
> +	a = *((struct node * const *)ax);
> +	b = *((struct node * const *)bx);
> +
> +	a_unit = get_unitname(a);
> +	b_unit = get_unitname(b);
> +
> +	/* Sort hex unit addresses by number */
> +	if (a_unit && b_unit && (a->basenamelen == b->basenamelen) &&
> +	    !strncmp(a->name, b->name, a->basenamelen) &&
> +	    is_hex(a_unit) && is_hex(b_unit)) {
> +		unsigned long long a_num, b_num;
> +
> +		a_num = strtoull(a_unit, NULL, 16);
> +		b_num = strtoull(b_unit, NULL, 16);
>  
> -	a = *((const struct node * const *)ax);
> -	b = *((const struct node * const *)bx);
> +		return (a_num > b_num) - (a_num < b_num);
> +	}
>  
>  	return strcmp(a->name, b->name);
>  }

Minor issue, but when #address-cells == 2, some unit addresses are split
in the middle by a ',' to separate the value of each cell, e.g.
"flash@2,0". For those, is_hex will return false and we'll compare
unit-addresses as strings.

I took a quick look over the dts in the Linux kernel tree (with `git
grep "@.\+," -- arch/*/boot/dts` and I think every instance there would
sort correctly as a string, but it would be nice to fix the issue
regardless of how large the unit-address is.

Perhaps we could have a helper function for reading the unit-address
that would take this into account?

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
