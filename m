From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: [RFC PATCH 3.7.0-rc2] dt: match id-table before creating platform
 device
Date: Tue, 23 Oct 2012 11:30:59 +0100
Message-ID: <1350988259-22767-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>

As part of of_platform_populate call, the existing code iterates each
child node and then creates a platform device for each child, however
there is bug in the code which does not check the match table before
creating the platform device. This might result creating two platfrom
devices and also invoking driver probe twice, which is incorrect.

This patch moves a existing of_match_node check to start of the function
to fix the bug, doing this way will return immediately without creating
any datastructures if the child does not match the supplied match-table.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
---
 drivers/of/platform.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index b80891b..1aaa560 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -367,6 +367,9 @@ static int of_platform_bus_create(struct device_node *bus,
 		return 0;
 	}
 
+	if (!of_match_node(matches, bus))
+		return 0;
+
 	auxdata = of_dev_lookup(lookup, bus);
 	if (auxdata) {
 		bus_id = auxdata->name;
@@ -379,7 +382,7 @@ static int of_platform_bus_create(struct device_node *bus,
 	}
 
 	dev = of_platform_device_create_pdata(bus, bus_id, platform_data, parent);
-	if (!dev || !of_match_node(matches, bus))
+	if (!dev)
 		return 0;
 
 	for_each_child_of_node(bus, child) {
-- 
1.7.0.4
