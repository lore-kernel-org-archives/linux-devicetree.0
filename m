From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/4] kernel/resource: Invalid memory access in __release_resource
Date: Thu, 23 Apr 2015 10:06:36 +0200
Message-ID: <CAPybu_2rTee+cJvFXNwoovHGywEf1CM3j_JMVaSy_nxj8uNS1g@mail.gmail.com>
References: <1429719261-18024-1-git-send-email-ricardo.ribalda@gmail.com>
 <1429719261-18024-2-git-send-email-ricardo.ribalda@gmail.com> <20150422164701.GJ20701@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150422164701.GJ20701-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jakub Sitnicki <jsitnicki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mike Travis <travis-sJ/iWh9BUns@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Bjorn

On Wed, Apr 22, 2015 at 6:47 PM, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:

>
> I'm not really a fan of this.  The NULL pointer oops is a very good clue
> all by itself, and it doesn't require any extra code here.

It is a pointer to 0x30.

For some reason my platform can handle a couple of oops, but if I get
a fair amount of them in a short period of time, the whole thing
crashes and debugging gets complicated. (no access to dmesg or remote
debugging).

Therefore this particular bug gave me a bad time. Now that we have
located the root of the problem and solved the problem from the root,
this particular error will never be hit. I just wanted to save
somebody else's time with this patch.

All that said, if the other patches are applied, my platform works
completely fine. So it is completely your call to accept this or not
:)

I will resend the patchset without this patch

Thanks!
-- 
Ricardo Ribalda
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
