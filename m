From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/5] of/platform: Generalize /reserved-memory handling
Date: Thu, 3 Aug 2017 16:33:34 -0700
Message-ID: <20170803233334.GC29306@minitux>
References: <20170803025754.19101-1-bjorn.andersson@linaro.org>
 <20170803025754.19101-2-bjorn.andersson@linaro.org>
 <CAL_JsqKBre5yPJHG3s+8Y7_hgj0_r35nNZc3QiL4HbWLuFx=Bg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKBre5yPJHG3s+8Y7_hgj0_r35nNZc3QiL4HbWLuFx=Bg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu 03 Aug 10:40 PDT 2017, Rob Herring wrote:

> On Wed, Aug 2, 2017 at 9:57 PM, Bjorn Andersson
> <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > diff --git a/drivers/of/platform.c b/drivers/of/platform.c
[..]
> > +       rmem_nodes = of_find_node_by_path("/reserved-memory");
> > +       for_each_available_child_of_node(rmem_nodes, node) {
> > +               ret = of_device_compatible_match(node, rmem_compats);
> > +               if (ret)
> 
> I would just do:
> 
> for_each_matching_node(node, ...)
>     of_platform_device_create(node, NULL, NULL);
> 
> I don't think the kernel has to validate that ramoops and any others
> we add are children of /reserved-memory. We should only have those
> compatibles located there and any other location would be an error.
> 

Okay, looks reasonable.

Will update and resend once I know your decision on 2/5.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
