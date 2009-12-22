From: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH 06/11] arm-dt: postpone machine detection until setup_arch
	with CONFIG_ARM_DEVTREE
Date: Tue, 22 Dec 2009 18:54:56 +0800
Message-ID: <1261479296.247430.731563214048.6.gpush@pororo>
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

When we're using CONFIG_ARM_DEVTREE, we need to postpone machine detection
until later in setup_arch. Because ARM_DEVTREE depends on !DEBUG_LL,
we don't need the mdesc this early anyway.

We'll add support for ARM_DEVTREE && DEBUG_LL later.

Signed-off-by: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

---
 arch/arm/kernel/head.S |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
index 38ccbe1..66bb56f 100644
--- a/arch/arm/kernel/head.S
+++ b/arch/arm/kernel/head.S
@@ -82,9 +82,18 @@ ENTRY(stext)
 	bl	__lookup_processor_type		@ r5=procinfo r9=cpuid
 	movs	r10, r5				@ invalid processor (r5=0)?
 	beq	__error_p			@ yes, error 'p'
+
+	/* If we're using the device tree for machine detection, we don't
+	 * look for a machinfo here, as we'll dynamically create one in
+	 * setup_arch(). ARM_DEVTREE depends on !DEBUG_LL, so we won't need
+	 * any machinfo fields 'til later.
+	 */
+#ifndef CONFIG_ARM_DEVTREE
 	bl	__lookup_machine_type		@ r5=machinfo
 	movs	r8, r5				@ invalid machine (r5=0)?
 	beq	__error_a			@ yes, error 'a'
+#endif
+
 	bl	__vet_atags
 	bl	__create_page_tables
