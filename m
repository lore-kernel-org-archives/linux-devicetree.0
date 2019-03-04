Return-Path: <SRS0=AB2r=RH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from aserp2130.oracle.com ([141.146.126.79]:59902 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfCDNX2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 Mar 2019 08:23:28 -0500
Date: Mon, 4 Mar 2019 16:23:13 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] of: unittest: Add phandle remapping test
Message-ID: <20190304132313.GA7035@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
To: stephen.boyd@linaro.org
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hello Stephen Boyd,

The patch 357aa4b61c82: "of: unittest: Add phandle remapping test"
from Jan 30, 2018, leads to the following static checker warning:

	drivers/of/unittest.c:567 of_unittest_parse_phandle_with_args_map()
	error: potential zalloc NULL dereference: 'args.np'

drivers/of/unittest.c
    511 	for (i = 0; i < 8; i++) {
    512 		bool passed = true;
    513 
    514 		memset(&args, 0, sizeof(args));
                               ^^^^^
args.np set to NULL.

    515 		rc = of_parse_phandle_with_args_map(np, "phandle-list",
    516 						    "phandle", i, &args);
                                                                          ^^^^^

A bunch of error paths don't set args.np.

    517 
    518 		/* Test the values from tests-phandle.dtsi */
    519 		switch (i) {
    520 		case 0:
    521 			passed &= !rc;
    522 			passed &= (args.np == p1);
    523 			passed &= (args.args_count == 1);
    524 			passed &= (args.args[0] == 1);
    525 			break;
    526 		case 1:
    527 			passed &= !rc;
    528 			passed &= (args.np == p3);
    529 			passed &= (args.args_count == 3);
    530 			passed &= (args.args[0] == 2);
    531 			passed &= (args.args[1] == 5);
    532 			passed &= (args.args[2] == 3);
    533 			break;
    534 		case 2:
    535 			passed &= (rc == -ENOENT);
    536 			break;
    537 		case 3:
    538 			passed &= !rc;
    539 			passed &= (args.np == p0);
    540 			passed &= (args.args_count == 0);
    541 			break;
    542 		case 4:
    543 			passed &= !rc;
    544 			passed &= (args.np == p1);
    545 			passed &= (args.args_count == 1);
    546 			passed &= (args.args[0] == 3);
    547 			break;
    548 		case 5:
    549 			passed &= !rc;
    550 			passed &= (args.np == p0);
    551 			passed &= (args.args_count == 0);
    552 			break;
    553 		case 6:
    554 			passed &= !rc;
    555 			passed &= (args.np == p2);
    556 			passed &= (args.args_count == 2);
    557 			passed &= (args.args[0] == 15);
    558 			passed &= (args.args[1] == 0x20);
    559 			break;
    560 		case 7:
    561 			passed &= (rc == -ENOENT);
    562 			break;
    563 		default:
    564 			passed = false;
    565 		}
    566 
--> 567 		unittest(passed, "index %i - data error on node %s rc=%i\n",
    568 			 i, args.np->full_name, rc);
                                    ^^^^^^^^^^^^^^^^^^
Potential NULL dereference.


    569 	}
    570 

regards,
dan carpenter
