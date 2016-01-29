From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: resolver: Add missing of_node_put
Date: Fri, 29 Jan 2016 10:45:31 -0600
Message-ID: <20160129164531.GB15053@rob-hp-laptop>
References: <20160127152017.GA16048@amitoj-Inspiron-3542>
 <20160127160531.GB17123@leverpostej>
 <FE79FA58-A084-47BE-B872-7D57AC2B4D75@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <FE79FA58-A084-47BE-B872-7D57AC2B4D75@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Amitoj Kaur Chawla <amitoj1606@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, julia.lawall@lip6.fr
List-Id: devicetree@vger.kernel.org

On Wed, Jan 27, 2016 at 06:14:00PM +0200, Pantelis Antoniou wrote:
> Hi Mark,
> 
> > On Jan 27, 2016, at 18:05 , Mark Rutland <mark.rutland@arm.com> wrote:
> > 
> > On Wed, Jan 27, 2016 at 08:50:17PM +0530, Amitoj Kaur Chawla wrote:
> >> for_each_child_of_node performs an of_node_get on each iteration, so
> >> to break out of the loop an of_node_put is required.
> >> 
> >> Found using Coccinelle. The semantic patch used for this is as follows:
> >> 
> >> // <smpl>
> >> @@
> >> expression e;
> >> local idexpression n;
> >> @@
> >> 
> >> for_each_child_of_node(..., n) {
> >>   ... when != of_node_put(n)
> >>       when != e = n
> >> (
> >>   return n;
> >> |
> >> +  of_node_put(n);
> >> ?  return ...;
> >> )
> >>   ...
> >> }
> >> // </smpl
> >> 
> >> Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
> >> ---
> >> drivers/of/resolver.c | 4 +++-
> >> 1 file changed, 3 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
> >> index 640eb4c..e2a0143 100644
> >> --- a/drivers/of/resolver.c
> >> +++ b/drivers/of/resolver.c
> >> @@ -40,8 +40,10 @@ static struct device_node *__of_find_node_by_full_name(struct device_node *node,
> >> 
> >> 	for_each_child_of_node(node, child) {
> >> 		found = __of_find_node_by_full_name(child, full_name);
> >> -		if (found != NULL)
> >> +		if (found != NULL) {
> >> +			of_node_put(child);
> >> 			return found;
> >> +		}
> >> 	}
> >> 
> >> 	return NULL;
> > 
> > I don't think this is quite right. When child == found, this change will
> > leave it decremented.
> > 
> 
> 
> This patch is bogus. 
> 
> __of_find_node_by_full_name() is not taking a reference on the node if found. 
> This method relies on keeping the reference taken by the loop.
> 
> Taking this into account all of these conccinelle tests are bogus.
> 
> The DT internal method are not using the object model in an obvious manner
> and applying these patches without vetting each and everyone is bound to
> break things.

Things are already broken. But does it matter?

Our time would be better spent re-designing any refcounting around where 
we actually need it rather than trying to fix up the many locations 
which are wrong and don't matter. As long as it is callers' 
responsibility to get this right, it will never be right. Even the core 
code has a hard time getting it right.

Rob
