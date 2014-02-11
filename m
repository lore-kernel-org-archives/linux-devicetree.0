From: Valentin Longchamp <valentin.longchamp@keymile.com>
Subject: [PATCH v2 1/2] devicetree: bindings: add Zarlink to the vendor
 prefixes
Date: Tue, 11 Feb 2014 12:50:06 +0100
Message-ID: <1392119407-29490-2-git-send-email-valentin.longchamp@keymile.com>
References: <1392119407-29490-1-git-send-email-valentin.longchamp@keymile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1392119407-29490-1-git-send-email-valentin.longchamp@keymile.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Scott Wood <scottwood@freescale.com>, linuxppc-dev@lists.ozlabs.org
Cc: Valentin Longchamp <valentin.longchamp@keymile.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Even though the company belongs to Microsemi, many chips are still
labeled as Zarlink. Among them is the family of network clock generators,
the zl3034x.

Signed-off-by: Valentin Longchamp <valentin.longchamp@keymile.com>


---
Changes in v2:
- add a patch so that the Zarlink vendor prefix is defined

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index edbb8d8..35f1c9b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -81,3 +81,4 @@ winbond Winbond Electronics corp.
 wlf	Wolfson Microelectronics
 wm	Wondermedia Technologies, Inc.
 xlnx	Xilinx
+zarlink	Zarlink Semiconductor
-- 
1.8.0.1
