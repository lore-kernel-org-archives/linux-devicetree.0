Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH] of: Transactional DT support.
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
In-Reply-To: <20140625140641.F10F0C40B59@trevor.secretlab.ca>
Date: Wed, 25 Jun 2014 17:48:43 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <C0AB3C41-C0BE-4F50-A4DB-843EAC8C8F6F@konsulko.com>
References: <1403430093-15132-1-git-send-email-pantelis.antoniou@konsulko.com> <20140625140641.F10F0C40B59@trevor.secretlab.ca>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi Grant,

On Jun 25, 2014, at 5:06 PM, Grant Likely wrote:

> On Sun, 22 Jun 2014 12:41:33 +0300, Pantelis Antoniou =
<pantelis.antoniou@konsulko.com> wrote:
>> Introducing DT transactional support.
>>=20
>> A DT transaction is a method which allows one to apply changes
>> in the live tree, in such a way that either the full set of changes
>> take effect, or the state of the tree can be rolled-back to the
>> state it was before it was attempted. An applied transaction
>> can be rolled-back at any time.
>>=20
>> If any transaction results in the change of a state of a device
>> node, a notifier for that node will be fired which allows a bus
>> to create/destroy devices as directed.
>>=20
>> Documentation is in
>> 	Documentation/devicetree/transactions.txt
>=20
> Hi Pantelis,
>=20
> I'm going to restrict my comments to the API interface to start with.
> I expect some of the code details to change from my comments so I =
won't
> dig too deeply into it yet.
>=20

That's expected.

> Firstly, this is a lot closer to the way I want things to look. I'm
> quite happy in that regard.
>=20

That's nice.

> At the high level I see two issues.
>=20
> First, as we've talked about before, I really see this feature as core
> OF_DYNAMIC behaviour. It isn't transactions built on top of =
OF_DYANMIC;
> it is OF_DYNAMIC must be transactional in nature. In that regard, it
> shouldn't be a separate transactions block of code. It should be
> grouped with the rest of the OF_DYNAMIC code, either by putting it
> directly into base.c, or by moving the existing OF_DYNAMIC functions
> into a new drivers/of/dynamic.c file. The documentation should be
> similarly named. Documentation/devicetree/dynamic.txt would be
> appropriate.
>=20

OK.

> Second, the API model potentially leaves the tree in an intermediary
> state for a long time. The way I understand it, the model currently =
is:
> 	1. Initialize data structure
> 	2. take lock
> 	3. Add an operation to the structure /and/ partially complete
> 	   the operation
> 	4. repeat #3 for each operation
> 	5. Complete the transaction; sending notifiers for each change
> 	6. release lock
> But the entire operation is data structure driven. I don't see a need
> for there to be the period between 2 & 5 where ther tree is in an
> intermediary state. It seems to me that the following model would be a
> lot better:
> 	1. Initialize the data structure
> 	2. Insert an operation into the structure
> 	3. Repeat #2 for each operation
> 	4. Take lock
> 	5. Apply the entire list of changes in bulk:
> 	   5a. Iterate over operations and apply all to tree
> 	   5b. Iterate over operations and send notifiers for each
> 	6. release lock.
> 	7. Free structure (for firmware driven changes)
> 	  --or--
> 	7. Hold onto structure if it ever needs to be reverted =
(overlays)
>=20

I see. There are a few problems with your approach.

The first problem is that some operations can take quite a lot of time.
Those operations are all the _post methods, which add/remove entries to =
sysfs.
We would have to apply those operations while holding the lock.

The second and the biggest is that the step-wise application of the =
changes
allows us to use the standard OF functions. The 'prepare a batch' and =
then
apply it I doubt it will work. Let me explain.

Using the approach taken in the patch the transaction code will insert
nodes, properties in the tree in such a way that subsequent operations
get direct feedback where something went wrong.

Let take the example of having to insert a single node and a single =
property
in the newly created node.

Let "/foo" node being the parent node, "/foo/bar" the new node and "baz" =
the new=20
property.

The steps would be (simplified):

1. of_transaction_start()
2. of_transaction_attach_node("/foo", "bar")
3. of_transaction_add_property("/foo/bar", "baz");
4. of_transaction_commit();

In the way the current patch works the steps 2 & 3, modify the tree =
directly
at that point so the node is created internally on step 2, and the =
property
addition on step 3 will find a node to 'hang' the property.
On step 4, the transaction log will be traversed and the sysfs =
properties, and
notifiers will be fired.

Using your suggestion, creating the log before affecting the tree would =
mean
that there's no way for knowing whether step #3 is valid or not, leading =
to
a greatly complicated logging structure, possibly a duplication of the =
live subtree.

> If something fails in step 5, that function already knows how to =
revert
> everything it has already done and there isn't any intermediary state
> outside of the API call that applies the change.
>=20
> You could quibble about whether the lock should be taken before
> or after populating the data structure, but I don't think holding it
> earlier is necessary. of_node_get() on the parent node when populating
> should be sufficient. The function that applies the bulk change will
> want to check to make sure the parent node is actually attached to the
> tree before proceeding anyway.
>=20

You will need to take a lock at the beginning anyway. You might be =
racing with another
tree modifier.

>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>> ---
>> Documentation/devicetree/transactions.txt |  41 +++
>> drivers/of/Makefile                       |   2 +-
>> drivers/of/base.c                         |  42 ++-
>> drivers/of/transaction.c                  | 529 =
++++++++++++++++++++++++++++++
>> include/linux/of.h                        | 237 +++++++++++++
>> 5 files changed, 839 insertions(+), 12 deletions(-)
>> create mode 100644 Documentation/devicetree/transactions.txt
>> create mode 100644 drivers/of/transaction.c
>>=20
>> diff --git a/Documentation/devicetree/transactions.txt =
b/Documentation/devicetree/transactions.txt
>> new file mode 100644
>> index 0000000..59ff5b7
>> --- /dev/null
>> +++ b/Documentation/devicetree/transactions.txt
>> @@ -0,0 +1,41 @@
>> +A DT transaction is a method which allows one to apply changes
>> +in the live tree, in such a way that either the full set of changes
>> +take effect, or the state of the tree can be rolled-back to the
>> +state it was before it was attempted. An applied transaction
>> +can be rolled-back at any time.
>> +
>> +If any transaction results in the change of a state of a device
>> +node, a notifier for that node will be fired which allows a bus
>> +to create/destroy devices as directed.
>> +
>> +The sequence of a transaction is as follows.
>> +
>> +1. of_transaction_init() - initializes a transaction
>> +
>> +2. of_transaction_start() - starts a transaction; a global
>> +transaction lock is taken at this point and disallowes any other
>> +dynamic tree changes.
>> +
>> +3. A number of DT tree change calls, of_transaction_attach_node(),
>> +of_transaction_detach_node(), of_transaction_add_property(),
>> +of_transaction_remove_property, of_transaction_update_property()
>> +modify the live tree (but without any user-space visible changes).
>> +All changes are recorded in the list of of_transaction_entry of
>> +the transaction.
>> +
>> +4.a. No errors occured during application, so a call to
>> +of_transaction_commit() is issued. All the changes are made visible
>> +to user-space and all device creation/destruction notifiers are
>> +fired. The global transaction is released.
>> +
>> +4.b. An error occured, so a of_transaction_abort() call is issued.
>> +All changes to the live tree will be reverted. The global =
transaction
>> +lock will be released.
>> +
>> +5.a If the transaction needs not be reverted, a call to
>> +of_transaction_destroy will release the resources of the =
transaction.
>> +
>> +5.b If the transaction is to be reverted, a call to
>> +of_transaction_revert will do so. All device notifiers will be
>> +fired, and the state of the tree will be the same as before
>> +the call to of_start_transaction().
>> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
>> index 734d3e2..ae07348 100644
>> --- a/drivers/of/Makefile
>> +++ b/drivers/of/Makefile
>> @@ -1,4 +1,4 @@
>> -obj-y =3D base.o device.o platform.o util.o
>> +obj-y =3D base.o device.o platform.o util.o transaction.o
>> obj-$(CONFIG_OF_FLATTREE) +=3D fdt.o
>> obj-$(CONFIG_OF_EARLY_FLATTREE) +=3D fdt_address.o
>> obj-$(CONFIG_OF_PROMTREE) +=3D pdt.o
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index b5d854d..6dc6d63 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -50,6 +50,8 @@ DEFINE_MUTEX(of_aliases_mutex);
>>  */
>> DEFINE_RAW_SPINLOCK(devtree_lock);
>>=20
>> +DEFINE_MUTEX(of_transaction_mutex);
>> +
>=20
> We already have an of_aliases_mutex. Rather than increasing the =
locking
> complexity by adding yet another lock, rename that mutex to of_mutex =
and
> use it for modification also.
>=20

OK.

>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index 60e9f3b..38d4d74 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -121,6 +121,8 @@ extern struct device_node *of_allnodes;
>> extern struct device_node *of_chosen;
>> extern struct device_node *of_aliases;
>> extern raw_spinlock_t devtree_lock;
>> +extern struct mutex of_aliases_mutex;
>> +extern struct mutex of_transaction_mutex;
>>=20
>> static inline bool of_have_populated_dt(void)
>> {
>> @@ -873,4 +875,239 @@ static inline struct device_node =
*__of_create_empty_node(const char *name,
>>=20
>> #endif	/* !CONFIG_OF */
>>=20
>> +/**
>> + * struct of_transaction_entry	- Holds a transaction entry
>> + *
>> + * @node:	list_head for the log list
>> + * @action:	notifier action
>> + * @np:		pointer to the device node affected
>> + * @prop:	pointer to the property affected
>> + * @old_prop:	hold a pointer to the original property
>> + *
>> + * Every modification of the device tree during a transaction
>> + * is held in a list of of_transaction_entry structures.
>> + * That way we can recover from a partial application, or we can
>> + * revert the transaction
>> + */
>> +struct of_transaction_entry {
>> +	struct list_head node;
>> +	unsigned long action;
>=20
> enum?
>=20

I'm piggybacking on the notifier actions, which are defined =
include/linux/of.h
Those are unsigned long in the notifier core.

>> +	struct device_node *np;
>> +	struct property *prop;
>> +	struct property *old_prop;
>> +
>> +	/* if property change on status
>> +	*/
>> +	int device_state_change;
>=20
> Remove this flag. If you really really think it is necessary then put
> the device_state_change code into a follow-on patch so we can argue it
> separately.
>=20

OK.

>> +};
>> +
>> +/* possible states of the transaction */
>> +enum of_transaction_state {
>> +	OFT_READY,		/* ready for use (i.e. using start()     =
  */
>> +	OFT_IN_PROGRESS,	/* application in progress, start() =
issued */
>> +	OFT_COMMITTING,		/* committing but not yet completed      =
  */
>> +	OFT_COMMITTED,		/* has been commited to live tree        =
  */
>> +	OFT_REVERTING,		/* revert is in progress                 =
  */
>> +};
>=20
> As per my comments at the top, if the model is changed to get rid of
> intermediary state then I don't think there is any need to track
> transaction state in this way.
>=20

I guess we'll have to argue about it :)

>> +
>> +/**
>> + * struct of_transaction - transaction tracker structure
>> + *
>> + * @lock:	lock for accessing the te_list and state entries
>> + * @te_list:	list_head for the transaction entries
>> + * @state:	State of the transaction
>> + *
>> + * Transactions are a convenient way to apply bulk changes to the
>> + * live tree. In case of an error, changes are rolled-back.
>> + * Transactions live on after initial application, and if not
>> + * destroyed after use, they can be reverted in one single call.
>> + */
>> +struct of_transaction {
>> +	struct mutex lock;
>=20
> What's the lock for? There will only ever by a single transaction in
> flight at any given time, and when a transaction is /not/ in flight, =
it
> is completely owned by the caller. I see no condition where there =
needs
> to be a lock just for the of_transaction structure.
>=20

Makes the transaction thread safe I guess, defensive programming.
I'll remove it and add a note that the interface is not thread safe.

>> +	struct list_head te_list;
>> +	enum of_transaction_state state;
>> +};
>> +
>> +/* forward iterator */
>> +#define for_each_transaction_entry(_oft, _te) \
>> +	list_for_each_entry(_te, &(_oft)->te_list, node)
>> +
>> +/* reverse iterator */
>> +#define for_each_transaction_entry_reverse(_oft, _te) \
>> +	list_for_each_entry_reverse(_te, &(_oft)->te_list, node)
>=20
> Move these to the .c file.
>=20

OK.

>> +
>> +#ifdef CONFIG_OF
>> +
>> +/**
>> + * of_transaction_init - Initialize a transaction for use
>> + *
>> + * @oft:	transaction pointer
>> + *
>> + * Initialize a transaction putting it in READY state.
>> + * Returns 0 on success, a negative error value in case of an error.
>> + */
>=20
> Nit: Convention is (at least for drivers/of) to put the kernel-doc =
block
> in the .c file, not the header.
>=20

OK.

>> +int of_transaction_init(struct of_transaction *oft);
>> +
>> +/**
>> + * of_transaction_destroy - Destroy a transaction
>> + *
>> + * @oft:	transaction pointer
>> + *
>> + * Destroy a transaction, which is in either a COMMITED or READY =
state.
>> + * Returns 0 on success, a negative error value in case of an error.
>> + */
>> +int of_transaction_destroy(struct of_transaction *oft);
>> +
>> +/**
>> + * of_transaction_start - Start a transaction
>> + *
>> + * @oft:	transaction pointer
>> + *
>> + * Starts a transaction, by moving it from READY to IN_PROGRESS =
state.
>> + * The global transaction mutex will be held on sucess, so that no
>> + * transactions/live updates can occur until either the transaction
>> + * completes (i.e. moves to COMMITTED state), or aborted.
>> + * Returns 0 on success, a negative error value in case of an error.
>> + */
>> +int of_transaction_start(struct of_transaction *oft);
>> +
>> +/**
>> + * of_transaction_abort - Aborts a transaction in progress
>> + *
>> + * @oft:	transaction pointer
>> + *
>> + * Aborts a transaction in IN_PROGRESS state, reverting the state
>> + * of the live tree to the condition it was before application.
>> + * The global transaction mutex is released if successful.
>> + * Returns 0 on success, a negative error value in case of an error.
>> + */
>> +int of_transaction_abort(struct of_transaction *oft);
>> +
>> +/**
>> + * of_transaction_abort - Aborts a transaction in progress
>> + *
>> + * @oft:	transaction pointer
>> + *
>> + * Aborts a transaction in IN_PROGRESS state, reverting the state
>> + * of the live tree to the condition it was before application.
>> + * The global transaction mutex is released if successful, and the
>> + * state transitions to COMMITTED.
>> + * Any side-effects of live tree state changes are applied here on
>> + * sucess, like creation/destruction of devices and side-effects
>> + * like creation of sysfs properties and directories.
>> + * Returns 0 on success, a negative error value in case of an error.
>> + */
>> +int of_transaction_commit(struct of_transaction *oft);
>=20
> How about of_transaction_apply()?
>=20

Sure.

>> +
>> +/**
>> + * of_transaction_revert - Reverts an applied transaction
>> + *
>> + * @oft:	transaction pointer
>> + *
>> + * Aborts a transaction in COMMITTED state, reverting the state
>> + * of the live tree to the condition it was before application.
>> + * Any side-effects of live tree state reverting to the original
>> + * state, like creation/destruction of devices and side-effects
>> + * like removal of sysfs properties and directories are applied.
>> + * Returns 0 on success, a negative error value in case of an error.
>> + */
>> +int of_transaction_revert(struct of_transaction *oft);
>=20
>> +
>> +/**
>> + * of_transaction_action - Perform a transaction action
>> + *
>> + * @oft:	transaction pointer
>> + * @action:	action to perform
>> + * @np:		Pointer to device node
>> + * @prop:	Pointer to property
>> + *
>> + * On action being one of:
>> + * + OF_RECONFIG_ATTACH_NODE
>> + * + OF_RECONFIG_DETACH_NODE,
>> + * + OF_RECONFIG_ADD_PROPERTY
>> + * + OF_RECONFIG_REMOVE_PROPERTY,
>> + * + OF_RECONFIG_UPDATE_PROPERTY
>> + * performs a update of the live tree, while recording the
>> + * act on a transaction entry. The remaining of side-effects are
>> + * applied on commit.
>> + * Returns 0 on success, a negative error value in case of an error.
>> + */
>> +int of_transaction_action(struct of_transaction *oft, unsigned long =
action,
>> +		struct device_node *np, struct property *prop);
>> +
>> +#else
>> +
>> +static inline int of_transaction_init(struct of_transaction *oft)
>> +{
>> +	return -ENOTSUPP;
>> +}
>> +
>> +static inline int of_transaction_destroy(struct of_transaction *oft)
>> +{
>> +	return -ENOTSUPP;
>> +}
>> +
>> +static inline int of_transaction_start(struct of_transaction *oft)
>> +{
>> +	return -ENOTSUPP;
>> +}
>> +
>> +static inline int of_transaction_abort(struct of_transaction *oft)
>> +{
>> +	return -ENOTSUPP;
>> +}
>> +
>> +static inline int of_transaction_commit(struct of_transaction *oft)
>> +{
>> +	return -ENOTSUPP;
>> +}
>> +
>> +static inline int of_transaction_revert(struct of_transaction *oft)
>> +{
>> +	return -ENOTSUPP;
>> +}
>> +
>> +static inline int of_transaction_action(struct of_transaction *oft,
>> +		unsigned long action, struct device_node *np,
>> +		struct property *prop)
>> +{
>> +	return -ENOTSUPP;
>> +}
>=20
> Get rid of the empty stubs. These functions must *never* be called by
> non OF_DYNAMIC code.
>=20

OK.

>> +
>> +#endif
>> +
>> +static inline int of_transaction_attach_node(struct of_transaction =
*oft,
>> +		struct device_node *np)
>> +{
>> +	return of_transaction_action(oft, OF_RECONFIG_ATTACH_NODE, np, =
NULL);
>> +}
>> +
>> +static inline int of_transaction_detach_node(struct of_transaction =
*oft,
>> +		struct device_node *np)
>> +{
>> +	return of_transaction_action(oft,
>> +			OF_RECONFIG_DETACH_NODE, np, NULL);
>=20
> Nit: why a line break? Ditto for all of the below.
>=20

Over 80 characters.

>> +}
>> +
>> +static inline int of_transaction_add_property(struct of_transaction =
*oft,
>> +		struct device_node *np, struct property *prop)
>> +{
>> +	return of_transaction_action(oft,
>> +			OF_RECONFIG_ADD_PROPERTY, np, prop);
>> +}
>> +
>> +static inline int of_transaction_remove_property(struct =
of_transaction *oft,
>> +		struct device_node *np, struct property *prop)
>> +{
>> +	return of_transaction_action(oft,
>> +			OF_RECONFIG_REMOVE_PROPERTY, np, prop);
>> +}
>> +
>> +static inline int of_transaction_update_property(struct =
of_transaction *oft,
>> +		struct device_node *np, struct property *prop)
>> +{
>> +	return of_transaction_action(oft,
>> +			OF_RECONFIG_UPDATE_PROPERTY, np, prop);
>> +}
>> +
>> #endif /* _LINUX_OF_H */
>> --=20
>> 1.7.12
>>=20
>=20

Regards

-- Pantelis
