From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: return of_get_cpu_node from of_cpu_device_node_get
 if CPUs are not registered
Date: Mon, 21 Aug 2017 12:20:39 -0500
Message-ID: <20170821172039.jltg7kncl5z7q2jx@rob-hp-laptop>
References: <1500904513-10483-1-git-send-email-sudeep.holla@arm.com>
 <CAL_JsqLQBJL11XzmvSyD61syHKQKmzBVuUupo_Ctupaj8nxvVg@mail.gmail.com>
 <75ed0ec4-2276-c098-f7d4-7d9ce168f10c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <75ed0ec4-2276-c098-f7d4-7d9ce168f10c-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 24, 2017 at 05:32:21PM +0100, Sudeep Holla wrote:
> 
> 
> On 24/07/17 17:00, Rob Herring wrote:
> > On Mon, Jul 24, 2017 at 8:55 AM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
> >> Instead of the callsites choosing between of_cpu_device_node_get if the
> >> CPUs are registered as of_node is populated by then and of_get_cpu_node
> >> when the CPUs are not yet registered as CPU of_nodes are not yet stashed
> >> thereby needing to parse the device tree, we can call of_get_cpu_node
> >> in case the CPUs are not yet registered.
> >>
> >> This will allow to use of_cpu_device_node_get anywhere hiding the
> >> details from the caller.
> >>
> >> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> >> ---
> >>  include/linux/of_device.h | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> Hi Rob,
> >>
> >> Let me know if you are OK with this change. I keep seeing different
> >> drivers calling of_get_cpu_node or of_cpu_device_node_get based on what
> >> they are aware of or copying from other place without knowing the
> >> details. I am trying to avoid that and ask to use of_cpu_device_node_get
> >> at all places instead.
> > 
> > Seems fine to me.
> > 
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > 
> 
> Thanks. Can you take it through your tree itself ? I can make any follow
> patches(if any) once this lands in the tree. I don't have any for now
> just to avoid all cross dependencies.

Done.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
