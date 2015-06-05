From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2 v2] of/platform: Use platform_device interface
Date: Fri, 5 Jun 2015 12:52:51 +0200
Message-ID: <CAPybu_1mKN9k-AyBYxnuSZWcbke+G6fDCYUZN==t8bnUMrWRHQ@mail.gmail.com>
References: <1429604702-14157-1-git-send-email-ricardo.ribalda@gmail.com>
 <1429604702-14157-2-git-send-email-ricardo.ribalda@gmail.com>
 <CAL_Jsq+ux9aCNUNVH+Vwy_j9oeV0CLbruPN4arkuCBPxvgrzhw@mail.gmail.com>
 <CAPybu_0C=iAGY9cFgxOt7YgCRG+xvKo1YBJfWent5+xord-xmg@mail.gmail.com>
 <CAL_JsqKV-+A196XaiGTGdx6tr1DStWYca5JnHR-QgBbMUyOiRA@mail.gmail.com>
 <20150604052536.DA31EC40548@trevor.secretlab.ca> <CAPybu_0xjwExa4=6soyF=Uad6yxiFaCnO32FY5h7YLfg-SMovg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPybu_0xjwExa4=6soyF=Uad6yxiFaCnO32FY5h7YLfg-SMovg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jakub Sitnicki <jsitnicki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Travis <travis-sJ/iWh9BUns@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Grant and Rob

Could you take a look to these two patches that I have just sent.

kernel/resource: Add new flag IORESOURCE_SHARED
of/platform: Mark all device tree resources as SHARED

I think it fixes Grant problem.


Regards!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
