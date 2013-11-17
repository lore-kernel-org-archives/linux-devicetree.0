From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/3] of/selftest: Add self tests for manipulation of properties
Date: Sun, 17 Nov 2013 22:14:39 +0000
Message-ID: <20131117221439.D09A2C406A5@trevor.secretlab.ca>
References: <1384537604-5032-1-git-send-email-grant.likely@linaro.org> < 1384537604-5032-3-git-send-email-grant.likely@linaro.org> < 902D15D9-439C-43BC-BD27-94785DA2F486@antoniou-consulting.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <902D15D9-439C-43BC-BD27-94785DA2F486-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Nathan Fontenot <nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 16 Nov 2013 19:50:37 +0200, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
> Hi Grant,
> 
> On Nov 15, 2013, at 7:46 PM, Grant Likely wrote:
> 
> > Adds a few simple test cases to ensure that addition, update and removal
> > of device tree node properties works correctly.
> > 
> > Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> > Cc: David S. Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
> > Cc: Nathan Fontenot <nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> > Cc: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
> > ---
> > drivers/of/selftest.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++++
> > 1 file changed, 62 insertions(+)
> > 
> > diff --git a/drivers/of/selftest.c b/drivers/of/selftest.c
> > index e21012bde639..cb8d3e722f76 100644
> > --- a/drivers/of/selftest.c
> > +++ b/drivers/of/selftest.c
> > @@ -30,6 +30,67 @@ static struct selftest_results {
> > 	} \
> > }
> > 
> > +static void __init of_selftest_dynamic(void)
> > +{
> > +	struct device_node *np;
> > +	struct property *prop;
> > +
> > +	np = of_find_node_by_path("/testcase-data");
> > +	if (!np) {
> > +		pr_err("missing testcase data\n");
> > +		return;
> > +	}
> > +
> > +	/* Array of 4 properties for the purpose of testing */
> > +	prop = kzalloc(sizeof(*prop) * 4, GFP_KERNEL);
> > +	if (!prop) {
> > +		selftest(0, "kzalloc() failed\n");
> > +		return;
> > +	}
> > +
> > +	/* Add a new property - should pass*/
> > +	prop->name = "new-property";
> > +	prop->value = "new-property-data";
> > +	prop->length = strlen(prop->value);
> > +	selftest(of_add_property(np, prop) == 0, "Adding a new property failed\n");
> > +
> > +	/* Try to add an existing property - should fail */
> > +	prop++;
> > +	prop->name = "new-property";
> > +	prop->value = "new-property-data-should-fail";
> > +	prop->length = strlen(prop->value);
> > +	selftest(of_add_property(np, prop) != 0,
> > +		 "Adding an existing property should have failed\n");
> > +
> > +	/* Try to modify an existing property - should pass */
> > +	prop->value = "modify-property-data-should-pass";
> > +	prop->length = strlen(prop->value);
> > +	selftest(of_update_property(np, prop) == 0,
> > +		 "Updating an existing property should have passed\n");
> > +
> > +	/* Try to modify non-existent property - should pass*/
> > +	prop++;
> > +	prop->name = "modify-property";
> > +	prop->value = "modify-missing-property-data-should-pass";
> > +	prop->length = strlen(prop->value);
> > +	selftest(of_update_property(np, prop) == 0,
> > +		 "Updating a missing property should have passed\n");
> > +
> > +	/* Remove property - should pass */
> > +	selftest(of_remove_property(np, prop) == 0,
> > +		 "Removing a property should have passed\n");
> > +
> > +	/* Adding very large property - should pass */
> > +	prop++;
> > +	prop->name = "large-property-PAGE_SIZEx8";
> > +	prop->length = PAGE_SIZE * 8;
> > +	prop->value = kzalloc(prop->length, GFP_KERNEL);
> > +	selftest(prop->value != NULL, "Unable to allocate large buffer\n");
> > +	if (prop->value)
> > +		selftest(of_add_property(np, prop) == 0,
> > +			 "Adding a large property should have passed\n");
> > +}
> > +
> > static void __init of_selftest_parse_phandle_with_args(void)
> > {
> > 	struct device_node *np;
> > @@ -312,6 +373,7 @@ static int __init of_selftest(void)
> > 	of_node_put(np);
> > 
> > 	pr_info("start of selftest - you will see error messages\n");
> > +	of_selftest_dynamic();
> > 	of_selftest_parse_phandle_with_args();
> > 	of_selftest_property_match_string();
> > 	of_selftest_parse_interrupts();
> > -- 
> > 1.8.3.2
> > 
> 
> I like this. I'll add my overlay test cases somewhere around here.
> 
> I might need to introduce some new helper functions in order to generate
> the overlay completely programmatically.

That would be good. I also really want to get the overlay code working
so I can use it for loading the testcase data on any running system.
:-)

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
