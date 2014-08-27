From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 02/16] devicetree: Add vendor prefix "thine" to
 vendor-prefixes.txt
Date: Wed, 27 Aug 2014 18:40:59 +0200
Message-ID: <1409157673-4154-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1409157673-4154-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1409157673-4154-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-sh@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Use the company name as vendor prefix.

Cc: devicetree@vger.kernel.org
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 7292cfc..2b5648b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -134,6 +134,7 @@ st	STMicroelectronics
 ste	ST-Ericsson
 stericsson	ST-Ericsson
 synology	Synology, Inc.
+thine	THine Electronics, Inc.
 ti	Texas Instruments
 tlm	Trusted Logic Mobility
 toradex	Toradex AG
-- 
1.8.5.5
