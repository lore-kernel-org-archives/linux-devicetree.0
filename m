From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: for_each_xxx_of_node() - lots of refcounting bugs
Date: Tue, 1 Sep 2015 12:07:44 +0100
Message-ID: <20150901110743.GJ21084@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Consider the following loop:

	for_each_child_of_node(&pdev->dev.of_node, child) {
		if (some_condition)
			break;
	}

The use of for_each_..._of_node() leads people to believe that it's
like other for_each_...() loops - the continue and break statements
can be used.

However, with OF, "break" can't be used without disrupting the
reference counting on the nodes.  This is because:

#define for_each_child_of_node(parent, child) \
        for (child = of_get_next_child(parent, NULL); child != NULL; \
             child = of_get_next_child(parent, child))

of_get_next_child() takes a reference on the node it's about to return,
while dropping the reference on the node passed into it.  In the case
of the last iteration, where of_get_next_child() returns NULL, the
previous child will have its reference dropped, resulting in no child
nodes having a reference held.

However, if a 'break' statement is used, the reference on the current
child is not dropped unless code explicitly drops it.

We have code which does exactly this kind of thing:

        for_each_child_of_node(cpus, cpu) {
                /*
                 * A device tree containing CPU nodes with missing "reg"
                 * properties is considered invalid to build the
                 * cpu_logical_map.
                 */
                if (of_property_read_u32(cpu, "reg", &hwid)) {
                        pr_debug(" * %s missing reg property\n",
                                     cpu->full_name);
                        return;
                }

                /*
                 * 8 MSBs must be set to 0 in the DT since the reg property
                 * defines the MPIDR[23:0].
                 */
                if (hwid & ~MPIDR_HWID_BITMASK)
                        return;
... more return statements

        for_each_child_of_node(np, np0) {
                struct device_node *fc;
                int i;

                res = of_dev_hwmod_lookup(np0, oh, &i, &fc);
                if (res == 0) {
                        *found = fc;
                        *index = i;
                        return 0;

        for_each_child_of_node(parent, np) {
                pd = kzalloc(sizeof(*pd), GFP_KERNEL);
                if (!pd)
                        return -ENOMEM;

Virtually _all_ uses of for_each_child_of_node() in the kernel today
where the loop is terminated early leak a reference on the child node.
Even some of the drivers/of code does it:

	... for_each_child_of_node(root, child) {
                if (!of_match_node(matches, child))
                        continue;
                rc = of_platform_bus_create(child, matches, NULL, parent, false);
                if (rc)
                        break;
        }

This pretty much shows the danger of using macros which hide details
like this from the programmer - it leads to the assumption that it's
fine to use 'break' and 'return' without any further consideration,
because that's what you can do in standard C loops.  The fact that
these loops are actually more complex than that is hidden behind the
macro, and thus gets forgotten.

We could go around and fix all these sites, but that's not going to
stop this continuing to happen into the future.  So, fixing the
existing bugs is not a fix at all, it's a papering over of a more
fundamental problem here.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
