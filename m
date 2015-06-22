From: Jeremy Linton <lintonrjeremy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: pSeries boot failure due to wrong interrupt controller
Date: Mon, 22 Jun 2015 14:44:18 -0500
Message-ID: <CAEFTgiyHkf8ooYdWW0nTLcdraJ_L9FpLSVZa4KS3CcdpGWJxew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

The OF IRQ logic was refactored a while back, and it appears that it
broke the case where a device doesn't have an interrupt-map
(legacy/ISA platform peripherals). In particular on the older pSeries
platforms the console serial port (keyboard/etc) is attached via a
Winbond super I/O controller. With the refactored logic
of_irq_parse_raw() returns with the out_irq->np pointing at the bus,
rather than the interrupt controller. This results in the platform
logic getting confused about the appropriate interrupt host, and in
ics_rtas_host_match() it doesn't match "chrp,iic" and the xics takes
over and tries to use RTAS to map the interrupt. RTAS then crashes the
machine.

This tweaks the "-> no map, getting parent" behavior to behave as
before, and the machine boots.

Thanks

Signed-off-by: Jeremy Linton <lintonrjeremy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 1a79806..78b4161b 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -252,7 +252,6 @@ int of_irq_parse_raw(const __be32 *addr, struct
of_phandle_args *out_irq)
                 * Successfully parsed an interrrupt-map translation; copy new
                 * interrupt specifier into the out_irq structure
                 */
-               out_irq->np = newpar;

                match_array = imap - newaddrsize - newintsize;
                for (i = 0; i < newintsize; i++)
@@ -262,6 +261,7 @@ int of_irq_parse_raw(const __be32 *addr, struct
of_phandle_args *out_irq)

        skiplevel:
                /* Iterate again with new parent */
+               out_irq->np=newpar;
                pr_debug(" -> new parent: %s\n", of_node_full_name(newpar));
                of_node_put(ipar);
                ipar = newpar;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
