From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/4] usb: atmel_usba_udc: Add at91sam9g45 and at91sam9x5 errata handling
Date: Mon, 15 Dec 2014 14:03:06 +0100
Message-ID: <1418648588-17872-3-git-send-email-boris.brezillon@free-electrons.com>
References: <1418648588-17872-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418648588-17872-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

at91sam9g45 and at91sam9x5 SoCs have an hardware bug forcing us to
generate a pulse on the BIAS signal on "USB end of reset=E2=80=9D and
=E2=80=9CUSB end of resume" events.

Reported-by: Patrice VILCHEZ <patrice.vilchez-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/usb/gadget/udc/atmel_usba_udc.c | 28 +++++++++++++++++++++++++=
++-
 drivers/usb/gadget/udc/atmel_usba_udc.h |  2 ++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadg=
et/udc/atmel_usba_udc.c
index 36fd34b..55c8dde 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.c
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
@@ -331,6 +331,17 @@ static void toggle_bias(struct usba_udc *udc, int =
is_on)
 		udc->errata->toggle_bias(udc, is_on);
 }
=20
+static void generate_bias_pulse(struct usba_udc *udc)
+{
+	if (!udc->bias_pulse_needed)
+		return;
+
+	if (udc->errata && udc->errata->pulse_bias)
+		udc->errata->pulse_bias(udc);
+
+	udc->bias_pulse_needed =3D false;
+}
+
 static void next_fifo_transaction(struct usba_ep *ep, struct usba_requ=
est *req)
 {
 	unsigned int transaction_len;
@@ -1607,6 +1618,7 @@ static irqreturn_t usba_udc_irq(int irq, void *de=
vid)
 	if (status & USBA_DET_SUSPEND) {
 		toggle_bias(udc, 0);
 		usba_writel(udc, INT_CLR, USBA_DET_SUSPEND);
+		udc->bias_pulse_needed =3D true;
 		DBG(DBG_BUS, "Suspend detected\n");
 		if (udc->gadget.speed !=3D USB_SPEED_UNKNOWN
 				&& udc->driver && udc->driver->suspend) {
@@ -1624,6 +1636,7 @@ static irqreturn_t usba_udc_irq(int irq, void *de=
vid)
=20
 	if (status & USBA_END_OF_RESUME) {
 		usba_writel(udc, INT_CLR, USBA_END_OF_RESUME);
+		generate_bias_pulse(udc);
 		DBG(DBG_BUS, "Resume detected\n");
 		if (udc->gadget.speed !=3D USB_SPEED_UNKNOWN
 				&& udc->driver && udc->driver->resume) {
@@ -1659,6 +1672,7 @@ static irqreturn_t usba_udc_irq(int irq, void *de=
vid)
 		struct usba_ep *ep0;
=20
 		usba_writel(udc, INT_CLR, USBA_END_OF_RESET);
+		generate_bias_pulse(udc);
 		reset_all_endpoints(udc);
=20
 		if (udc->gadget.speed !=3D USB_SPEED_UNKNOWN && udc->driver) {
@@ -1818,13 +1832,25 @@ static void at91sam9rl_toggle_bias(struct usba_=
udc *udc, int is_on)
 		at91_pmc_write(AT91_CKGR_UCKR, uckr & ~(AT91_PMC_BIASEN));
 }
=20
+static void at91sam9g45_pulse_bias(struct usba_udc *udc)
+{
+	unsigned int uckr =3D at91_pmc_read(AT91_CKGR_UCKR);
+
+	at91_pmc_write(AT91_CKGR_UCKR, uckr & ~(AT91_PMC_BIASEN));
+	at91_pmc_write(AT91_CKGR_UCKR, uckr | AT91_PMC_BIASEN);
+}
+
 static const struct usba_udc_errata at91sam9rl_errata =3D {
 	.toggle_bias =3D at91sam9rl_toggle_bias,
 };
=20
+static const struct usba_udc_errata at91sam9g45_errata =3D {
+	.pulse_bias =3D at91sam9g45_pulse_bias,
+};
+
 static const struct of_device_id atmel_udc_dt_ids[] =3D {
 	{ .compatible =3D "atmel,at91sam9rl-udc", .data =3D &at91sam9rl_errat=
a },
-	{ .compatible =3D "atmel,at91sam9g45-udc" },
+	{ .compatible =3D "atmel,at91sam9g45-udc", .data =3D &at91sam9g45_err=
ata },
 	{ .compatible =3D "atmel,sama5d3-udc" },
 	{ /* sentinel */ }
 };
diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.h b/drivers/usb/gadg=
et/udc/atmel_usba_udc.h
index 456899e..72b3537 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.h
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.h
@@ -306,6 +306,7 @@ struct usba_request {
=20
 struct usba_udc_errata {
 	void (*toggle_bias)(struct usba_udc *udc, int is_on);
+	void (*pulse_bias)(struct usba_udc *udc);
 };
=20
 struct usba_udc {
@@ -326,6 +327,7 @@ struct usba_udc {
 	struct clk *pclk;
 	struct clk *hclk;
 	struct usba_ep *usba_ep;
+	bool bias_pulse_needed;
=20
 	u16 devstatus;
=20
--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
