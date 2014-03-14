From: Grant Likely <grant.likely@linaro.org>
Subject: [RFC v3 0/3] Add aliases parsing to of_find_node_by_path()
Date: Fri, 14 Mar 2014 17:11:46 +0000
Message-ID: <1394817109-26199-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
List-Id: devicetree@vger.kernel.org

Searching for a node by path should also take into account an /aliases
reference. This series reworks the of_find_node_by_path() code to handle
that use-case easily. It also makes it possible to start a search at a
child node, which Pantelis needs for the FDT overlay work.

I've done some simple testing on this series, but it needs a lot more
attention and the testcases can use beefing up.
