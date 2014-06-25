Return-Path: <grant.likely@secretlab.ca>
Return-Path: <grant.likely@secretlab.ca>
Sender: Grant Likely <glikely@secretlab.ca>
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of: Transactional DT support.
In-Reply-To: <C0AB3C41-C0BE-4F50-A4DB-843EAC8C8F6F@konsulko.com>
References: 
	<1403430093-15132-1-git-send-email-pantelis.antoniou@konsulko.com>
	<20140625140641.F10F0C40B59@trevor.secretlab.ca>
	<C0AB3C41-C0BE-4F50-A4DB-843EAC8C8F6F@konsulko.com>
Date: Wed, 25 Jun 2014 18:46:39 +0100
Message-Id: <20140625174639.D6F32C40B59@trevor.secretlab.ca>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, 25 Jun 2014 17:48:43 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> On Jun 25, 2014, at 5:06 PM, Grant Likely wrote:
> > On Sun, 22 Jun 2014 12:41:33 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> > Second, the API model potentially leaves the tree in an intermediary
> > state for a long time. The way I understand it, the model currently is:
> > 	1. Initialize data structure
> > 	2. take lock
> > 	3. Add an operation to the structure /and/ partially complete
> > 	   the operation
> > 	4. repeat #3 for each operation
> > 	5. Complete the transaction; sending notifiers for each change
> > 	6. release lock
> > But the entire operation is data structure driven. I don't see a need
> > for there to be the period between 2 & 5 where ther tree is in an
> > intermediary state. It seems to me that the following model would be a
> > lot better:
> > 	1. Initialize the data structure
> > 	2. Insert an operation into the structure
> > 	3. Repeat #2 for each operation
> > 	4. Take lock
> > 	5. Apply the entire list of changes in bulk:
> > 	   5a. Iterate over operations and apply all to tree
> > 	   5b. Iterate over operations and send notifiers for each
> > 	6. release lock.
> > 	7. Free structure (for firmware driven changes)
> > 	  --or--
> > 	7. Hold onto structure if it ever needs to be reverted (overlays)
> > 
> 
> I see. There are a few problems with your approach.
> 
> The first problem is that some operations can take quite a lot of time.
> Those operations are all the _post methods, which add/remove entries to sysfs.
> We would have to apply those operations while holding the lock.

Then release the lock between 5a and 5b. Steps 4 & 5 can be all one
operation.

> The second and the biggest is that the step-wise application of the changes
> allows us to use the standard OF functions. The 'prepare a batch' and then
> apply it I doubt it will work. Let me explain.
> 
> Using the approach taken in the patch the transaction code will insert
> nodes, properties in the tree in such a way that subsequent operations
> get direct feedback where something went wrong.

What is the use-case that requires direct feedback at that level?
Overlays apply pre-determined bulk changes. If the bulk changes won't
apply, the whole thing gets aborted. I don't see any reason to expose
interactive modifications to the tree while holding the mutex.

> Let take the example of having to insert a single node and a single property
> in the newly created node.
> 
> Let "/foo" node being the parent node, "/foo/bar" the new node and "baz" the new 
> property.
> 
> The steps would be (simplified):
> 
> 1. of_transaction_start()
> 2. of_transaction_attach_node("/foo", "bar")
> 3. of_transaction_add_property("/foo/bar", "baz");
> 4. of_transaction_commit();
> 
> In the way the current patch works the steps 2 & 3, modify the tree directly
> at that point so the node is created internally on step 2, and the property
> addition on step 3 will find a node to 'hang' the property.
> On step 4, the transaction log will be traversed and the sysfs properties, and
> notifiers will be fired.

The node /foo is allocated before step 3. It is fine for an operation to
reference an unattached node as long as the node is attached by the time
the operation is reached.

> Using your suggestion, creating the log before affecting the tree would mean
> that there's no way for knowing whether step #3 is valid or not, leading to
> a greatly complicated logging structure, possibly a duplication of the live subtree.

Why? I don't follow how the structure is any different.

> > If something fails in step 5, that function already knows how to revert
> > everything it has already done and there isn't any intermediary state
> > outside of the API call that applies the change.
> > 
> > You could quibble about whether the lock should be taken before
> > or after populating the data structure, but I don't think holding it
> > earlier is necessary. of_node_get() on the parent node when populating
> > should be sufficient. The function that applies the bulk change will
> > want to check to make sure the parent node is actually attached to the
> > tree before proceeding anyway.
> > 
> 
> You will need to take a lock at the beginning anyway. You might be racing with another
> tree modifier.

The critical region is the period of time the changes are being applied.
If all the changes are prepared ahead of time then they fall outside the
critical region. The exception would be references to the node being
manipulated, but that is what of_node_get() is for.

> >> +
> >> +#endif
> >> +
> >> +static inline int of_transaction_attach_node(struct of_transaction *oft,
> >> +		struct device_node *np)
> >> +{
> >> +	return of_transaction_action(oft, OF_RECONFIG_ATTACH_NODE, np, NULL);
> >> +}
> >> +
> >> +static inline int of_transaction_detach_node(struct of_transaction *oft,
> >> +		struct device_node *np)
> >> +{
> >> +	return of_transaction_action(oft,
> >> +			OF_RECONFIG_DETACH_NODE, np, NULL);
> > 
> > Nit: why a line break? Ditto for all of the below.
> > 
> 
> Over 80 characters.

I count 78. :-)

g.
