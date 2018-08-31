Return-Path: <SRS0=dj/7=LO=oracle.com=dan.carpenter@kernel.org>
Date: Fri, 31 Aug 2018 20:39:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] of/unittest: remove use of node name pointer in overlay
 high level test
Message-ID: <20180831173928.bbt6a5ttrtgzbabk@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: robh@kernel.org
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hello Rob Herring,

The patch 4785d169abd5: "of/unittest: remove use of node name pointer
in overlay high level test" from Aug 27, 2018, leads to the following
static checker warning:

	drivers/of/unittest.c:2356 of_unittest_overlay_high_level()
	info: ignoring unreachable code.

drivers/of/unittest.c
  2354          for_each_child_of_node(overlay_base_root, np) {
  2355                  struct device_node *base_child;
  2356                  for_each_child_of_node(of_root, base_child) {
  2357                          if (!strcmp(np->full_name, base_child->full_name))
  2358                                  unittest(0, "illegal node name in overlay_base %pOFn",
  2359                                          np);
  2360                          return;

You wanted to only return on error probably?  Smatch is complaining
that we don't iterate through the inside loop more than once.

  2361                  }
  2362          }
  2363  

regards,
dan carpenter
