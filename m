From: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 01/18] kunit: test: add KUnit test runner core
Date: Tue, 25 Jun 2019 20:40:59 -0700
Message-ID: <20190626034100.B238520883@mail.kernel.org>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-2-brendanhiggins@google.com>
 <20190620001526.93426218BE@mail.kernel.org>
 <CAFd5g46Jhxsz6_VXHEVYvTeDRwwzgKpr=aUWLL5b3S4kUukb8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CAFd5g46Jhxsz6_VXHEVYvTeDRwwzgKpr=aUWLL5b3S4kUukb8g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>, "open list:DOCUMENTATION" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Amir Goldstein <amir73il-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Sasha Levin <Alexander.Levin-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, shuah <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-nvdimm <linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Knut Omang <knut.omang-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, wfg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jeff Dike <jdike-OPE4K8JWMJJBDgjK7y7TUQ@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kbuild <linux-kbuild-u79uwXL29TasMV2rI37PzA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Quoting Brendan Higgins (2019-06-25 13:28:25)
> On Wed, Jun 19, 2019 at 5:15 PM Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >
> > Quoting Brendan Higgins (2019-06-17 01:25:56)
> > > diff --git a/kunit/test.c b/kunit/test.c
> > > new file mode 100644
> > > index 0000000000000..d05d254f1521f
> > > --- /dev/null
> > > +++ b/kunit/test.c
> > > @@ -0,0 +1,210 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Base unit test (KUnit) API.
> > > + *
> > > + * Copyright (C) 2019, Google LLC.
> > > + * Author: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> > > + */
> > > +
> > > +#include <linux/sched/debug.h>
> > > +#include <kunit/test.h>
> > > +
> > > +static bool kunit_get_success(struct kunit *test)
> > > +{
> > > +       unsigned long flags;
> > > +       bool success;
> > > +
> > > +       spin_lock_irqsave(&test->lock, flags);
> > > +       success = test->success;
> > > +       spin_unlock_irqrestore(&test->lock, flags);
> >
> > I still don't understand the locking scheme in this code. Is the
> > intention to make getter and setter APIs that are "safe" by adding in a
> > spinlock that is held around getting and setting various members in the
> > kunit structure?
> 
> Yes, your understanding is correct. It is possible for a user to write
> a test such that certain elements may be updated in different threads;
> this would most likely happen in the case where someone wants to make
> an assertion or an expectation in a thread created by a piece of code
> under test. Although this should generally be avoided, it is possible,
> and there are occasionally good reasons to do so, so it is
> functionality that we should support.
> 
> Do you think I should add a comment to this effect?

No, I think the locking should be removed.

> 
> > In what situation is there more than one thread reading or writing the
> > kunit struct? Isn't it only a single process that is going to be
> 
> As I said above, it is possible that the code under test may spawn a
> new thread that may make an expectation or an assertion. It is not a
> super common use case, but it is possible.

Sure, sounds super possible and OK.

> 
> > operating on this structure? And why do we need to disable irqs? Are we
> > expecting to be modifying the unit tests from irq contexts?
> 
> There are instances where someone may want to test a driver which has
> an interrupt handler in it. I actually have (not the greatest) example
> here. Now in these cases, I expect someone to use a mock irqchip or
> some other fake mechanism to trigger the interrupt handler and not
> actual hardware; technically speaking in this case, it is not going to
> be accessed from a "real" irq context; however, the code under test
> should think that it is in an irq context; given that, I figured it is
> best to just treat it as a real irq context. Does that make sense?

Can you please describe the scenario in which grabbing the lock here,
updating a single variable, and then releasing the lock right after
does anything useful vs. not having the lock? I'm looking for a two CPU
scenario like below, but where it is a problem. There could be three
CPUs, or even one CPU and three threads if you want to describe the
extra thread scenario.

Here's my scenario where it isn't needed:

    CPU0                                      CPU1
    ----                                      ----
    kunit_run_test(&test)
                                              test_case_func()
					        ....
                                              [mock hardirq]
					        kunit_set_success(&test)
					      [hardirq ends]
                                                ...
                                                complete(&test_done)
      wait_for_completion(&test_done)
      kunit_get_success(&test)

We don't need to care about having locking here because success or
failure only happens in one place and it's synchronized with the
completion.

> 
> > > +
> > > +       return success;
> > > +}
> > > +
> > > +static void kunit_set_success(struct kunit *test, bool success)
> > > +{
> > > +       unsigned long flags;
> > > +
> > > +       spin_lock_irqsave(&test->lock, flags);
> > > +       test->success = success;
> > > +       spin_unlock_irqrestore(&test->lock, flags);
> > > +}
