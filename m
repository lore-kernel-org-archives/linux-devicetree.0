From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH RFC 0/2] of/unittest: Add reference count tests
Date: Fri, 23 Jan 2015 17:10:03 +0100
Message-ID: <1422029405-9353-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

	Hi Grant, Rob,

This patch series adds tests to detect reference count imbalances.
The tests use a fixed list of paths to devices nodes (required device
nodes in a minimal DTS, and device nodes present in unittest-data).
I considered scanning for all present device node instead, but these
are more likely to change while running the test.

These tests are executed only if CONFIG_OF_DYNAMIC=y.

Patches are against devicetree/next, with "[PATCH] of: Add missing
of_node_put() in of_find_node_by_path()" (or the alternative proposed
by Grant) applied.

Note that it shows 44 failures, which I haven't investigated yet:

### dt-test ### start of selftest - you will see error messages
### dt-test ### FAIL of_selftest_refcnt():1512 /testcase-data/duplicate-name#1: not found
### dt-test ### FAIL of_selftest_refcnt():1512 /testcase-data/duplicate-name#1: not found
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data: expected:23 got:25
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/interrupts/intc0: expected:2 got:19
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/interrupts/intc1: expected:2 got:9
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/interrupts/intc2: expected:2 got:8
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/interrupts/intmap0: expected:4 got:7
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/interrupts/intmap1: expected:4 got:5
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/platform-tests: expected:4 got:5
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/phandle-tests/consumer-a: expected:4 got:6
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/phandle-tests/provider0: expected:2 got:3
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/phandle-tests/provider1: expected:2 got:4
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/phandle-tests/provider2: expected:2 got:4
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/phandle-tests/provider3: expected:2 got:3
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/match-node/a/name2: expected:2 got:3
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/match-node/b/name2: expected:2 got:3
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/match-node/c/name2: expected:2 got:3
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/match-node/name0: expected:2 got:3
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/match-node/name1: expected:2 got:3
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/match-node/name3: expected:2 got:3
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/match-node/name4: expected:2 got:3
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/match-node/name5: expected:2 got:3
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/match-node/name6: expected:2 got:3
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/match-node/name7: expected:2 got:3
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/match-node/name8: expected:2 got:3
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/match-node/name9: expected:2 got:3
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/overlay-node/test-bus: expected:12 got:16
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/overlay-node/test-bus/test-selftest100: expected:2 got:4
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/overlay-node/test-bus/test-selftest0: expected:2 got:6
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/overlay-node/test-bus/test-selftest1: expected:2 got:4
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/overlay-node/test-bus/test-selftest2: expected:2 got:6
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/overlay-node/test-bus/test-selftest3: expected:2 got:4
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/overlay0/fragment@0/__overlay__: expected:2 got:3
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/overlay1/fragment@0/__overlay__: expected:2 got:3
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/overlay2/fragment@0/__overlay__: expected:2 got:3
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/overlay3/fragment@0/__overlay__: expected:2 got:3
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/overlay4/fragment@0/__overlay__: expected:3 got:4
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/overlay6: expected:3 got:4
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/overlay7: expected:3 got:4
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/overlay8: expected:3 got:4
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/overlay9: expected:3 got:4
### dt-test ### FAIL of_selftest_refcnt():1512 /testcase-data/duplicate-name#1: not found
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/testcase-device1: expected:4 got:6
### dt-test ### FAIL of_selftest_refcnt():1522 /testcase-data/testcase-device2: expected:4 got:6
### dt-test ### end of selftest - 619 passed, 44 failed

Geert Uytterhoeven (2):
  of: Allow selection of OF_DYNAMIC and OF_OVERLAY if OF_UNITTEST
  of/unittest: Add reference count tests

 drivers/of/Kconfig    |  13 ++++-
 drivers/of/unittest.c | 155 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 166 insertions(+), 2 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
