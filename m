From: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH 04/11] arm-dt: Add ATAG_DEVTREE tag
Date: Tue, 22 Dec 2009 18:54:56 +0800
Message-ID: <1261479296.246767.738000991632.4.gpush@pororo>
References: <1261479296.245235.191110925832.0.gpush@pororo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1261479296.245235.191110925832.0.gpush@pororo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

We'd like to provide a pointer to the device tree blob through the atags
mechanism, so add a tag type containing a physical dtb pointer.

We won't need a parser for this, as we'll need to do the devtree parsing
a little earlier than other tags.

Signed-off-by: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

---
 arch/arm/include/asm/setup.h |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/include/asm/setup.h b/arch/arm/include/asm/setup.h
index 3fa2555..99ba6db 100644
--- a/arch/arm/include/asm/setup.h
+++ b/arch/arm/include/asm/setup.h
@@ -141,6 +141,13 @@ struct tag_memclk {
 	__u32 fmemclk;
 };
 
+/* OF device tree blob pointer */
+#define ATAG_DEVTREE	0x5441000a
+
+struct tag_devtree {
+	__u32 devtree;		/* physical address */
+};
+
 struct tag {
 	struct tag_header hdr;
 	union {
@@ -153,6 +160,7 @@ struct tag {
 		struct tag_revision	revision;
 		struct tag_videolfb	videolfb;
 		struct tag_cmdline	cmdline;
+		struct tag_devtree	devtree;
 
 		/*
 		 * Acorn specific
