From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: support passing console options with stdout-path
Date: Tue, 25 Nov 2014 14:58:54 +0000
Message-ID: <20141125145854.A46EDC44343@trevor.secretlab.ca>
References: <1416867838-18652-1-git-send-email-leif.lindholm@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416867838-18652-1-git-send-email-leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, ijc-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 24 Nov 2014 22:23:58 +0000
, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
 wrote:
> Support specifying console options (like with console=ttyXN,<options>)
> by appending them to the stdout-path property after a separating ':'.
> 
> Example:
> 	stdout-path = "uart0:115200";
> 
> This patch also modifies of_find_node_by_path() to match only the
> portion of the path before a ':'.
> 
> Signed-off-by: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/of/base.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 3823edf..89c6b33 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -37,6 +37,7 @@ EXPORT_SYMBOL(of_allnodes);
>  struct device_node *of_chosen;
>  struct device_node *of_aliases;
>  struct device_node *of_stdout;
> +static char *of_stdout_options;
>  
>  struct kset *of_kset;
>  
> @@ -703,6 +704,8 @@ static struct device_node *__of_find_node_by_path(struct device_node *parent,
>  	if (!len)
>  		return NULL;
>  
> +	len = strchrnul(path, ':') - path;
> +
>  	__for_each_child_of_node(parent, child) {
>  		const char *name = strrchr(child->full_name, '/');
>  		if (WARN(!name, "malformed device_node %s\n", child->full_name))
> @@ -747,6 +750,8 @@ struct device_node *of_find_node_by_path(const char *path)
>  		if (!of_aliases)
>  			return NULL;
>  
> +		len = strchrnul(path, ':') - path;
> +
>  		for_each_property_of_node(of_aliases, pp) {
>  			if (strlen(pp->name) == len && !strncmp(pp->name, path, len)) {
>  				np = of_find_node_by_path(pp->value);

Can you add a testcase to drivers/of/unittests.c for this new path
parsing? Then we know it's correct!

> @@ -1830,8 +1835,12 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
>  			name = of_get_property(of_chosen, "linux,stdout-path", NULL);
>  		if (IS_ENABLED(CONFIG_PPC) && !name)
>  			name = of_get_property(of_aliases, "stdout", NULL);
> -		if (name)
> +		if (name) {
>  			of_stdout = of_find_node_by_path(name);
> +			of_stdout_options = strchr(name, ':');
> +			if (of_stdout_options != NULL)
> +				of_stdout_options++;
> +		}

Not so good. The ':' should actually be a generic part of
of_find_node_by_path(), it doesn't have to be limited to stdout parsing.
There are other places that would use it. I would add a second,
optional, argument to of_find_node_by_path() that will update a pointer
to the arguments after the ':'.

g.

>  	}
>  
>  	if (!of_aliases)
> @@ -1957,7 +1966,7 @@ bool of_console_check(struct device_node *dn, char *name, int index)
>  {
>  	if (!dn || dn != of_stdout || console_set_on_cmdline)
>  		return false;
> -	return !add_preferred_console(name, index, NULL);
> +	return !add_preferred_console(name, index, of_stdout_options);
>  }
>  EXPORT_SYMBOL_GPL(of_console_check);
>  
> -- 
> 1.9.1
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
