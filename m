From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 1/4] ARM: BCM2835: Add a function for doing an rmb() between device reads.
Date: Thu, 12 Mar 2015 19:32:13 -0700
Message-ID: <1426213936-4139-1-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Stephen Warren was concerned that the rmb() present in the new mailbox
driver was unnecessary, and after seeing the docs, that it was just so
surprising that somebody would come along and remove it later.  The
explanation for the need for the rmb() is long enough that we won't
want to place it at every callsite.  Make a wrapper with the whole
explanation in it, so that anyone wondering what's going on sees the
docs right there.

Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
---
 include/soc/bcm2835/peripheral-workaround.h | 75 +++++++++++++++++++++=
++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 include/soc/bcm2835/peripheral-workaround.h

diff --git a/include/soc/bcm2835/peripheral-workaround.h b/include/soc/=
bcm2835/peripheral-workaround.h
new file mode 100644
index 0000000..4541a13
--- /dev/null
+++ b/include/soc/bcm2835/peripheral-workaround.h
@@ -0,0 +1,75 @@
+/*
+ * Copyright =C2=A9 2015 Broadcom
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+static inline void bcm2835_peripheral_read_workaround(void)
+{
+#ifdef CONFIG_ARCH_BCM2835
+	/*
+	 * The BCM2835 bus is unusual in that it doesn't guarantee
+	 * ordering between reads from different peripherals (where
+	 * peripherals roughly correspond to Linux devices).  From
+	 * BCM2835 ARM Peripherals.pdf, page 7:
+	 *
+	 *     "In order to keep the system complexity low and data
+	 *      throughput high, the BCM2835 AXI system does not
+	 *      always return read data in-order. The GPU has special
+	 *      logic to cope with data arriving out-of-order; however
+	 *      the ARM core does not contain such logic. Therefore
+	 *      some precautions must be taken when using the ARM to
+	 *      access peripherals.
+	 *
+	 *      Accesses to the same peripheral will always arrive and
+	 *      return in-order. It is only when switching from one
+	 *      peripheral to another that data can arrive
+	 *      out-of-order. The simplest way to make sure that data
+	 *      is processed in-order is to place a memory barrier
+	 *      instruction at critical positions in the code. You
+	 *      should place:
+	 *
+	 *      =E2=80=A2 A memory write barrier before the first write to a
+	 *        peripheral.
+	 *      =E2=80=A2 A memory read barrier after the last read of a
+	 *        peripheral."
+	 *
+	 * The footnote explicitly says that:
+	 *
+	 *      "For example:
+	 *
+	 *         a_status =3D *pointer_to_peripheral_a;
+	 *         b_status =3D *pointer_to_peripheral_b;
+	 *
+	 *       Without precuations the values ending up in the
+	 *       variables a_status and b_status can be swapped
+	 *       around."
+	 *
+	 * However, it also notes that, somewhat contrary to the first
+	 * bullet point:
+	 *
+	 *     "It is theoretical possible for writes to go =E2=80=98wrong=E2=
=80=99
+	 *      but that is far more difficult to achieve. The AXI
+	 *      system makes sure the data always arrives in-order at
+	 *      its intended destination. So:
+	 *
+	 *        *pointer_to_peripheral_a =3D value_a;
+	 *        *pointer_to_peripheral_b =3D value_b;
+	 *
+	 *      will always give the expected result. The only time
+	 *      write data can arrive out-of-order is if two different
+	 *      peripherals are connected to the same external
+	 *      equipment"
+	 *
+	 * Since we aren't interacting with multiple peripherals
+	 * connected to the same external equipment as far as we know,
+	 * that means that we only need to handle the read workaround
+	 * case.  We do so by placing an rmb() at the first device
+	 * read acceess in a given driver path, including the
+	 * interrupt handlers.
+	 */
+	rmb();
+#endif
+}
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
