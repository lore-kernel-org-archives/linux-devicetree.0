From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: OF_DYNAMIC node lifecycle
Date: Mon, 23 Jun 2014 15:58:44 +0100
Message-ID: <20140623145844.DA6A3C40AE5@trevor.secretlab.ca>
References: <CACxGe6tsXuLZT=h8S0yRPRPy6Hqz1xkX8G+ViY0cxEUuxZ1dsw@mail.gmail.com>
	<43898B58-2EA7-42B5-A17A-27F16F2618A6@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <43898B58-2EA7-42B5-A17A-27F16F2618A6-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>, Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 19 Jun 2014 11:33:20 +0300, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Hi Grant,
> 
> CCing Thomas Gleixner & Steven Rostedt, since they might have a few
> ideas...
> 
> On Jun 18, 2014, at 11:07 PM, Grant Likely wrote:
> 
> > Hi Nathan and Tyrel,
> > 
> > I'm looking into lifecycle issues on nodes modified by OF_DYNAMIC, and
> > I'm hoping you can help me. Right now, pseries seems to be the only
> > user of OF_DYNAMIC, but making OF_DYNAMIC work has a huge impact on
> > the entire kernel because it requires all DT code to manage reference
> > counting with iterating over nodes. Most users simply get it wrong.
> > Pantelis did some investigation and found that the reference counts on
> > a running kernel are all over the place. I have my doubts that any
> > code really gets it right.
> > 
> > The problem is that users need to know when it is appropriate to call
> > of_node_get()/of_node_put(). All list traversals that exit early need
> > an extra call to of_node_put(), and code that is searching for a node
> > in the tree and holding a reference to it needs to call of_node_get().
> > 
> 
> In hindsight it appears that drivers just can't get the lifecycle right.
> So we need to simplify things.
> 
> > I've got a few pseries questions:
> > - What are the changes being requested by pseries firmware? Is it only
> > CPUs and memory nodes, or does it manipulate things all over the tree?
> > - How frequent are the changes? How many changes would be likely over
> > the runtime of the system?
> > - Are you able to verify that removed nodes are actually able to be
> > freed correctly? Do you have any testcases for node removal?
> > 
> > I'm thinking very seriously about changing the locking semantics of DT
> > code entirely so that most users never have to worry about
> > of_node_get/put at all. If the DT code is switched to use rcu
> > primitives for tree iteration (which also means making DT code use
> > list_head, something I'm already investigating), then instead of
> > trying to figure out of_node_get/put rules, callers could use
> > rcu_read_lock()/rcu_read_unlock() to protect the region that is
> > searching over nodes, and only call of_node_get() if the node pointer
> > is needed outside the rcu read-side lock.
> > 
> > I'd really like to be rid of the node reference counting entirely, but
> > I can't figure out a way of doing that safely, so I'd settle for
> > making it a lot easier to get correct.
> > 
> 
> Since we're going about changing things, how about that devtree_lock?

I believe rcu would pretty much eliminate the devtree_lock entirely. All
modifiers would need to grab a mutex to ensure there is only one writer
at any given time, but readers would have free reign to parse the tree
however they like.

DT writers would have to follow some strict rules about how to handle
nodes that are removed (ie. don't modify or of_node_put() them until
after rcu is syncronized), but the number of writers is very small and
we have control of all of them.

> We're using a raw_spinlock and we're always taking the lock with
> interrupts disabled.
> 
> If we're going to make DT changes frequently during normal runtime
> and not only during boot time, those are bad for any kind of real-time
> performance.
> 
> So the question is, do we really have code that access the live tree
> during atomic sections?  Is that something we want? Enforcing this
> will make our lives easier, and we'll get the change to replace
> that spinlock with a mutex.

Yes, I believe the powerpc CPU hotplug code accesses the DT in atomic
sections. I cannot put my finger on the exact code however. Nathan might
know better. But, if I'm right, the whole problem goes away with RCU.

The design with RCU is to switch struct device_node and struct property
to use list_head and/or hlist_head with the _rcu accessors. They allow
items to be removed from a list without syncronizing with readers. Right
now we have two lists that need to be modified; the allnodes list and
the sibling list. I *think* it will be fine for the two list removals to
be non-atomic (there will be a brief period where the node can be found
on one list, but not the other) because it is a transient state already
accounted for in rcu read-side critical region.

That said, I've also got a design to remove the allnodes list entirely
and only work with the sibling list. I need to prototype this.

We'll also need a transition plan to move to RCU. I think the existing
iterators can be modified to do the rcu locking in-line, but still require
the of_node_get/put stuff (basically, so existing code continue to works
unchanged). Then we can add _rcu versions that drop the need for
of_node_get/put(). When everything is converted, the old iterators can
be dropped.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
