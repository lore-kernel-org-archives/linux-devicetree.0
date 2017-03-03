From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] mtd: Add support for reading MTD devices via the
 nvmem API
Date: Fri, 3 Mar 2017 15:11:07 +0100
Message-ID: <20170303151107.36754d19@bbrezillon>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
        <1488484223-844-3-git-send-email-albeu@free.fr>
        <20170302221803.223ff23b@bbrezillon>
        <20170303133629.3aac2945@tock>
        <20170303143658.5d89a329@bbrezillon>
        <20170303145726.16cd67fd@tock>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170303145726.16cd67fd@tock>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 3 Mar 2017 14:57:26 +0100
Alban <albeu-GANU6spQydw@public.gmane.org> wrote:

> On Fri, 3 Mar 2017 14:36:58 +0100
> Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> 
> > On Fri, 3 Mar 2017 13:36:29 +0100
> > Alban <albeu-GANU6spQydw@public.gmane.org> wrote:
> >   
> > > On Thu, 2 Mar 2017 22:18:03 +0100
> > > Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > >     
> > > > On Thu,  2 Mar 2017 20:50:22 +0100
> > > > Alban <albeu-GANU6spQydw@public.gmane.org> wrote:
> > > > 
> > > > [snip]
> > > >      
> > [snip]
> >     
> > > > Maybe we should let notifiers return an error if they want to cancel
> > > > the removal, or maybe this is a good reason to put the nvmem pointer
> > > > directly in mtd_info and call mtd_nvmem_add/remove() directly from
> > > > add/del_mtd_device() and allow them to return an error.
> > > > 
> > > > Not that, if you go for this solution, you'll also get rid of the
> > > > global mtd_nvmem_list list and the associated lock.      
> > > 
> > > IMHO the MTD users framework has to be re-worked to be useful. First
> > > both the add and remove callbacks should have return values. Users where
> > > the add failed shouldn't be removed later and users where the remove
> > > fails should block the removal of the MTD.    
> > 
> > As said in my previous reply, it's not just about returning an error. I
> > had a closer look at the code, and it seems that using
> > __get_mtd_device() properly should prevent the problem we are talking
> > about (call __get_mtd_device() after your nvmem_register() and call
> > __put_mtd_device() only if nvmem_unregister() succeed).  
> 
> That's not going to work. If the notifier add increase the MTD reference
> count it can never be removed again.

That's not true, see the del_mtd_device() function [1], it's calling
the ->remove() notifiers before even testing ->usecount, so, if you
call __put_mtd_device() in your ->remove() hook you should be fine.

> What could work would be to
> propagate the nvmem device ref counting down to the MTD device, but that
> sound complex and would require some non-trivial locking to still allow
> for an "always succeed" removal.
> 
> > > 
> > > Furthermore only passing the MTD device to the add/remove callback
> > > force the users to keep their own list, which is annoying to say the
> > > least. A simple fix would be to have the add callback return a pointer
> > > that would be passed back to the remove callback. Trivial to implement
> > > and the MTD user wouldn't have to keep any list. I will look into this
> > > in the next days.    
> > 
> > That's a different problem, and I'm not sure I like the idea of
> > changing the ->add() prototype into
> > 
> > 	void *(*add)(struct mtd_info *);
> > 
> > If we want to do that, I'd rather see an API extension allowing one to
> > attach/detach/query/update user data to an MTD device.  
> 
> Under which condition would these be triggered? That sound more than is
> needed. I would just use the above add along with:
> 
>  int (*remove)(struct mtd_info *, void *);
> 
> And add a list of successfully added notifiers, along with their
> data pointer, to the MTD device. That's simple and would also remove
> the need for notifier to have a private list of their instances as I
> had to do here.

And then you're abusing the notifier concept. As said earlier, a
notifier is not necessarily using the device, and thus, don't
necessarily need private data.
It's not only about what is the simplest solution for your use case,
but also what other users want/need.


[1]http://lxr.free-electrons.com/source/drivers/mtd/mtdcore.c#L592
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
