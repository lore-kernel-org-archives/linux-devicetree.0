From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2 v2] of/platform: Use platform_device interface
Date: Thu, 4 Jun 2015 10:48:37 +0200
Message-ID: <CAPybu_0xjwExa4=6soyF=Uad6yxiFaCnO32FY5h7YLfg-SMovg@mail.gmail.com>
References: <1429604702-14157-1-git-send-email-ricardo.ribalda@gmail.com>
 <1429604702-14157-2-git-send-email-ricardo.ribalda@gmail.com>
 <CAL_Jsq+ux9aCNUNVH+Vwy_j9oeV0CLbruPN4arkuCBPxvgrzhw@mail.gmail.com>
 <CAPybu_0C=iAGY9cFgxOt7YgCRG+xvKo1YBJfWent5+xord-xmg@mail.gmail.com>
 <CAL_JsqKV-+A196XaiGTGdx6tr1DStWYca5JnHR-QgBbMUyOiRA@mail.gmail.com> <20150604052536.DA31EC40548@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150604052536.DA31EC40548-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jakub Sitnicki <jsitnicki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Travis <travis-sJ/iWh9BUns@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Grant

On Thu, Jun 4, 2015 at 7:25 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

>
> I think I tried that too and then ran in to a problem where drivers will
> fail if a different device 'owns' the resource.
>
> For example, if device-a and device-b have overlapping regions, device-a
> gets registered first and claims the region. device-b tries to claim the
> region, fails, but is allowed to continue anyway. When driver-b tries to
> bind to device-b, and does a request_resource(), it will fail because
> device-a already owns it. I don't have a good solution for that other
> than to completely disable insert_resource() when using devicetree.

If someone is following this conversation I have already replied in

[PATCH v5 2/4] base/platform: Continue on insert_resource() error

Message-ID: <CAPybu_3gYAZTHHYD7y2MdKFJBwDVyb5a9fwQqEMc+0xmKSTpKg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>

Regards!

>
> g.



-- 
Ricardo Ribalda
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
