From: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 0/5] fix some type infos and bugs for arm64/of numa
Date: Thu, 2 Jun 2016 10:28:06 +0800
Message-ID: <1464834491-12024-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Zefan Li <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Xinwei Hu <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Tianhong Ding <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

v2 -> v3:
1. Adjust patch2 and patch5 according to Matthias Brugger's advice, to make the
   patches looks more well. The final code have no change. 

v1 -> v2:
1. Base on https://lkml.org/lkml/2016/5/24/679
2. Rewrote of_numa_parse_memory_nodes according to Rob Herring's advice. So that it looks more clear.
3. Rewrote patch 5 because some scenes were not considered before.

Zhen Lei (5):
  of/numa: remove a duplicated pr_debug information
  of/numa: fix a memory@ node can only contains one memory block
  arm64/numa: add nid check for memory block
  of/numa: remove a duplicated warning
  arm64/numa: avoid inconsistent information to be printed

 arch/arm64/mm/numa.c | 11 ++++++++---
 drivers/of/of_numa.c | 42 ++++++++++++------------------------------
 2 files changed, 20 insertions(+), 33 deletions(-)

--
2.5.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
