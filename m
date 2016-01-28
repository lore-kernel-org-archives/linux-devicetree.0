From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] of: resolver: Add missing of_node_put
Date: Thu, 28 Jan 2016 11:28:10 +0000
Message-ID: <20160128112810.GK17123@leverpostej>
References: <20160127152017.GA16048@amitoj-Inspiron-3542>
 <20160127160531.GB17123@leverpostej>
 <FE79FA58-A084-47BE-B872-7D57AC2B4D75@konsulko.com>
 <20160127162153.GC17123@leverpostej>
 <FF19B941-89E4-4954-9818-E352FE9A0E97@konsulko.com>
 <alpine.DEB.2.02.1601272042030.2051@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1601272042030.2051@localhost6.localdomain6>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Amitoj Kaur Chawla <amitoj1606@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 27, 2016 at 08:48:00PM +0100, Julia Lawall wrote:
> 
> 
> On Wed, 27 Jan 2016, Pantelis Antoniou wrote:
> 
> > Hi Mark,
> > 
> > > On Jan 27, 2016, at 18:21 , Mark Rutland <mark.rutland@arm.com> wrote:
> > > 
> > > On Wed, Jan 27, 2016 at 06:14:00PM +0200, Pantelis Antoniou wrote:
> > >> Hi Mark,
> > >> 
> > >>> On Jan 27, 2016, at 18:05 , Mark Rutland <mark.rutland@arm.com> wrote:
> > >>> 
> > >>> On Wed, Jan 27, 2016 at 08:50:17PM +0530, Amitoj Kaur Chawla wrote:
> > >>>> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
> > >>>> index 640eb4c..e2a0143 100644
> > >>>> --- a/drivers/of/resolver.c
> > >>>> +++ b/drivers/of/resolver.c
> > >>>> @@ -40,8 +40,10 @@ static struct device_node *__of_find_node_by_full_name(struct device_node *node,
> > >>>> 
> > >>>> 	for_each_child_of_node(node, child) {
> > >>>> 		found = __of_find_node_by_full_name(child, full_name);
> > >>>> -		if (found != NULL)
> > >>>> +		if (found != NULL) {
> > >>>> +			of_node_put(child);
> > >>>> 			return found;
> > >>>> +		}
> > >>>> 	}
> > >>>> 
> > >>>> 	return NULL;
> > >>> 
> > >>> I don't think this is quite right. When child == found, this change will
> > >>> leave it decremented.
> > >>> 
> > >> 
> > >> 
> > >> This patch is bogus. 
> > >> 
> > >> __of_find_node_by_full_name() is not taking a reference on the node if found. 
> > >> This method relies on keeping the reference taken by the loop.
> > > 
> > > Sure. For the found node, that makes sense.
> > > 
> > > However, it also increments the refcount of all the parents, which does
> > > not seem correct to me, given they're not put on the return path, and a
> > > put of the found node won't decrement its parents refcounts, unless I
> > > have missed something.
> > > 
> > 
> > Hmm, yes. The parent refcounts must be decremented. 
> 
> So there should be if (found != child) of_node_put(child); ? 

That would match the intended semantics, yes.

Thanks,
Mark.
