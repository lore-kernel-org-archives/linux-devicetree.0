From: boris brezillon <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 1/2] clk: add clk accuracy retrieval support
Date: Mon, 23 Dec 2013 09:02:49 +0100
Message-ID: <52B7EE29.5030207@overkiz.com>
References: <1387618488-3075-1-git-send-email-b.brezillon@overkiz.com> <1387618488-3075-2-git-send-email-b.brezillon@overkiz.com> <20131223075159.22761.63922@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131223075159.22761.63922@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaQ==?= =?UTF-8?B?Zw==?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 23/12/2013 08:51, Mike Turquette a =C3=A9crit :
> Quoting Boris BREZILLON (2013-12-21 01:34:47)
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
>> Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
> There was an unused 'unsigned long ret' in __clk_get_accuracy which I
> removed.

Indeed. Thanks!

> Updated patch as applied to clk-next is below:
>
> Regards,
> Mike
>
>
>
>  From 5279fc402ae59361a224d641d5823b21b4206232 Mon Sep 17 00:00:00 20=
01
> From: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
> Date: Sat, 21 Dec 2013 10:34:47 +0100
> Subject: [PATCH] clk: add clk accuracy retrieval support
>
> The clock accuracy is expressed in ppb (parts per billion) and repres=
ents
> the possible clock drift.
> Say you have a clock (e.g. an oscillator) which provides a fixed cloc=
k of
> 20MHz with an accuracy of +- 20Hz. This accuracy expressed in ppb is
> 20Hz/20MHz =3D 1000 ppb (or 1 ppm).
>
> Clock users may need the clock accuracy information in order to choos=
e
> the best clock (the one with the best accuracy) across several availa=
ble
> clocks.
>
> This patch adds clk accuracy retrieval support for common clk framewo=
rk by
> means of a new function called clk_get_accuracy.
> This function returns the given clock accuracy expressed in ppb.
>
> In order to get the clock accuracy, this implementation adds one call=
back
> called recalc_accuracy to the clk_ops structure.
> This callback is given the parent clock accuracy (if the clock is not=
 a
> root clock) and should recalculate the given clock accuracy.
>
> This callback is optional and may be implemented if the clock is not
> a perfect clock (accuracy !=3D 0 ppb).
>
> Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>   Documentation/clk.txt        |   4 ++
>   drivers/clk/clk.c            | 100 ++++++++++++++++++++++++++++++++=
++++++++---
>   include/linux/clk-private.h  |   1 +
>   include/linux/clk-provider.h |  11 +++++
>   include/linux/clk.h          |  17 ++++++++
>   5 files changed, 126 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/clk.txt b/Documentation/clk.txt
> index 3aeb5c4..eb20198 100644
> --- a/Documentation/clk.txt
> +++ b/Documentation/clk.txt
> @@ -77,6 +77,8 @@ the operations defined in clk.h:
>   		int		(*set_parent)(struct clk_hw *hw, u8 index);
>   		u8		(*get_parent)(struct clk_hw *hw);
>   		int		(*set_rate)(struct clk_hw *hw, unsigned long);
> +		unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
> +						   unsigned long parent_accuracy);
>   		void		(*init)(struct clk_hw *hw);
>   	};
>  =20
> @@ -202,6 +204,8 @@ optional or must be evaluated on a case-by-case b=
asis.
>   .set_parent     |      |             | n             | y           =
| n    |
>   .get_parent     |      |             | n             | y           =
| n    |
>                   |      |             |               |             =
|      |
> +.recalc_accuracy|      |             |               |             |=
      |
> +                |      |             |               |             |=
      |
>   .init           |      |             |               |             =
|      |
>                   ---------------------------------------------------=
--------
>   [1] either one of round_rate or determine_rate is required.
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 8312736..fbe08f6 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -104,10 +104,11 @@ static void clk_summary_show_one(struct seq_fil=
e *s, struct clk *c, int level)
>   	if (!c)
>   		return;
>  =20
> -	seq_printf(s, "%*s%-*s %-11d %-12d %-10lu",
> +	seq_printf(s, "%*s%-*s %-11d %-12d %-10lu %-11lu",
>   		   level * 3 + 1, "",
>   		   30 - level * 3, c->name,
> -		   c->enable_count, c->prepare_count, clk_get_rate(c));
> +		   c->enable_count, c->prepare_count, clk_get_rate(c),
> +		   clk_get_accuracy(c));
>   	seq_printf(s, "\n");
>   }
>  =20
> @@ -129,8 +130,8 @@ static int clk_summary_show(struct seq_file *s, v=
oid *data)
>   {
>   	struct clk *c;
>  =20
> -	seq_printf(s, "   clock                        enable_cnt  prepare_=
cnt  rate\n");
> -	seq_printf(s, "----------------------------------------------------=
-----------------\n");
> +	seq_printf(s, "   clock                        enable_cnt  prepare_=
cnt  rate        accuracy\n");
> +	seq_printf(s, "----------------------------------------------------=
-----------------------------\n");
>  =20
>   	clk_prepare_lock();
>  =20
> @@ -167,6 +168,7 @@ static void clk_dump_one(struct seq_file *s, stru=
ct clk *c, int level)
>   	seq_printf(s, "\"enable_count\": %d,", c->enable_count);
>   	seq_printf(s, "\"prepare_count\": %d,", c->prepare_count);
>   	seq_printf(s, "\"rate\": %lu", clk_get_rate(c));
> +	seq_printf(s, "\"accuracy\": %lu", clk_get_accuracy(c));
>   }
>  =20
>   static void clk_dump_subtree(struct seq_file *s, struct clk *c, int=
 level)
> @@ -248,6 +250,11 @@ static int clk_debug_create_one(struct clk *clk,=
 struct dentry *pdentry)
>   	if (!d)
>   		goto err_out;
>  =20
> +	d =3D debugfs_create_u32("clk_accuracy", S_IRUGO, clk->dentry,
> +			(u32 *)&clk->accuracy);
> +	if (!d)
> +		goto err_out;
> +
>   	d =3D debugfs_create_x32("clk_flags", S_IRUGO, clk->dentry,
>   			(u32 *)&clk->flags);
>   	if (!d)
> @@ -603,6 +610,14 @@ out:
>   	return ret;
>   }
>  =20
> +unsigned long __clk_get_accuracy(struct clk *clk)
> +{
> +	if (!clk)
> +		return 0;
> +
> +	return clk->accuracy;
> +}
> +
>   unsigned long __clk_get_flags(struct clk *clk)
>   {
>   	return !clk ? 0 : clk->flags;
> @@ -1017,6 +1032,59 @@ static int __clk_notify(struct clk *clk, unsig=
ned long msg,
>   }
>  =20
>   /**
> + * __clk_recalc_accuracies
> + * @clk: first clk in the subtree
> + *
> + * Walks the subtree of clks starting with clk and recalculates accu=
racies as
> + * it goes.  Note that if a clk does not implement the .recalc_accur=
acy
> + * callback then it is assumed that the clock will take on the accur=
acy of it's
> + * parent.
> + *
> + * Caller must hold prepare_lock.
> + */
> +static void __clk_recalc_accuracies(struct clk *clk)
> +{
> +	unsigned long parent_accuracy =3D 0;
> +	struct clk *child;
> +
> +	if (clk->parent)
> +		parent_accuracy =3D clk->parent->accuracy;
> +
> +	if (clk->ops->recalc_accuracy)
> +		clk->accuracy =3D clk->ops->recalc_accuracy(clk->hw,
> +							  parent_accuracy);
> +	else
> +		clk->accuracy =3D parent_accuracy;
> +
> +	hlist_for_each_entry(child, &clk->children, child_node)
> +		__clk_recalc_accuracies(child);
> +}
> +
> +/**
> + * clk_get_accuracy - return the accuracy of clk
> + * @clk: the clk whose accuracy is being returned
> + *
> + * Simply returns the cached accuracy of the clk, unless
> + * CLK_GET_ACCURACY_NOCACHE flag is set, which means a recalc_rate w=
ill be
> + * issued.
> + * If clk is NULL then returns 0.
> + */
> +long clk_get_accuracy(struct clk *clk)
> +{
> +	unsigned long accuracy;
> +
> +	clk_prepare_lock();
> +	if (clk && (clk->flags & CLK_GET_ACCURACY_NOCACHE))
> +		__clk_recalc_accuracies(clk);
> +
> +	accuracy =3D __clk_get_accuracy(clk);
> +	clk_prepare_unlock();
> +
> +	return accuracy;
> +}
> +EXPORT_SYMBOL_GPL(clk_get_accuracy);
> +
> +/**
>    * __clk_recalc_rates
>    * @clk: first clk in the subtree
>    * @msg: notification type (see include/linux/clk.h)
> @@ -1552,6 +1620,7 @@ void __clk_reparent(struct clk *clk, struct clk=
 *new_parent)
>   {
>   	clk_reparent(clk, new_parent);
>   	clk_debug_reparent(clk, new_parent);
> +	__clk_recalc_accuracies(clk);
>   	__clk_recalc_rates(clk, POST_RATE_CHANGE);
>   }
>  =20
> @@ -1622,11 +1691,13 @@ int clk_set_parent(struct clk *clk, struct cl=
k *parent)
>   	/* do the re-parent */
>   	ret =3D __clk_set_parent(clk, parent, p_index);
>  =20
> -	/* propagate rate recalculation accordingly */
> -	if (ret)
> +	/* propagate rate an accuracy recalculation accordingly */
> +	if (ret) {
>   		__clk_recalc_rates(clk, ABORT_RATE_CHANGE);
> -	else
> +	} else {
>   		__clk_recalc_rates(clk, POST_RATE_CHANGE);
> +		__clk_recalc_accuracies(clk);
> +	}
>  =20
>   out:
>   	clk_prepare_unlock();
> @@ -1731,6 +1802,21 @@ int __clk_init(struct device *dev, struct clk =
*clk)
>   		hlist_add_head(&clk->child_node, &clk_orphan_list);
>  =20
>   	/*
> +	 * Set clk's accuracy.  The preferred method is to use
> +	 * .recalc_accuracy. For simple clocks and lazy developers the defa=
ult
> +	 * fallback is to use the parent's accuracy.  If a clock doesn't ha=
ve a
> +	 * parent (or is orphaned) then accuracy is set to zero (perfect
> +	 * clock).
> +	 */
> +	if (clk->ops->recalc_accuracy)
> +		clk->accuracy =3D clk->ops->recalc_accuracy(clk->hw,
> +					__clk_get_accuracy(clk->parent));
> +	else if (clk->parent)
> +		clk->accuracy =3D clk->parent->accuracy;
> +	else
> +		clk->accuracy =3D 0;
> +
> +	/*
>   	 * Set clk's rate.  The preferred method is to use .recalc_rate.  =
=46or
>   	 * simple clocks and lazy developers the default fallback is to us=
e the
>   	 * parent's rate.  If a clock doesn't have a parent (or is orphane=
d)
> diff --git a/include/linux/clk-private.h b/include/linux/clk-private.=
h
> index 8138c94..accb517 100644
> --- a/include/linux/clk-private.h
> +++ b/include/linux/clk-private.h
> @@ -41,6 +41,7 @@ struct clk {
>   	unsigned long		flags;
>   	unsigned int		enable_count;
>   	unsigned int		prepare_count;
> +	unsigned long		accuracy;
>   	struct hlist_head	children;
>   	struct hlist_node	child_node;
>   	unsigned int		notifier_count;
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provide=
r.h
> index 7e59253..16d182c 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -29,6 +29,7 @@
>   #define CLK_IS_BASIC		BIT(5) /* Basic clk, can't do a to_clk_foo() =
*/
>   #define CLK_GET_RATE_NOCACHE	BIT(6) /* do not use the cached clk ra=
te */
>   #define CLK_SET_RATE_NO_REPARENT BIT(7) /* don't re-parent on rate =
change */
> +#define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk=
 accuracy */
>  =20
>   struct clk_hw;
>  =20
> @@ -108,6 +109,13 @@ struct clk_hw;
>    *		which is likely helpful for most .set_rate implementation.
>    *		Returns 0 on success, -EERROR otherwise.
>    *
> + * @recalc_accuracy: Recalculate the accuracy of this clock. The clo=
ck accuracy
> + *		is expressed in ppb (parts per billion). The parent accuracy is
> + *		an input parameter.
> + *		Returns the calculated accuracy.  Optional - if	this op is not
> + *		set then clock accuracy will be initialized to parent accuracy
> + *		or 0 (perfect clock) if clock has no parent.
> + *
>    * The clk_enable/clk_disable and clk_prepare/clk_unprepare pairs a=
llow
>    * implementations to split any work between atomic (enable) and sl=
eepable
>    * (prepare) contexts.  If enabling a clock requires code that migh=
t sleep,
> @@ -139,6 +147,8 @@ struct clk_ops {
>   	u8		(*get_parent)(struct clk_hw *hw);
>   	int		(*set_rate)(struct clk_hw *hw, unsigned long,
>   				    unsigned long);
> +	unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
> +					   unsigned long parent_accuracy);
>   	void		(*init)(struct clk_hw *hw);
>   };
>  =20
> @@ -433,6 +443,7 @@ struct clk *clk_get_parent_by_index(struct clk *c=
lk, u8 index);
>   unsigned int __clk_get_enable_count(struct clk *clk);
>   unsigned int __clk_get_prepare_count(struct clk *clk);
>   unsigned long __clk_get_rate(struct clk *clk);
> +unsigned long __clk_get_accuracy(struct clk *clk);
>   unsigned long __clk_get_flags(struct clk *clk);
>   bool __clk_is_prepared(struct clk *clk);
>   bool __clk_is_enabled(struct clk *clk);
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 9a6d045..0dd9114 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -82,6 +82,23 @@ int clk_notifier_register(struct clk *clk, struct =
notifier_block *nb);
>  =20
>   int clk_notifier_unregister(struct clk *clk, struct notifier_block =
*nb);
>  =20
> +/**
> + * clk_get_accuracy - obtain the clock accuracy in ppb (parts per bi=
llion)
> + *		      for a clock source.
> + * @clk: clock source
> + *
> + * This gets the clock source accuracy expressed in ppb.
> + * A perfect clock returns 0.
> + */
> +long clk_get_accuracy(struct clk *clk);
> +
> +#else
> +
> +static inline long clk_get_accuracy(struct clk *clk)
> +{
> +	return -ENOTSUPP;
> +}
> +
>   #endif
>  =20
>   /**

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
