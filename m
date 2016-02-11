From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] of: resolver: Add missing of_node_get and of_node_put
Date: Thu, 11 Feb 2016 17:18:43 -0600
Message-ID: <CAL_JsqLSHrJWNJijv2Y1ZsXVa98PVBhg2kHn+t_eoH90GDLGAA@mail.gmail.com>
References: <20160203180901.GA27874@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160203180901.GA27874@amitoj-Inspiron-3542>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 3, 2016 at 12:09 PM, Amitoj Kaur Chawla
<amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> In __of_find_node_by_full_name, add an of_node_get when detecting the
> desired element, to ensure that it ends up with a reference count that is
> one greater than on entering the function.
>
> Also in __of_find_node_by_full_name, add an of_node_put on breaking
> out of the for_each_child_of_node loop, to ensure that the reference
> count of the returned value is not double incremented. This change
> was made using Coccinelle.

Pantelis, are you convinced this is correct (albeit somewhat pointless)?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
