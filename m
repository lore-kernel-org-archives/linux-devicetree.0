From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH V2] panic: add support to update panic_timeout via DT
Date: Fri, 27 Oct 2017 13:00:06 +0100
Message-ID: <20171027115957.GA32605@red-moon>
References: <1509097165-15695-1-git-send-email-jburman@nvidia.com>
 <20171027095314.GA724@tigerII.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171027095314.GA724-doRD9GlggSwB9AHHLWeGtNQXobZC6xk2@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergey Senozhatsky <sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jeetesh Burman <jburman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

[+devicetree, Rob, Frank]

On Fri, Oct 27, 2017 at 06:53:14PM +0900, Sergey Senozhatsky wrote:
> Cc-ing Andrew on this
> 
> 
> v1: lkml.kernel.org/r/1509076662-22253-1-git-send-email-jburman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
>     lkml.kernel.org/r/20171027080006.GA609-doRD9GlggSwB9AHHLWeGtNQXobZC6xk2@public.gmane.org
> 
> v2: lkml.kernel.org/r/1509097165-15695-1-git-send-email-jburman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> 
> 	-ss
> 
> On (10/27/17 15:09), Jeetesh Burman wrote:
> > Add support to set 'panic_timeout' value via dtb to have
> > control from device tree. This makes sense when you have
> > multiple platforms support from same defconfig and
> > differentiated only through device tree blob.
> > The patch will check for panic time out value coming
> > from dtb if it exists, otherwise continues with
> > defconfig provided option.

I will let Rob and Frank chime in - as far as I am concerned
you are (ab)using DT to configure a Linux kernel specific internal
variable and that's certainly not what DT is there for.

Lorenzo
 
> > Signed-off-by: Jeetesh Burman <jburman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  kernel/panic.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/kernel/panic.c b/kernel/panic.c
> > index bdd18af..b487331 100644
> > --- a/kernel/panic.c
> > +++ b/kernel/panic.c
> > @@ -27,6 +27,7 @@
> >  #include <linux/console.h>
> >  #include <linux/bug.h>
> >  #include <linux/ratelimit.h>
> > +#include <linux/of.h>
> >  
> >  #define PANIC_TIMER_STEP 100
> >  #define PANIC_BLINK_SPD 18
> > @@ -482,9 +483,15 @@ static u64 oops_id;
> >  
> >  static int init_oops_id(void)
> >  {
> > -	if (!oops_id)
> > +	struct device_node *np;
> > +
> > +	if (!oops_id) {
> > +		np = of_find_node_by_name(NULL, "panic_timeout");
> > +		if (np)
> > +			of_property_read_u32(np, "panic-timeout-value",
> > +							&panic_timeout);
> >  		get_random_bytes(&oops_id, sizeof(oops_id));
> > -	else
> > +	} else
> >  		oops_id++;
> >  
> >  	return 0;
> > -- 
> > 2.1.4
> > 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
