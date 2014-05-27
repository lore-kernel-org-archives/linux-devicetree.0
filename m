From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 1/9] dt: deps: dtc: Automatically add new property
 'dependencies' which contains a list of referenced phandles
Date: Tue, 27 May 2014 21:02:25 +0100
Message-ID: <20140527200225.F12C4C40B4B@trevor.secretlab.ca>
References: <1399913280-6915-1-git-send-email-holler@ahsoftware.de>
	<1399913280-6915-2-git-send-email-holler@ahsoftware.de>
	<53775334.3030704@gmail.com> <5379FAA5.10404@ahsoftware.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5379FAA5.10404-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 19 May 2014 14:35:49 +0200, Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org> wrote:
> Am 17.05.2014 14:16, schrieb Tomasz Figa:
> 
> >> References to phandles of parent or child nodes will not be added to this
> >> property, because this information is already contained in the blob (in the
> >> form of the tree itself).
> >
> > I wonder if we shouldn't be including them too for consistency related
> > reasons, so we have all the necessary information in one place.
> > References to child nodes are great recipes for cycles, though...
> >
> > No strong opinion, though, just an idea.
> 
> As said, they are already in the tree itself. And they are already 
> included in the graph (these are the black edges), so they just don't 
> appear in the property dependencies.
> 
> >
> >>
> >> No dependencies to disabled nodes will be added.
> >>
> >
> > Same here. IMHO it might be wise to let the parsing entity (e.g. kernel)
> > decide whether to ignore a dependency to disabled node or not.
> >
> > Otherwise, I like the simplicity of compile-time dependency list
> > creation. Quite a nice work.
> 
> Thanks.
> 
> What's still questionable about the patches for dtc is if dependencies 
> to devices and not just drivers should be included in the new property 
> dependencies too. My current assumption is that all devices belonging to 
> one and the same driver don't have dependencies between each other. In 
> other words the order in which devices will be attached to one and the 
> same driver isn't important. If that assumption is correct it would be 
> possible to just attach all devices belonging to a driver after the 
> driver was loaded (also I haven't that done in my patches).

There aren't really any guarantees here. It is perfectly valid to have
two of the same device depending on the other, or even a device with a
different driver between the two.

There's always going to be corner cases on the dependency chain. The
question is whether or not it is worth trying to solve every concievable
order, or if a partway solution is good enough.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
