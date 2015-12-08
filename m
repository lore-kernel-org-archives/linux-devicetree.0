From: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [RESEND PATCH] modpost: don't add a trailing wildcard for OF
 module aliases
Date: Tue, 8 Dec 2015 15:11:49 -0800
Message-ID: <20151208151149.50ee68b41c5b9bc833eb0c2b@linux-foundation.org>
References: <1449612813-27004-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449612813-27004-1-git-send-email-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue,  8 Dec 2015 19:13:32 -0300 Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org> wrote:

> Commit ac551828993ee ("modpost: i2c aliases need no trailing wildcard")
> removed the wildcard at the end of the I2C module aliases because I2C
> devices have no IDs so the aliases are just arbitrary device names.
> 
> This is also true for OF modaliases since a compatible string is used
> to define a specific IP hardware block. So the modalias should match a
> specific compatible string and not attempt to match a compatible string
> whose name matches the beginning of another one.
> 
> For example, the following driver module:
> 
> $ modinfo cros_ec_keyb | grep alias
> alias:          platform:cros-ec-keyb
> alias:          of:N*T*Cgoogle,cros-ec-keyb*
> 
> will be tried to be loaded for an alias of:N*T*Cgoogle,cros-ec-keyb-v2
> but there could be a different driver that supports the device for that
> compatible string so it's better to remove the trailing wildcard for OF.
> 
> Also, remove the word "always" from the add_wildcard() function comment
> since that was carried from the time where a wildcard was always added
> at the end of the module alias for all the devices.
> 
> Suggested-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> Reviewed-by: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> 
> ---
> Hello,
> 
> I sent this patch before [0] but was never picked. MAINTAINERS doesn't
> say who should manage patches to file2alias so maybe I didn't add the
> right person to the cc list.

z:/usr/src/git26> perl scripts/get_maintainer.pl -f scripts/mod 
Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org> (commit_signer:18/27=67%)

> Documentation/development-process/5.Posting says that if there is no
> obvious maintainer, then Andrew Morton is often the patch target so
> I'm re-sending to him.

Yep.  If I don't handle the particular patch, I know who does ;)

> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -125,7 +125,7 @@ do {                                                            \
>                  sprintf(str + strlen(str), "*");                \
>  } while(0)
>  
> -/* Always end in a wildcard, for future extension */
> +/* End in a wildcard, for future extension */
>  static inline void add_wildcard(char *str)
>  {
>  	int len = strlen(str);
> @@ -704,7 +704,6 @@ static int do_of_entry (const char *filename, void *symval, char *alias)
>  		if (isspace (*tmp))
>  			*tmp = '_';
>  
> -	add_wildcard(alias);
>  	return 1;
>  }
>  ADD_TO_DEVTABLE("of", of_device_id, do_of_entry);
> -- 
> 2.4.3
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
