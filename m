From: Chintan Pandya <cpandya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2] of: use hash based search in of_find_node_by_phandle
Date: Mon, 29 Jan 2018 13:04:50 +0530
Message-ID: <b20292f5-e080-2b66-bae6-4a230cb0627a@codeaurora.org>
References: <1516955496-17236-1-git-send-email-cpandya@codeaurora.org>
 <f08592cf-5e49-e631-c481-e166b741f25e@prevas.dk>
 <aa84e40d-5032-1d1d-6146-391ca1e5e528@codeaurora.org>
 <CAL_JsqJ=6bmOZCsj=NVthgXsZRRjyhQUDv0-CrngF_1MaYtKqA@mail.gmail.com>
 <20180126213943.7zwijanlbrq3y666@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180126213943.7zwijanlbrq3y666@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> I was curious, so I implemented it. It ends up being similar to Rasmus's
> 1st suggestion. The difference is we don't try to store all entries, but
> rather implement a hash table that doesn't handle collisions. Relying on
> the fact that phandles are just linearly allocated from 0, we just mask
> the high bits of the phandle to get the index.
I think this is most resourceful way.
> Can you try out on your setup and try different
> array sizes.
Here are my test results. However, I simply considered overall boot time to
compare different scenarios because profiling of_find_node_by_phandle() in
early boot fails.

Scenarios:
[1] Cache size 1024 + early cache build up [Small change in your cache 
patch,
     see the patch below]
[2] Hash 64 approach[my original v2 patch]
[3] Cache size 64
[4] Cache size 128
[5] Cache size 256
[6] Base build

Result (boot to shell in sec):
[1] 14.292498 14.370994 14.313537 --> 850ms avg gain
[2] 14.340981 14.395900 14.398149 --> 800ms avg gain
[3] 14.546429 14.488783 14.468694 --> 680ms avg gain
[4] 14.506007 14.497487 14.523062 --> 670ms avg gain
[5] 14.671100 14.643344 14.731853 --> 500ms avg gain
[6] 15.263386 15.246155 15.041847 --> 0

Previously reported 400ms gain for [2] was from different set up. These 
tests
and new data is from my own debug set up. When we take any of these patch to
production, result might deviate accordingly.

Chintan Pandya

Patch for the case [1]
<--------------------------------------------------------------------------->

diff --git a/drivers/of/base.c b/drivers/of/base.c
index a0bccb5..671e7cf 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1084,6 +1084,8 @@ int of_modalias_node(struct device_node *node, 
char *modalias, int len)
  }
  EXPORT_SYMBOL_GPL(of_modalias_node);

+struct device_node *phandle_cache[PHANDLE_CACHE_SZ];
+
  /**
   * of_find_node_by_phandle - Find a node given a phandle
   * @handle:    phandle of the node to find
@@ -1100,9 +1102,15 @@ struct device_node 
*of_find_node_by_phandle(phandle handle)
                 return NULL;

         raw_spin_lock_irqsave(&devtree_lock, flags);
-       for_each_of_allnodes(np)
-               if (np->phandle == handle)
-                       break;
+       np = phandle_cache[PHANDLE_CACHE_HASH(handle)];
+       if (!np || np->phandle != handle) {
+               for_each_of_allnodes(np)
+                       if (np->phandle == handle) {
+ phandle_cache[PHANDLE_CACHE_HASH(handle)] = np;
+                               break;
+                       }
+
+       }
         of_node_get(np);
         raw_spin_unlock_irqrestore(&devtree_lock, flags);
         return np;
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index c0914fb..e90a458 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -227,6 +227,9 @@ static void populate_properties(const void *blob,
                 pprev      = &pp->next;
         }

+       if (!dryrun && np->phandle)
+               phandle_cache[PHANDLE_CACHE_HASH(np->phandle)] = np;
+
         /* With version 0x10 we may not have the name property,
          * recreate it here from the unit name if absent
          */
diff --git a/include/linux/of.h b/include/linux/of.h
index 299aeb1..b1200be 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -92,6 +92,10 @@ struct of_phandle_iterator {
         struct device_node *node;
  };

+#define PHANDLE_CACHE_SZ       1024
+#define PHANDLE_CACHE_HASH(x)  ((x) & (PHANDLE_CACHE_SZ - 1))
+extern struct device_node *phandle_cache[PHANDLE_CACHE_SZ];
+
  struct of_reconfig_data {
         struct device_node      *dn;
         struct property         *prop;

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
