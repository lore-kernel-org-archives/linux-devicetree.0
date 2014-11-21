From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/8] of: Use vargs in __of_node_alloc
Date: Thu, 20 Nov 2014 17:43:05 -0800
Message-ID: <1416534185.6651.30.camel@perches.com>
References: <1416533715-9758-1-git-send-email-grant.likely@linaro.org>
	 <1416533715-9758-2-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416533715-9758-2-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2014-11-21 at 01:35 +0000, Grant Likely wrote:
> The overlay code needs to construct a new full_name from the parent name
> and the node name, but the current method has to allocate and then free
> an temporary string which is wasteful. Fix this problem by using vargs
> to pass in a format and arguments into __of_node_alloc().
[]
> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
[]
> @@ -61,7 +61,7 @@ static inline int of_property_notify(int action, struct device_node *np,
>   * own the devtree lock or work on detached trees only.
>   */
>  struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags);
> -struct device_node *__of_node_alloc(const char *full_name, gfp_t allocflags);

Please add

__printf(1, 2)
> +struct device_node *__of_node_alloc(const char *fmt, ...);


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
