From: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v9 02/18] kunit: test: add test resource management API
Date: Mon, 15 Jul 2019 13:24:25 -0700
Message-ID: <20190715202425.CE64C20665@mail.kernel.org>
References: <20190712081744.87097-1-brendanhiggins@google.com>
 <20190712081744.87097-3-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20190712081744.87097-3-brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jpoimboe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, mcgrof-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, tytso-3s7WtUTddSA@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org
Cc: pmladek-IBi9RG/b67k@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amir73il-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alexander.Levin-0li6OtcxBFHby3iVrkZq2A@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, knut.omang-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, wfg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jdike-OPE4K8JWMJJBDgjK7y7TUQ@public.gmane.org, dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tim.Bird-7U/KSKJipcs@public.gmane.org, linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, julia.lawall-L2FTfq7BK8M@public.gmane.org, kunit-dev-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Brendan Higgins (2019-07-12 01:17:28)
> diff --git a/kunit/test.c b/kunit/test.c
> index 571e4c65deb5c..f165c9d8e10b0 100644
> --- a/kunit/test.c
> +++ b/kunit/test.c
> @@ -171,6 +175,96 @@ int kunit_run_tests(struct kunit_suite *suite)
>         return 0;
>  }
>  
> +struct kunit_resource *kunit_alloc_resource(struct kunit *test,
> +                                           kunit_resource_init_t init,
> +                                           kunit_resource_free_t free,
> +                                           void *context)
> +{
> +       struct kunit_resource *res;
> +       int ret;
> +
> +       res = kzalloc(sizeof(*res), GFP_KERNEL);

This uses GFP_KERNEL.

> +       if (!res)
> +               return NULL;
> +
> +       ret = init(res, context);
> +       if (ret)
> +               return NULL;
> +
> +       res->free = free;
> +       mutex_lock(&test->lock);

And this can sleep.

> +       list_add_tail(&res->node, &test->resources);
> +       mutex_unlock(&test->lock);
> +
> +       return res;
> +}
> +
> +void kunit_free_resource(struct kunit *test, struct kunit_resource *res)

Should probably add a note that we assume the test lock is held here, or
even add a lockdep_assert_held(&test->lock) into the function to
document that and assert it at the same time.

> +{
> +       res->free(res);
> +       list_del(&res->node);
> +       kfree(res);
> +}
> +
> +struct kunit_kmalloc_params {
> +       size_t size;
> +       gfp_t gfp;
> +};
> +
> +static int kunit_kmalloc_init(struct kunit_resource *res, void *context)
> +{
> +       struct kunit_kmalloc_params *params = context;
> +
> +       res->allocation = kmalloc(params->size, params->gfp);
> +       if (!res->allocation)
> +               return -ENOMEM;
> +
> +       return 0;
> +}
> +
> +static void kunit_kmalloc_free(struct kunit_resource *res)
> +{
> +       kfree(res->allocation);
> +}
> +
> +void *kunit_kmalloc(struct kunit *test, size_t size, gfp_t gfp)
> +{
> +       struct kunit_kmalloc_params params;
> +       struct kunit_resource *res;
> +
> +       params.size = size;
> +       params.gfp = gfp;
> +
> +       res = kunit_alloc_resource(test,

This calls that sleeping function above...

> +                                  kunit_kmalloc_init,
> +                                  kunit_kmalloc_free,
> +                                  &params);

but this passes a GFP flags parameter through to the
kunit_kmalloc_init() function. How is this going to work if some code
uses GFP_ATOMIC, but then we try to allocate and sleep in
kunit_alloc_resource() with GFP_KERNEL? 

One solution would be to piggyback on all the existing devres allocation
logic we already have and make each struct kunit a device that we pass
into the devres functions. A far simpler solution would be to just
copy/paste what devres does and use a spinlock and an allocation
function that takes GFP flags.

> +
> +       if (res)
> +               return res->allocation;
> +
> +       return NULL;
> +}
