From: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v12 05/18] kunit: test: add the concept of expectations
Date: Mon, 12 Aug 2019 17:33:52 -0700
Message-ID: <20190813003352.GA235915@google.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-6-brendanhiggins@google.com>
 <20190812235701.533E82063F@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190812235701.533E82063F-+nuXSHJNwjE76Z2rM5mHXA@public.gmane.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: pmladek-IBi9RG/b67k@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, amir73il-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alexander.Levin-0li6OtcxBFHby3iVrkZq2A@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, knut.omang-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, wfg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jdike-OPE4K8JWMJJBDgjK7y7TUQ@public.gmane.org, dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tim.Bird-7U/KSKJipcs@public.gmane.org, linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, julia.lawall-L2FTfq7BK8M@public.gmane.org, jpoimboe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, kunit-dev-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, tytso-3s7WtUTddSA@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mcgrof-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khil
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 04:57:00PM -0700, Stephen Boyd wrote:
> Quoting Brendan Higgins (2019-08-12 11:24:08)
> > Add support for expectations, which allow properties to be specified and
> > then verified in tests.
> > 
> > Signed-off-by: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> > Reviewed-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> > Reviewed-by: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
> 
> Reviewed-by: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> Just some minor nits again.
> 
> > diff --git a/include/kunit/test.h b/include/kunit/test.h
> > index d0bf112910caf..2625bcfeb19ac 100644
> > --- a/include/kunit/test.h
> > +++ b/include/kunit/test.h
> > @@ -9,8 +9,10 @@
> >  #ifndef _KUNIT_TEST_H
> >  #define _KUNIT_TEST_H
> >  
> > +#include <linux/kernel.h>
> >  #include <linux/types.h>
> >  #include <linux/slab.h>
> > +#include <kunit/assert.h>
> 
> Can you alphabet sort these?

Sure. Will fix.

> >  
> >  struct kunit_resource;
> >  
> > @@ -319,4 +321,845 @@ void __printf(3, 4) kunit_printk(const char *level,
> >  #define kunit_err(test, fmt, ...) \
> >                 kunit_printk(KERN_ERR, test, fmt, ##__VA_ARGS__)
> >  
> > +/*
> > + * Generates a compile-time warning in case of comparing incompatible types.
> > + */
> > +#define __kunit_typecheck(lhs, rhs) \
> > +       ((void) __typecheck(lhs, rhs))
> 
> Is there a reason why this can't be inlined and the __kunit_typecheck()
> macro can't be removed?

No real reason anymore. I used it in multiple places before and we
weren't sure if we wanted to stick with the warnings that __typecheck
produces long term, but now that it is only used in one place, I guess
that doesn't make sense anymore. Will fix.

> > +
> > +/**
> > + * KUNIT_SUCCEED() - A no-op expectation. Only exists for code clarity.
> > + * @test: The test context object.
> [...]
> > + * @condition: an arbitrary boolean expression. The test fails when this does
> > + * not evaluate to true.
> > + *
> > + * This and expectations of the form `KUNIT_EXPECT_*` will cause the test case
> > + * to fail when the specified condition is not met; however, it will not prevent
> > + * the test case from continuing to run; this is otherwise known as an
> > + * *expectation failure*.
> > + */
> > +#define KUNIT_EXPECT_TRUE(test, condition) \
> > +               KUNIT_TRUE_ASSERTION(test, KUNIT_EXPECTATION, condition)
> 
> A lot of these macros seem double indented.

In a case you pointed out in the preceding patch, I was just keeping the
arguments column aligned.

In this case I am just indenting two tabs for a line continuation. I
thought I found other instances in the kernel that did this early on
(and that's also what the Linux kernel vim plugin wanted me to do).
After a couple of spot checks, it seems like one tab for this kind of
line continuation seems more common. I personally don't feel strongly
about any particular version. I just want to know now what the correct
indentation is for macros before I go through and change them all.

I think there are three cases:

#define macro0(param0, param1) \
		a_really_long_macro(...)

In this first case, I use two tabs for the first indent, I think you are
telling me this should be one tab.

#define macro1(param0, param1) {					       \
	statement_in_a_block0;						       \
	statement_in_a_block1;						       \
	...								       \
}

In this case, every line is in a block and is indented as it would be in
a function body. I think you are okay with this, and now that I am
thinking about it, what I think you are proposing for macro0 will make
these two cases more consistent.

#define macro2(param0,							       \
	       param1,							       \
	       param2,							       \
	       param3,							       \
	       ...,							       \
	       paramn) ...						       \

In this last case, the body would be indented as in macro0, or macro1,
but the parameters passed into the macro are column aligned, consistent
with one of the acceptable ways of formatting function parameters that
don't fit on a single line.

In all cases, I put 1 space in between the closing parameter paren and
the line continuation `\`, if only one `\` is needed. Otherwise, I align
all the `\s` to the 80th column. Is this okay, or would you prefer that
I align them all to the 80th column, or something else?

> > +
> > +#define KUNIT_EXPECT_TRUE_MSG(test, condition, fmt, ...)                      \
> > +               KUNIT_TRUE_MSG_ASSERTION(test,                                 \
> > +                                        KUNIT_EXPECTATION,                    \
> > +                                        condition,                            \
> > +                                        fmt,                                  \
> > +                                        ##__VA_ARGS__)
> > +
