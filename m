From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 2/3] mtd: Add support for reading MTD devices via the
 nvmem API
Date: Fri, 3 Mar 2017 15:03:31 +0100
Message-ID: <20170303150331.702e0e41@bbrezillon>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
 <1488484223-844-3-git-send-email-albeu@free.fr>
 <b2df74bb-dd86-bac1-ab8b-cbff6ca29b6f@linaro.org>
 <20170303133419.2383dbce@bbrezillon> <20170303143021.46381429@tock>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20170303143021.46381429@tock>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Alban <albeu@free.fr>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Fri, 3 Mar 2017 14:30:21 +0100
Alban <albeu@free.fr> wrote:

> On Fri, 3 Mar 2017 13:34:19 +0100
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> 
> > On Fri, 3 Mar 2017 11:23:16 +0000
> > Srinivas Kandagatla <srinivas.kandagatla@linaro.org> wrote:
> > 
> >   
> > >     
> > > > +	mutex_lock(&mtd_nvmem_list_lock);
> > > > +	list_for_each_entry(mtd_nvmem, &mtd_nvmem_list, list) {
> > > > +		if (mtd_nvmem->mtd == mtd) {
> > > > +			list_del(&mtd_nvmem->list);
> > > > +			found = true;
> > > > +			break;
> > > > +		}
> > > > +	}
> > > > +	mutex_unlock(&mtd_nvmem_list_lock);
> > > > +
> > > > +	if (found) {
> > > > +		if (nvmem_unregister(mtd_nvmem->nvmem))
> > > > +			dev_err(&mtd->dev,
> > > > +				"Failed to unregister NVMEM device\n");      
> > > 
> > > I will be nice to feedback error to top layer, as it does not make sense 
> > > to remove providers if there are active consumers using it.
> > > 
> > > del_mtd_device(), unregister_mtd_user() have return values, I see no 
> > > reason why notifiers  should not return errors.
> > > May be if we should fix the remove() call backs to handle and return errors.    
> > 
> > It's more complicated than that. What should you do if one of the  
> > ->remove() notifier in the middle of the list is returning an error?    
> > Some of them have already taken the remove notification into account.
> > Should we call ->add() back on those notifiers? Also, I'm not sure they
> > are all safe against double ->remove() calls, so if we might be in
> > trouble when the removal is retried.  
> 
> Re-adding make no sense as that could also fails.

I agree.

> Keep it simple,
> remove the notifier from the list when remove() succeed, abort when one
> fails. In such a scenario that mean there is a dependency, the sys
> admin should then solve this dependency and re-trigger the MTD removal.

Except notifiers are by definition not attached to a specific MTD
device. I get your point, but I think we should clarify the different
concepts.

An mtd_notifier (which seems to also be called a user in a few places)
is something that should be called each time you have an MTD
creation/removal event (or when you add a notifier to the list). You
could have notifiers that don't do anything special with the MTD
device, hence they don't require private data.

I think we should add the mtd_user concept, which would be a specific
user of an MTD device that can contain private data and is likely to be
attached to the MTD device after the notifier's ->add() method is
called.

struct mtd_user_ops {
	int (*remove)(struct mtd_user *);
};

struct mtd_user {
	struct list_node node;
	const struct mtd_user_ops *ops;
}

int mtd_attach_user(struct mtd_info *mtd, struct mtd_user *user);
int mtd_detach_user(struct mtd_info *mtd, struct mtd_user *user);

and then inside the del_mtd_device() function, before you iterate over
all notifiers, you could iterate over all attached users and call their
->remove() method. If one fails, then you stop the removal procedure.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
