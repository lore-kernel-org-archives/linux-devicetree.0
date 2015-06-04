From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 2/4] base/platform: Continue on insert_resource() error
Date: Thu, 4 Jun 2015 10:47:07 +0200
Message-ID: <CAPybu_3gYAZTHHYD7y2MdKFJBwDVyb5a9fwQqEMc+0xmKSTpKg@mail.gmail.com>
References: <1432625486-15442-1-git-send-email-ricardo.ribalda@gmail.com>
 <1432625486-15442-3-git-send-email-ricardo.ribalda@gmail.com> <20150604075425.BC0E7C406CA@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150604075425.BC0E7C406CA-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jakub Sitnicki <jsitnicki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mike Travis <travis-sJ/iWh9BUns@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Grant

On Thu, Jun 4, 2015 at 9:54 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

>
> I'm pretty sure this is going to break some platforms. I described it in
> my earlier email today, but I'll summarize here too since this is the
> latest patch set.


The version that is in stable is also broken. Unloading the device
tree crashes the device completely.

>
> Making this change allows the registration of devices to continue, but
> it will still break device drivers that do a request_resource() on a
> region that another device managed to claim with insert_resource(). The
> only way around this is to not do insert_resource() at all, or to remove
> the request_resource() from all drivers (not feasible).

If we do not do insert_resource(), we will have the crash on
release_resource() and a lot! of code duplication.

>
> I think we have to deal with it by making resource insertion optional.
> I'd like to make the default be to do the insertion, and be able to
> blacklist platforms that have issues.

What about, making the request_resource a little bit more clever.
Something like:

If the resouce is not taken
     return ok

if the resource is taken:
  If the requester or the current owner of the resource are device tree devices
               show a warning and continue.
  else
                return error


Wouldn't this fix the issue and guide the developers towards a proper
fix for their platform, instead of just encourage them to blacklist
their platform?


Thanks!


>
> g.
>



-- 
Ricardo Ribalda
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
