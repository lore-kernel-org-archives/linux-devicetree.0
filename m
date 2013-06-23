From: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Subject: [PATCH] dt: Typo fix
Date: Sun, 23 Jun 2013 13:40:02 +0400
Message-ID: <1371980402-27620-1-git-send-email-shc_work@mail.ru>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Signed-off-by: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
---
 Documentation/devicetree/bindings/net/can/sja1000.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/can/sja1000.txt b/Documentation/devicetree/bindings/net/can/sja1000.txt
index c2dbcec..f2105a4 100644
--- a/Documentation/devicetree/bindings/net/can/sja1000.txt
+++ b/Documentation/devicetree/bindings/net/can/sja1000.txt
@@ -37,7 +37,7 @@ Optional properties:
 	If not specified or if the specified value is 0, the CLKOUT pin
 	will be disabled.
 
-- nxp,no-comparator-bypass : Allows to disable the CAN input comperator.
+- nxp,no-comparator-bypass : Allows to disable the CAN input comparator.
 
 For further information, please have a look to the SJA1000 data sheet.
 
-- 
1.8.1.5
