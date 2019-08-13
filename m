From: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v12 03/18] kunit: test: add string_stream a std::stream
 like string builder
Date: Tue, 13 Aug 2019 02:12:54 -0700
Message-ID: <CAFd5g452+-6m1eiVK0ccTDkJ2wH8GBwxRDw5owwC8h3NscE1ag@mail.gmail.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-4-brendanhiggins@google.com>
 <20190812225520.5A67C206A2@mail.kernel.org>
 <20190812233336.GA224410@google.com>
 <20190812235940.100842063F@mail.kernel.org>
 <CAFd5g44xciLPBhH_J3zUcY3TedWTijdnWgF055qffF+dAguhPQ@mail.gmail.com>
 <20190813045623.F3D9520842@mail.kernel.org>
 <CAFd5g46PJNTOUAA4GOOrW==74Zy7u1sRESTanL_BXBn6QykscA@mail.gmail.com>
 <20190813053023.CC86120651@mail.kernel.org>
 <CAFd5g47v7410QRAizPV8zaHrKrc95-Sk-GNzRRVngN741OKnvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CAFd5g47v7410QRAizPV8zaHrKrc95-Sk-GNzRRVngN741OKnvg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>, "open list:DOCUMENTATION" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Amir Goldstein <amir73il-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Sasha Levin <Alexander.Levin-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, shuah <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-nvdimm <linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Knut Omang <knut.omang-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, wfg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jeff Dike <jdike-OPE4K8JWMJJBDgjK7y7TUQ@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kbuild <linux-kbuild-u79uwXL29TasMV2rI37PzA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 2:04 AM Brendan Higgins
<brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
>
> On Mon, Aug 12, 2019 at 10:30 PM Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >
> > Quoting Brendan Higgins (2019-08-12 22:02:59)
> > > On Mon, Aug 12, 2019 at 9:56 PM Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > > >
> > > > Quoting Brendan Higgins (2019-08-12 17:41:05)
> > > > > On Mon, Aug 12, 2019 at 4:59 PM Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > > > > >
> > > > > > > kunit_resource_destroy (respective equivalents to devm_kfree, and
> > > > > > > devres_destroy) and use kunit_kfree here?
> > > > > > >
> > > > > >
> > > > > > Yes, or drop the API entirely? Does anything need this functionality?
> > > > >
> > > > > Drop the kunit_resource API? I would strongly prefer not to.
> > > >
> > > > No. I mean this API, string_stream_clear(). Does anything use it?
> > >
> > > Oh, right. No.
> > >
> > > However, now that I added the kunit_resource_destroy, I thought it
> > > might be good to free the string_stream after I use it in each call to
> > > kunit_assert->format(...) in which case I will be using this logic.
> > >
> > > So I think the right thing to do is to expose string_stream_destroy so
> > > kunit_do_assert can clean up when it's done, and then demote
> > > string_stream_clear to static. Sound good?
> >
> > Ok, sure. I don't really see how clearing it explicitly when the
> > assertion prints vs. never allocating it to begin with is really any
> > different. Maybe I've missed something though.
>
> It's for the case that we *do* print something out. Once we are doing
> printing, we don't want the fragments anymore.

Oops, sorry fat fingered: s/doing/done
