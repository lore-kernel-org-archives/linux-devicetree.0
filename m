From: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
Subject: [PATCH v2] Documentation: devicetree: changesets do locking on their own meanwhile
Date: Wed, 24 Aug 2016 15:38:56 +0200
Message-ID: <20160824133900.7282-1-wsa+renesas@sang-engineering.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Since commit 183223770ae862 ("drivers/of: Export OF changeset functions"),
the mentioned functions do all necessary locking.

Signed-off-by: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
Fixes: 183223770ae862 ("drivers/of: Export OF changeset functions")
---

V2: corrected the "Fixes" tag

 Documentation/devicetree/changesets.txt | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/changesets.txt b/Documentation/devicetree/changesets.txt
index 935ba5acc34e6c..cb488eeb635372 100644
--- a/Documentation/devicetree/changesets.txt
+++ b/Documentation/devicetree/changesets.txt
@@ -21,20 +21,11 @@ a set of changes. No changes to the active tree are made at this point.
 All the change operations are recorded in the of_changeset 'entries'
 list.
 
-3. mutex_lock(of_mutex) - starts a changeset; The global of_mutex
-ensures there can only be one editor at a time.
-
-4. of_changeset_apply() - Apply the changes to the tree. Either the
+3. of_changeset_apply() - Apply the changes to the tree. Either the
 entire changeset will get applied, or if there is an error the tree will
-be restored to the previous state
-
-5. mutex_unlock(of_mutex) - All operations complete, release the mutex
+be restored to the previous state. The core ensures proper serialization
+through locking. An unlocked version __of_changeset_apply is available,
+if needed.
 
 If a successfully applied changeset needs to be removed, it can be done
-with the following sequence.
-
-1. mutex_lock(of_mutex)
-
-2. of_changeset_revert()
-
-3. mutex_unlock(of_mutex)
+with of_changeset_revert().
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
