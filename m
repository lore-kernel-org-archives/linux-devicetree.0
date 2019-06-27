From: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 01/18] kunit: test: add KUnit test runner core
Date: Thu, 27 Jun 2019 11:16:35 -0700
Message-ID: <20190627181636.5EA752064A@mail.kernel.org>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-2-brendanhiggins@google.com>
 <20190620001526.93426218BE@mail.kernel.org>
 <CAFd5g46Jhxsz6_VXHEVYvTeDRwwzgKpr=aUWLL5b3S4kUukb8g@mail.gmail.com>
 <20190626034100.B238520883@mail.kernel.org>
 <CAFd5g46zHAupdUh3wDuqPJti2M+_=oje_5weFe7AVLQfkDDM6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CAFd5g46zHAupdUh3wDuqPJti2M+_=oje_5weFe7AVLQfkDDM6A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

Quoting Brendan Higgins (2019-06-26 16:00:40)
> On Tue, Jun 25, 2019 at 8:41 PM Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> 
> > scenario like below, but where it is a problem. There could be three
> > CPUs, or even one CPU and three threads if you want to describe the
> > extra thread scenario.
> >
> > Here's my scenario where it isn't needed:
> >
> >     CPU0                                      CPU1
> >     ----                                      ----
> >     kunit_run_test(&test)
> >                                               test_case_func()
> >                                                 ....
> >                                               [mock hardirq]
> >                                                 kunit_set_success(&test)
> >                                               [hardirq ends]
> >                                                 ...
> >                                                 complete(&test_done)
> >       wait_for_completion(&test_done)
> >       kunit_get_success(&test)
> >
> > We don't need to care about having locking here because success or
> > failure only happens in one place and it's synchronized with the
> > completion.
> 
> Here is the scenario I am concerned about:
> 
> CPU0                      CPU1                       CPU2
> ----                      ----                       ----
> kunit_run_test(&test)
>                           test_case_func()
>                             ....
>                             schedule_work(foo_func)
>                           [mock hardirq]             foo_func()
>                             ...                        ...
>                             kunit_set_success(false)   kunit_set_success(false)
>                           [hardirq ends]               ...
>                             ...
>                             complete(&test_done)
>   wait_for_completion(...)
>   kunit_get_success(&test)
> 
> In my scenario, since both CPU1 and CPU2 update the success status of
> the test simultaneously, even though they are setting it to the same
> value. If my understanding is correct, this could result in a
> write-tear on some architectures in some circumstances. I suppose we
> could just make it an atomic boolean, but I figured locking is also
> fine, and generally preferred.

This is what we have WRITE_ONCE() and READ_ONCE() for. Maybe you could
just use that in the getter and setters and remove the lock if it isn't
used for anything else.

It may also be a good idea to have a kunit_fail_test() API that fails
the test passed in with a WRITE_ONCE(false). Otherwise, the test is
assumed successful and it isn't even possible for a test to change the
state from failure to success due to a logical error because the API
isn't available. Then we don't really need to have a generic
kunit_set_success() function at all. We could have a kunit_test_failed()
function too that replaces the kunit_get_success() function. That would
read better in an if condition.

> 
> Also, to be clear, I am onboard with dropping then IRQ stuff for now.
> I am fine moving to a mutex for the time being.
> 

Ok.
