From: Stafford Horne <shorne@gmail.com>
Subject: [PATCH v4 04/13] dt-bindings: add openrisc to vendor prefixes list
Date: Mon, 30 Oct 2017 08:11:14 +0900
Message-ID: <20171029231123.27281-5-shorne@gmail.com>
References: <20171029231123.27281-1-shorne@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171029231123.27281-1-shorne@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Stafford Horne <shorne@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Kevin Hilman <khilman@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, SZ Lin <sz.lin@moxa.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add OpenRISC.io to vendor prefixes.  This is reserved for softcores
developed by the OpenRISC community.  The OpenRISC community has
separated from OpenCores.org requiring a new prefix.

Reviewed-by: Andreas Färber <afaerber@suse.de>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---

Changes since v2
 - None

Changes since v1
 - New patch

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 1ea1fd4232ab..1478aad87532 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -246,6 +246,7 @@ onion	Onion Corporation
 onnn	ON Semiconductor Corp.
 ontat	On Tat Industrial Company
 opencores	OpenCores.org
+openrisc	OpenRISC.io
 option	Option NV
 ORCL	Oracle Corporation
 ortustech	Ortus Technology Co., Ltd.
-- 
2.13.6
