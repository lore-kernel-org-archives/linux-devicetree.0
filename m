From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 01/54] MAINTAINERS: Add file patterns for ion device tree
 bindings
Date: Sun, 22 May 2016 11:05:38 +0200
Message-ID: <1463907991-7916-2-git-send-email-geert@linux-m68k.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: devel@driverdev.osuosl.org, Geert Uytterhoeven <geert@linux-m68k.org>, Sumit Semwal <sumit.semwal@linaro.org>
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laura Abbott <labbott@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: devel@driverdev.osuosl.org
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 283f35b6be6907f5..6b4b2447589f36fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -781,6 +781,7 @@ M:	Laura Abbott <labbott@redhat.com>
 M:	Sumit Semwal <sumit.semwal@linaro.org>
 L:	devel@driverdev.osuosl.org
 S:	Supported
+F:	Documentation/devicetree/bindings/staging/ion/
 F:	drivers/staging/android/ion
 F:	drivers/staging/android/uapi/ion.h
 F:	drivers/staging/android/uapi/ion_test.h
-- 
1.9.1
