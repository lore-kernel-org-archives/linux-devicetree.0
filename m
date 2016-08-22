From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] Documentation: devicetree: changesets do locking on their own meanwhile
Date: Mon, 22 Aug 2016 16:42:58 +0200
Message-ID: <20160822144259.3767-1-wsa+renesas@sang-engineering.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Grant Likely <grant.likely@linaro.org>, linux-renesas-soc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Since commit 183223770ae862 ("drivers/of: Export OF changeset functions"),
the mentioned functions do all necessary locking.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Fixes: 201c910bd6898d ("of: Transactional DT support.")
---
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
