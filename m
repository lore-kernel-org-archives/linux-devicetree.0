From: David Laight <David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org>
Subject: RE: [PATCH 3/4] powerpc: pseries: only store the device node
 basename in full_name
Date: Wed, 26 Jul 2017 10:07:01 +0000
Message-ID: <063D6719AE5E284EB5DD2968C1650D6DD00419B2@AcuExch.aculab.com>
References: <20170725214427.25768-1-robh@kernel.org>
 <20170725214427.25768-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170725214427.25768-4-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Rob Herring' <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring
> Sent: 25 July 2017 22:44
> With dependencies on full_name containing the entire device node path
> removed, stop storing the full_name in nodes created by
> dlpar_configure_connector() and pSeries_reconfig_add_node().
...
>	dn = kzalloc(sizeof(*dn), GFP_KERNEL);
> 	if (!dn)
> 		return NULL;
> 
> 	name = (char *)ccwa + be32_to_cpu(ccwa->name_offset);
> -	dn->full_name = kasprintf(GFP_KERNEL, "%s/%s", path, name);
> +	dn->full_name = kasprintf(GFP_KERNEL, "%s", name);

Isn't this just strdup()?
Perhaps you should rename full_name to name - since it is no longer 'full'?

Maybe you could do a single malloc() for both 'dn' and the name?

	David

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
