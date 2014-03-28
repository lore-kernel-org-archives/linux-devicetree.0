From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [RFC 2/5] of: Create of_console_check() for selecting a console
 specified in /chosen
Date: Fri, 28 Mar 2014 11:38:36 -0700
Message-ID: <20140328183836.GA25241@quad.lixom.net>
References: <1396022885-6102-1-git-send-email-grant.likely@linaro.org>
 <1396022885-6102-3-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1396022885-6102-3-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Mar 28, 2014 at 09:08:02AM -0700, Grant Likely wrote:
> The devicetree has a binding for specifying the console device in the
> /chosen node, but the kernel doesn't use it consistently. This change
> adds an API for testing if a device node is a console, and adds a
> preferred console entry if it is.
> 
> At the same time this patch removes the of_device_is_stdout_path() API
> since it is unused.
> 
> Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/of/base.c  | 23 +++++++++++++----------
>  include/linux/of.h |  6 +++---
>  2 files changed, 16 insertions(+), 13 deletions(-)

[...]

> diff --git a/include/linux/of.h b/include/linux/of.h
> index a8b9dad90c64..417945ebd8e1 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -343,7 +343,7 @@ const __be32 *of_prop_next_u32(struct property *prop, const __be32 *cur,
>   */
>  const char *of_prop_next_string(struct property *prop, const char *cur);
>  
> -int of_device_is_stdout_path(struct device_node *dn);
> +bool of_console_check(struct device_node *dn, char *name, int index);
>  
>  #else /* CONFIG_OF */
>  
> @@ -544,9 +544,9 @@ static inline int of_machine_is_compatible(const char *compat)
>  	return 0;
>  }
>  
> -static inline int of_device_is_stdout_path(struct device_node *dn)
> +static bool of_console_check(const struct device_node *dn, const char *name, int index)

static inline or you'll get warnings about unused functions.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
