From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 1/2] dtc: Adjust .gitignore to be in alphabetical order
Date: Thu, 19 Apr 2012 09:33:35 -0700
Message-ID: <1334853216-16337-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is the intent, so correct it.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Split ordering change into a separate patch

 tests/.gitignore |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/.gitignore b/tests/.gitignore
index 0b71bcf..cca3dbc 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -10,6 +10,8 @@ tmp.*
 /del_node
 /del_property
 /dtbs_equal_ordered
+/dtbs_equal_unordered
+/dtb_reverse
 /dumptrees
 /extra-terminating-null
 /find_property
@@ -50,5 +52,3 @@ tmp.*
 /truncated_property
 /utilfdt_test
 /value-labels
-/dtb_reverse
-/dtbs_equal_unordered
-- 
1.7.7.3
