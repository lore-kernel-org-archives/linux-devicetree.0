From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Enabling OF selftest to run without machine's
 devicetree
Date: Tue, 12 Aug 2014 11:21:00 +0100
Message-ID: <20140812102100.448C6C404A6@trevor.secretlab.ca>
References: <1406404130-27289-1-git-send-email-gaurav.minocha.os@gmail.com>
	<CAL_JsqJXqoyCRcMdS83zPr7prY52GgbAd1y+tgVn5f6Q+=CwxQ@mail.gmail.com>
	<CA+rpMb+pPZykJ7-XurVSSOaTPGNji9zG7FtVB+m6-gNiOHM4Jw@mail.gmail.com>
	<CA+rpMbJmCQ7YfJ7c+hjOmdfAdTHtTuH34mEWGH9Xo=rYJFDgKg@mail.gmail.com>
	<CAL_JsqKG2a=8zvRfjuP_VEM_+W8wfnmjK8PUqW6w_cZsA7dvDQ@mail.gmail.com>
	<CA+rpMbJiR+NVRUFr6x67QZWXx0GMtLAZkmmQHLA5KDX6jkKSbQ@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+rpMbJiR+NVRUFr6x67QZWXx0GMtLAZkmmQHLA5KDX6jkKSbQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 28 Jul 2014 08:16:25 -0700, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Jul 28, 2014 at 8:00 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Sun, Jul 27, 2014 at 10:28 PM, Gaurav Minocha
> > <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> On Sat, Jul 26, 2014 at 3:17 PM, Gaurav Minocha
> >> <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>> On Sat, Jul 26, 2014 at 2:11 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>>> On Sat, Jul 26, 2014 at 2:48 PM, Gaurav Minocha
> >>>> <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>>>> If there is no devicetree present, this patch adds the selftest
> >>>>> data as a live devicetree. It also removes the same after the
> >>>>> testcase execution is complete.
> >
> > [...]
> >
> >>>>> @@ -614,10 +616,31 @@ static int __init selftest_data_add(void)
> >>>>>                         "not running tests\n", __func__);
> >>>>>                 return -ENOMEM;
> >>>>>         }
> >>>>> -       of_fdt_unflatten_tree(selftest_data, &selftest_data_node);
> >>>>
> >>>> Can't you keep this factored out and just do "of_allnodes =
> >>>> selftest_data_node;"?
> >>>>
> >>> I tried to do that in first place, but of_alias_scan() called from
> >>> of_fdt_unflatten_tree(..)
> >>> needs of_allnodes. So, had to call it separately.
> >
> > No, it is not or I'm missing some change. Or it is a bug? It is called
> > from unflatten_device_tree which is the early boot version.
> >
> So, there are two functions unflatten_device_tree and of_fdt_unflatten_tree.
> In of_fdt_unflatten_tree, I added a call to of_alias_scan().
> Yes, unflatten_device_tree is the early boot version it already
> calls of_alias_scan().
> 
> I myself was in doubt to call of_alias_scan from of_fdt_unflatten_tree.
> Though it works fine, may be I'm not aware of a testcase in
> which it might fail. So, calling explicitly in another option as
> mentioned earlier.

Calling it from of_fdt_unflatten_tree() causes problems. That function
is intended to allow a flat tree to be processed without yet making any
part of it visible to the rest of the kernel. Calling of_alias_scan()
from there could end up adding entries to the global alias cache. To
begin with it means alias entries would point at unattached nodes, and
if the unflattened tree gets freed again later then it will cause the
kernel to oops if a driver tries to dereference it.

This is also a problem for the selftest code because the tree data is
removed after all the tests have been executed. Anything added to the
aliases cache needs to be undone before exiting the selftest module.

I've made a number of fixups to the patch to get it working with my
current tree (there were some conflicts with the overlay changes) and to
fix some problems. I'll send you my fixups in separate emails.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
