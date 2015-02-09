From: Bo Shen <voice.shen@atmel.com>
Subject: [PATCH 1/3] USB: gadget: at91_udc: add at91sam9n12 support
Date: Mon, 9 Feb 2015 17:02:50 +0800
Message-ID: <1423472572-19824-2-git-send-email-voice.shen@atmel.com>
References: <1423472572-19824-1-git-send-email-voice.shen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1423472572-19824-1-git-send-email-voice.shen@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: balbi@ti.com, nicolas.ferre@atmel.com
Cc: devicetree@vger.kernel.org, Bo Shen <voice.shen@atmel.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add at91sam9n12 SoC support.

Signed-off-by: Bo Shen <voice.shen@atmel.com>
---

 drivers/usb/gadget/udc/at91_udc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/at91_udc.c b/drivers/usb/gadget/udc/at91_udc.c
index c862656..f4c785f 100644
--- a/drivers/usb/gadget/udc/at91_udc.c
+++ b/drivers/usb/gadget/udc/at91_udc.c
@@ -931,7 +931,8 @@ static void pullup(struct at91_udc *udc, int is_on)
 		at91_udp_write(udc, AT91_UDP_TXVC, 0);
 		if (cpu_is_at91rm9200())
 			gpio_set_value(udc->board.pullup_pin, active);
-		else if (cpu_is_at91sam9260() || cpu_is_at91sam9263() || cpu_is_at91sam9g20()) {
+		else if (cpu_is_at91sam9260() || cpu_is_at91sam9263() ||
+			 cpu_is_at91sam9g20() || cpu_is_at91sam9n12()) {
 			u32	txvc = at91_udp_read(udc, AT91_UDP_TXVC);
 
 			txvc |= AT91_UDP_TXVC_PUON;
@@ -949,7 +950,8 @@ static void pullup(struct at91_udc *udc, int is_on)
 		at91_udp_write(udc, AT91_UDP_TXVC, AT91_UDP_TXVC_TXVDIS);
 		if (cpu_is_at91rm9200())
 			gpio_set_value(udc->board.pullup_pin, !active);
-		else if (cpu_is_at91sam9260() || cpu_is_at91sam9263() || cpu_is_at91sam9g20()) {
+		else if (cpu_is_at91sam9260() || cpu_is_at91sam9263() ||
+			 cpu_is_at91sam9g20() || cpu_is_at91sam9n12()) {
 			u32	txvc = at91_udp_read(udc, AT91_UDP_TXVC);
 
 			txvc &= ~AT91_UDP_TXVC_PUON;
@@ -1758,7 +1760,8 @@ static int at91udc_probe(struct platform_device *pdev)
 	}
 
 	/* newer chips have more FIFO memory than rm9200 */
-	if (cpu_is_at91sam9260() || cpu_is_at91sam9g20()) {
+	if (cpu_is_at91sam9260() || cpu_is_at91sam9g20() ||
+	    cpu_is_at91sam9n12()) {
 		udc->ep[0].maxpacket = 64;
 		udc->ep[3].maxpacket = 64;
 		udc->ep[4].maxpacket = 512;
-- 
2.3.0.rc0
