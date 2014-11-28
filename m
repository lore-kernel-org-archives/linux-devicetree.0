From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Patch to improve device tree structure
Date: Fri, 28 Nov 2014 15:46:26 +0000
Message-ID: <20141128154626.EFAE0C40884@trevor.secretlab.ca>
References: <1416199976-21147-1-git-send-email-gaurav.minocha.os@gmail.com>
	<20141118151026.D2D63C40966@trevor.secretlab.ca>
	<CA+rpMbKZvMb4uxSFabvXG5nRNQnNXnAKUhdjn0Vp_wZBFN8COw@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+rpMbKZvMb4uxSFabvXG5nRNQnNXnAKUhdjn0Vp_wZBFN8COw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, 23 Nov 2014 17:22:22 -0800
, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 wrote:
> On Tue, Nov 18, 2014 at 7:10 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Sun, 16 Nov 2014 20:52:56 -0800
> > , Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >  wrote:
> >> This patch improves the implementation of device tree structure.
> >>
> >> Traditional child and sibling linked list in device tree structure
> >> is removed and is replaced by list_head (i.e. circular doubly linked
> >>  list) already available in Linux kernel.
> >>
> >> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >
> > Hi Gaurav,
> >
> > So, after you've done this work, I need to you rebase it (and of course
> > it is non-trivial) onto linux-next. I've already got a patch queued up
> > which gets rid of the of_allnodes/allnext list which will have conflicts
> > with this patch.
> >
> 
> I am using http://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux.git
> There is no branch linux-next in it. Also, I believe http://git.secretlab.ca/
> is not up yet. Please correct.

The branch is devicetree/next. That is the branch that gets pulled into
linux-next every day.

git.secretlab.ca is now gone. I'm not going to resurrect it.

> >> -#define NO_OF_NODES 3
> >> -static struct device_node *nodes[NO_OF_NODES];
> >> -static int last_node_index;
> >> +#define MAX_NODES 50
> >> +
> >> +static int no_of_nodes;
> >>  static bool selftest_live_tree;
> >> +static struct device_node* nodes[MAX_NODES];
> >
> > I think it's time to rework this structure. Instead of a static list,
> > the code should figure out how many entries it needs and then kzalloc()
> > the region.
> 
> Ok.

For now I would like to you focus on this change and on making the
unittests independent of OF_DYNAMIC. Frank had some good comments. I'd
like to think on it some more before proceeding. The only time that the
single linked list is a problem is when unflattening the tree, but even
that can be mitigated by reordering it after unflatting has completed
instead of trying to keep it in order all the time.

The biggest question is whether or not we can switch to RCU operations.
It isn't necessary to use list_head to switch to RCU, but RCU is a lot
better understood when list_head is used.

So, work on OF_DYNAMIC for now and we'll revisit list_head later.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
