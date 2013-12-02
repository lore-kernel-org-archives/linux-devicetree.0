From: boris brezillon <b.brezillon@overkiz.com>
Subject: Re: [PATCH v2 1/2] clk: add clk accuracy retrieval support
Date: Mon, 02 Dec 2013 13:17:10 +0100
Message-ID: <529C7A46.2070401@overkiz.com>
References: <1385556285-19180-1-git-send-email-b.brezillon@overkiz.com> <1385556285-19180-2-git-send-email-b.brezillon@overkiz.com> <20131202075043.GB29721@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131202075043.GB29721@pengutronix.de>
Sender: linux-doc-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Rob Landley <rob@landley.net>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mike Turquette <mturquette@linaro.org>, Russell King <linux@arm.linux.org.uk>, Nicolas Ferre <nicolas.ferre@atmel.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello Uwe,

Le 02/12/2013 08:50, Uwe Kleine-K=F6nig a =E9crit :
> Hello,
>
> On Wed, Nov 27, 2013 at 01:44:44PM +0100, Boris BREZILLON wrote:
>> The clock accuracy is expressed in ppb (parts per billion) and repre=
sents
>> the possible clock drift.
>> Say you have a clock (e.g. an oscillator) which provides a fixed clo=
ck of
>> 20MHz with an accuracy of +- 20Hz. This accuracy expressed in ppb is
>> 20Hz/20MHz =3D 1000 ppb (or 1 ppm).
>>
>> Clock users may need the clock accuracy information in order to choo=
se
>> the best clock (the one with the best accuracy) across several avail=
able
>> clocks.
>>
>> This patch adds clk accuracy retrieval support for common clk framew=
ork by
>> means of a new function called clk_get_accuracy.
>> This function returns the given clock accuracy expressed in ppb.
>>
>> In order to get the clock accuracy, this implementation adds one cal=
lback
>> called recalc_accuracy to the clk_ops structure.
>> This callback is given the parent clock accuracy (if the clock is no=
t a
>> root clock) and should recalculate the given clock accuracy.
>>
>> This callback is optional and may be implemented if the clock is not
>> a perfect clock (accuracy !=3D 0 ppb).
>>
>> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
>> ---
>>   Documentation/clk.txt        |    4 ++
>>   drivers/clk/clk.c            |  109 ++++++++++++++++++++++++++++++=
++++++++++--
>>   include/linux/clk-private.h  |    1 +
>>   include/linux/clk-provider.h |   11 +++++
>>   include/linux/clk.h          |   17 +++++++
>>   5 files changed, 138 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/clk.txt b/Documentation/clk.txt
>> index 3aeb5c4..eb20198 100644
>> --- a/Documentation/clk.txt
>> +++ b/Documentation/clk.txt
>> @@ -77,6 +77,8 @@ the operations defined in clk.h:
>>   		int		(*set_parent)(struct clk_hw *hw, u8 index);
>>   		u8		(*get_parent)(struct clk_hw *hw);
>>   		int		(*set_rate)(struct clk_hw *hw, unsigned long);
>> +		unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
>> +						   unsigned long parent_accuracy);
>>   		void		(*init)(struct clk_hw *hw);
>>   	};
>>  =20
>> @@ -202,6 +204,8 @@ optional or must be evaluated on a case-by-case =
basis.
>>   .set_parent     |      |             | n             | y          =
 | n    |
>>   .get_parent     |      |             | n             | y          =
 | n    |
>>                   |      |             |               |            =
 |      |
>> +.recalc_accuracy|      |             |               |             =
|      |
>> +                |      |             |               |             =
|      |
>>   .init           |      |             |               |            =
 |      |
>>                   --------------------------------------------------=
---------
>>   [1] either one of round_rate or determine_rate is required.
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 2cf2ea6..4b0c1bc 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -104,10 +104,11 @@ static void clk_summary_show_one(struct seq_fi=
le *s, struct clk *c, int level)
>>   	if (!c)
>>   		return;
>>  =20
>> -	seq_printf(s, "%*s%-*s %-11d %-12d %-10lu",
>> +	seq_printf(s, "%*s%-*s %-11d %-12d %-10lu %-11lu",
>>   		   level * 3 + 1, "",
>>   		   30 - level * 3, c->name,
>> -		   c->enable_count, c->prepare_count, clk_get_rate(c));
>> +		   c->enable_count, c->prepare_count, clk_get_rate(c),
>> +		   clk_get_accuracy(c));
>>   	seq_printf(s, "\n");
>>   }
>>  =20
>> @@ -129,8 +130,8 @@ static int clk_summary_show(struct seq_file *s, =
void *data)
>>   {
>>   	struct clk *c;
>>  =20
>> -	seq_printf(s, "   clock                        enable_cnt  prepare=
_cnt  rate\n");
>> -	seq_printf(s, "---------------------------------------------------=
------------------\n");
>> +	seq_printf(s, "   clock                        enable_cnt  prepare=
_cnt  rate        accuracy\n");
>> +	seq_printf(s, "---------------------------------------------------=
------------------------------\n");
>>  =20
>>   	clk_prepare_lock();
>>  =20
>> @@ -167,6 +168,7 @@ static void clk_dump_one(struct seq_file *s, str=
uct clk *c, int level)
>>   	seq_printf(s, "\"enable_count\": %d,", c->enable_count);
>>   	seq_printf(s, "\"prepare_count\": %d,", c->prepare_count);
>>   	seq_printf(s, "\"rate\": %lu", clk_get_rate(c));
>> +	seq_printf(s, "\"accuracy\": %lu", clk_get_accuracy(c));
>>   }
>>  =20
>>   static void clk_dump_subtree(struct seq_file *s, struct clk *c, in=
t level)
>> @@ -248,6 +250,11 @@ static int clk_debug_create_one(struct clk *clk=
, struct dentry *pdentry)
>>   	if (!d)
>>   		goto err_out;
>>  =20
>> +	d =3D debugfs_create_u32("clk_accuracy", S_IRUGO, clk->dentry,
>> +			(u32 *)&clk->accuracy);
>> +	if (!d)
>> +		goto err_out;
>> +
>>   	d =3D debugfs_create_x32("clk_flags", S_IRUGO, clk->dentry,
>>   			(u32 *)&clk->flags);
>>   	if (!d)
>> @@ -602,6 +609,28 @@ out:
>>   	return ret;
>>   }
>>  =20
>> +unsigned long __clk_get_accuracy(struct clk *clk)
>> +{
>> +	unsigned long ret;
>> +
>> +	if (!clk) {
>> +		ret =3D 0;
>> +		goto out;
>> +	}
>> +
>> +	ret =3D clk->accuracy;
>> +
>> +	if (clk->flags & CLK_IS_ROOT)
>> +		goto out;
>> +
>> +	if (!clk->parent)
>> +		ret =3D 0;
> Why do you need this? Wouldn't it be enough to assert clk->accuracy
> being 0 in this case?

I'm not sure.
I did this because it was done this way for __clk_get_rate (which is
not a valid argument ;)).

Now that I think about it I don't find any good reason for not directly
returning the clk->accuracy (even if the clk is orphan).

I mean, if we consider the parent_clk as perfect (which is the case if
the clk is orphan), then the child clk might still introduce some=20
inaccuracy.
And I think it's better to return the maximum clk accuracy instead of
considering the clk is perfect.

I'll fix this in the next version.

>> +out:
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(__clk_get_accuracy);
>> +
>>   unsigned long __clk_get_flags(struct clk *clk)
>>   {
>>   	return !clk ? 0 : clk->flags;
>> @@ -1016,6 +1045,59 @@ static int __clk_notify(struct clk *clk, unsi=
gned long msg,
>>   }
>>  =20
>>   /**
>> + * __clk_recalc_accuracies
>> + * @clk: first clk in the subtree
>> + * @msg: notification type (see include/linux/clk.h)
> There is no msg parameter in this function.

I'll fix the comment.

>
>> + * Walks the subtree of clks starting with clk and recalculates acc=
uracies as
>> + * it goes.  Note that if a clk does not implement the .recalc_rate=
 callback
>> + * then it is assumed that the clock will take on the rate of it's =
parent.
>> + *
>> + * Caller must hold prepare_lock.
>> + */
>> +static void __clk_recalc_accuracies(struct clk *clk)
>> +{
>> +	unsigned long parent_accuracy =3D 0;
>> +	struct clk *child;
>> +
>> +	if (clk->parent)
>> +		parent_accuracy =3D clk->parent->accuracy;
>> +
>> +	if (clk->ops->recalc_accuracy)
>> +		clk->accuracy =3D clk->ops->recalc_accuracy(clk->hw,
>> +							  parent_accuracy);
>> +	else
>> +		clk->accuracy =3D parent_accuracy;
>> +
>> +	hlist_for_each_entry(child, &clk->children, child_node)
>> +		__clk_recalc_accuracies(child);
>> +}
>> +
>> +/**
>> + * clk_get_accuracy - return the accuracy of clk
>> + * @clk: the clk whose accuracy is being returned
>> + *
>> + * Simply returns the cached accuracy of the clk, unless
>> + * CLK_GET_ACCURACY_NOCACHE flag is set, which means a recalc_rate =
will be
>> + * issued.
>> + * If clk is NULL then returns 0.
>> + */
>> +long clk_get_accuracy(struct clk *clk)
>> +{
>> +	unsigned long accuracy;
>> +
>> +	clk_prepare_lock();
>> +	if (clk && (clk->flags & CLK_GET_ACCURACY_NOCACHE))
>> +		__clk_recalc_accuracies(clk);
>> +
>> +	accuracy =3D __clk_get_accuracy(clk);
>> +	clk_prepare_unlock();
>> +
>> +	return accuracy;
>> +}
>> +EXPORT_SYMBOL_GPL(clk_get_accuracy);
>> +
>> +/**
>>    * __clk_recalc_rates
>>    * @clk: first clk in the subtree
>>    * @msg: notification type (see include/linux/clk.h)
>> @@ -1551,6 +1633,7 @@ void __clk_reparent(struct clk *clk, struct cl=
k *new_parent)
>>   {
>>   	clk_reparent(clk, new_parent);
>>   	clk_debug_reparent(clk, new_parent);
>> +	__clk_recalc_accuracies(clk);
>>   	__clk_recalc_rates(clk, POST_RATE_CHANGE);
>>   }
>>  =20
>> @@ -1621,6 +1704,9 @@ int clk_set_parent(struct clk *clk, struct clk=
 *parent)
>>   	/* do the re-parent */
>>   	ret =3D __clk_set_parent(clk, parent, p_index);
>>  =20
>> +	/* propagate accuracy recalculation */
>> +	__clk_recalc_accuracies(clk);
>> +
> Would it make sense to move this call into the if (ret) below? The ra=
te
> is only recalculated there, too.
You mean only if __clk_set_parent returns 0.
Yes it makes sense: the accuracy should not change if the parent hasn't=
=20
changed
(is this case, if we fail to change the parent).

BTW, the rate is recalculated anyway, the only thing that changes is th=
e=20
notification
message.

I'll fix this if no ones finds a good reason to recalculate the accurac=
y=20
when we fail
to change the parent.

Thanks for your review

Best Regars,

Boris
>>   	/* propagate rate recalculation accordingly */
>>   	if (ret)
>>   		__clk_recalc_rates(clk, ABORT_RATE_CHANGE);
> Best regards
> Uwe
>

