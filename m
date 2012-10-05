From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH V2] dtc: fix for_each_*() to skip first object if deleted
Date: Fri, 5 Oct 2012 10:07:18 +1000
Message-ID: <20121005000717.GR29302@truffula.fritz.box>
References: <1349373309-20422-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1349373309-20422-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 04, 2012 at 11:55:09AM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The previous definition of e.g. for_each_*() would always include the
> very first object within the list of processed labels, irrespective of
> whether it was marked deleted, since the deleted flag was not checked
> on the first object, but only on any "next" object.
> 
> Fix for_each_*() to call skip_deleted_*() prior to every loop iteration,
> including the first, i.e. as part of the for loop test expression rather
> than as part of the increment statement, to correct this.

Um, so, the patch is great now, but with the simplified
implementation, this part of the comment is no longer accurate.

> Incidentally, this change is why commit 45013d8 dtc: "Add ability to
> delete nodes and properties" only caused two "make checkm" failures;
> only two tests actually use multiple labels on the same property or
> node. With this current change applied, but commit 317a5d9 "dtc: zero
> out new label objects" reverted, "make checkm" fails 29 times; i.e.
> for every test that uses any labels at all.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2:
> * Simplified for_each_*() implementation per suggestion from David
>   Gibson.
> * Added a test-case for this bug, which was verified to fail without
>   this code change.
> ---
>  dtc.h                                     |   44 ++++++----------------------
>  tests/delete_reinstate_multilabel.dts     |   37 ++++++++++++++++++++++++
>  tests/delete_reinstate_multilabel_ref.dts |    9 ++++++
>  tests/run_tests.sh                        |    3 ++
>  4 files changed, 59 insertions(+), 34 deletions(-)
>  create mode 100644 tests/delete_reinstate_multilabel.dts
>  create mode 100644 tests/delete_reinstate_multilabel_ref.dts
> 
> diff --git a/dtc.h b/dtc.h
> index d501c86..3e42a07 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -161,51 +161,27 @@ struct node {
>  	struct label *labels;
>  };
>  
> -static inline struct label *for_each_label_next(struct label *l)
> -{
> -	do {
> -		l = l->next;
> -	} while (l && l->deleted);
> -
> -	return l;
> -}
> -
> -#define for_each_label(l0, l) \
> -	for ((l) = (l0); (l); (l) = for_each_label_next(l))
> -
>  #define for_each_label_withdel(l0, l) \
>  	for ((l) = (l0); (l); (l) = (l)->next)
>  
> -static inline struct property *for_each_property_next(struct property *p)
> -{
> -	do {
> -		p = p->next;
> -	} while (p && p->deleted);
> -
> -	return p;
> -}
> -
> -#define for_each_property(n, p) \
> -	for ((p) = (n)->proplist; (p); (p) = for_each_property_next(p))
> +#define for_each_label(l0, l) \
> +	for_each_label_withdel(l0, l) \
> +		if (!(l)->deleted)
>  
>  #define for_each_property_withdel(n, p) \
>  	for ((p) = (n)->proplist; (p); (p) = (p)->next)
>  
> -static inline struct node *for_each_child_next(struct node *c)
> -{
> -	do {
> -		c = c->next_sibling;
> -	} while (c && c->deleted);
> -
> -	return c;
> -}
> -
> -#define for_each_child(n, c) \
> -	for ((c) = (n)->children; (c); (c) = for_each_child_next(c))
> +#define for_each_property(n, p) \
> +	for_each_property_withdel(n, p) \
> +		if (!(p)->deleted)
>  
>  #define for_each_child_withdel(n, c) \
>  	for ((c) = (n)->children; (c); (c) = (c)->next_sibling)
>  
> +#define for_each_child(n, c) \
> +	for_each_child_withdel(n, c) \
> +		if (!(c)->deleted)
> +
>  void add_label(struct label **labels, char *label);
>  void delete_labels(struct label **labels);
>  
> diff --git a/tests/delete_reinstate_multilabel.dts b/tests/delete_reinstate_multilabel.dts
> new file mode 100644
> index 0000000..281a6b2
> --- /dev/null
> +++ b/tests/delete_reinstate_multilabel.dts
> @@ -0,0 +1,37 @@
> +/dts-v1/;
> +
> +/* Create some nodes and properties with multiple labels */
> +
> +/ {
> +	label1: label2: prop = "value";
> +
> +	label3: label4: node {
> +		label5: label6: prop = "value";
> +	};
> +};
> +
> +/* Delete them, and everything that's part of them, i.e. the labels */
> +
> +/ {
> +	/delete-property/ prop;
> +	/delete-node/ node;
> +};
> +
> +/*
> + * Re-instate them. None of the old labels should come back
> + *
> + * Note: Do not add any new/extra labels here. As of the time of writing,
> + * when dtc adds labels to an object, they are added to the head of the list
> + * of labels, and this test is specifically about ensuring the correct
> + * handling of lists of labels where the first label in the list is marked as
> + * deleted. Failure to observe this note may result in the test passing when
> + * it should not.
> + */
> +
> +/ {
> +	prop = "value";
> +
> +	node {
> +		prop = "value";
> +	};
> +};
> diff --git a/tests/delete_reinstate_multilabel_ref.dts b/tests/delete_reinstate_multilabel_ref.dts
> new file mode 100644
> index 0000000..28fa117
> --- /dev/null
> +++ b/tests/delete_reinstate_multilabel_ref.dts
> @@ -0,0 +1,9 @@
> +/dts-v1/;
> +
> +/ {
> +	prop = "value";
> +
> +	node {
> +		prop = "value";
> +	};
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 9ca45c9..dd7f217 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -376,6 +376,9 @@ dtc_tests () {
>      run_dtc_test -I dts -O dtb -o dtc_tree1_delete.test.dtb test_tree1_delete.dts
>      tree1_tests dtc_tree1_delete.test.dtb
>  
> +    run_dtc_test -I dts -O dts -o delete_reinstate_multilabel.dts.test.dts delete_reinstate_multilabel.dts
> +    run_wrap_test cmp delete_reinstate_multilabel.dts.test.dts delete_reinstate_multilabel_ref.dts
> +
>      # Check some checks
>      check_tests dup-nodename.dts duplicate_node_names
>      check_tests dup-propname.dts duplicate_property_names

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
