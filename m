From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 2/2] of: add initcall with match boilerplate helpers
Date: Wed, 27 Nov 2013 15:22:44 +0000
Message-ID: <20131127152244.410F2C404EC@trevor.secretlab.ca>
References: <1383113571-13029-1-git-send-email-robherring2@gmail.com> < 1383113571-13029-3-git-send-email-robherring2@gmail.com> <20131121125007. 17A8FC40A2C@trevor.secretlab.ca> < CAL_JsqKHZtidrzJPH+c-zyFUQNsxtEKxOYg+Nzyo9JYNDNexug@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKHZtidrzJPH+c-zyFUQNsxtEKxOYg+Nzyo9JYNDNexug-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 21 Nov 2013 17:23:14 -0600, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Nov 21, 2013 at 6:50 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Wed, 30 Oct 2013 01:12:51 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> >>
> >> Add boilerplate helpers to create initcalls which are conditional on
> >> matching on devicetree properties.
> >>
> >> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> >> ---
> >>  include/linux/of.h | 12 ++++++++++++
> >>  1 file changed, 12 insertions(+)
> >>
> >> diff --git a/include/linux/of.h b/include/linux/of.h
> >> index f95aee3..a1327c9 100644
> >> --- a/include/linux/of.h
> >> +++ b/include/linux/of.h
> >> @@ -592,6 +592,18 @@ static inline int of_property_read_u32(const struct device_node *np,
> >>               s;                                              \
> >>               s = of_prop_next_string(prop, s))
> >>
> >> +#define of_initcall_match(__func, __lvl, __match) \
> >> +static int __init __func##_init(void) \
> >> +{ \
> >> +     if (of_find_matching_node(NULL, __match)) \
> >> +             return __func(); \
> >> +     else \
> >> +             return -ENODEV; \
> >> +} \
> >> +__lvl(__func##_init);
> >> +
> >> +#define of_module_init_match(__func, __match) of_initcall_match(__func, module_init, __match)
> >> +
> >
> > I'm not sure why this is necessary. I don't particularly have a problem
> > with it, but I wouldn't normally try to filter out device drivers when
> > the probe code simply won't get called.
> >
> > Considering it's paired with the previous patch that creates devices in
> > the module init call, I'm assuming it is to support that use case. If so
> > then I don't think it is a good idea. If there is another use case then
> > maybe.
> 
> This is for cases that are not drivers. Again, the motivation is how
> do I do initialization on arm64 where there is not already some
> conditional initialization hook. My approach to solve this is by
> eliminating the machine_desc for highbank. While I don't really have a
> need to do this on highbank itself, I do have a need for some of the
> same functions present in mach-highbank for arm64.
> 
> I realized quickly going down this path that I would have a repeated
> pattern and that there's already a few other examples in the kernel of
> something like this:
> 
> static int __init some_initcall(void)
> {
>   if (of_machine_is_compatible("my-awesume-board"))
>     return -ENODEV;
> 
>   /* do some init stuff... */
> }
> 
> There are some examples using this here [1][2].

It's still kind of a nasty pattern. I'd like to limit the use of this as
much as possible and I'd like to make it as easy as possible to discover
where things are coming from at boot. That's one of the things I like
about machine_desc. It is a common entry point for SoC family specific
behaviour.

As for device drivers, the preferred model is to bind against something
already registered. If it is not present, then it does nothing. To me
there is a difference between making the behavour conditional on
something that was registered vs. an arbitrary value in the device tree.
The triggers for the former are exported in /dev/devices. The latter is
'magic'.  :-)

The problem with "if (of_machine_is_compatible())" initcalls is they are
an exception to the normal flow of things. You have to go searching for
specific strings to find out if they are getting called.

I'm possibly splitting hairs here, but a big part of migration to the
Linux device model is getting rid of modules that both register a device
and then bind to it.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
