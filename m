From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] of/platform: Mark all device tree resources as
 SHARED
Date: Sun, 07 Jun 2015 15:01:37 +0100
Message-ID: <20150607140138.026C4C412C8@trevor.secretlab.ca>
References: <1433501478-15164-1-git-send-email-ricardo.ribalda@gmail.com>
	<1433501478-15164-2-git-send-email-ricardo.ribalda@gmail.com>
	<CAL_JsqLOqpP4E5mG5t5RvaTs96jLC=umY2cUQEhyZiWJNOt1nQ@mail.gmail.com>
	<CAPybu_0s=9yTFH5jngh6=Zuz0iia0F1RU6AsLi-vcWNrF3-qYg@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPybu_0s=9yTFH5jngh6=Zuz0iia0F1RU6AsLi-vcWNrF3-qYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jakub Sitnicki <jsitnicki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Travis <travis-sJ/iWh9BUns@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Cliff Wickman <cpw-sJ/iWh9BUns@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 5 Jun 2015 18:51:36 +0200
, Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 wrote:
> Hello Rob,
> 
> Thanks for your feedback!
> 
> On Fri, Jun 5, 2015 at 6:45 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Fri, Jun 5, 2015 at 5:51 AM, Ricardo Ribalda Delgado
> > <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> Some device tree platform do not define their resources properly. i.e.
> >> overlapping or repeated resources.
> >>
> >> This patch mark all device tree resources as shareable.
> >>
> >> In the future this should only be set for the platforms that have
> >> problems.
> >
> > I don't think we want to do this globally. This should be very rare
> > and we want to discourage any new cases.
> 
> I just wanted to mimic the original behaviour. Unfortunately I have no
> idea of what platform is broken.  Grant needs to help us here :)

I know of powerpc platforms that split the ethernet and mdio controllers
into separate nodes, even though they share a register block. Those ones
are broken (ie. mpc5200). I know there are ARM platforms that exhibited
the same behaviour, but I can't remember specifics at the moment.

> What do you think about the new flag? Does it make any sense for you?

I think I have another solution to the whole problem. IIUC, the problem
is the kernel crashes on unregistering resources. I've got a patch that
doesn't try to unregister resources that weren't registered in the first
place. It doesn't fix the problem of DT not registering the resources in
the first place, but it makes the unregister path safe.

I'll cc: you on the patch series.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
