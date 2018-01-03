From: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [PATCH v17 0/5] ZII RAVE platform driver
Date: Wed, 3 Jan 2018 15:39:58 -0800
Message-ID: <20180103153958.79d0fb24507824df3db0fd31@linux-foundation.org>
References: <20171221065118.29726-1-andrew.smirnov@gmail.com>
        <20180102151722.padevvmko7cmh7qv@dell>
        <CAHQ1cqEbesz4esB2Y79a5VERnR3O=hbX00ikH35psO2b-HNJ6g@mail.gmail.com>
        <20180103094621.su4umg2l5hggktlj@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180103094621.su4umg2l5hggktlj@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Chris Healy <cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 3 Jan 2018 09:46:21 +0000 Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> Well I guess we better at least include them in the conversation.
> 
> Stephen and Andrew added.
> 
> On Tue, 02 Jan 2018, Andrey Smirnov wrote:
> > On Tue, Jan 2, 2018 at 7:17 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > > On Wed, 20 Dec 2017, Andrey Smirnov wrote:
> > >
> > >> Everyone:
> > >>
> > >> This patch series is v17 of the driver for supervisory processor found
> > >> on RAVE series of devices from ZII. Supervisory processor is a PIC
> > >> microcontroller connected to various electrical subsystems on RAVE
> > >> devices whose firmware implements protocol to command/qery them.
> > >>
> > >> NOTE:
> > >>
> > >>  * This driver dependends on crc_ccitt_false(), added by
> > >>    2da9378d531f8cc6670c7497f20d936b706ab80b in 'linux-next', the patch
> > >>    was pulled in by Andrew Morton and is currently avaiting users, so
> > >>    this series might have to go in through Andrew's tree
> > >
> > > Hmm... well that's annoying!  I just attempted to merge this set, but
> > > early build tests fail due to a dependency already merged into -next.
> > >
> > > ../drivers/mfd/rave-sp.c:227:25: error:
> > >     implicit declaration of function ‘crc_ccitt_false’
> > >     [-Werror=implicit-function-declaration]
> > >
> > > We need to figure out if either of the following are true:
> > >
> > >  - Patch [0] can be dropped from Andrew's tree
> > >    - ... and I can take it via the MFD tree instead

Please merge lib-crc-ccitt-add-ccitt-false-crc16-variant.patch via the
MFD tree, along with its user.  Here's my copy:


From: Andrey Vostrikov <andrey.vostrikov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: lib/crc-ccitt: add CCITT-FALSE CRC16 variant

In support of a soon to be published MFD driver using serdev to talk to
a supervisory processor that uses the CCITT-FALSE CRC16 variant in it's
protocol, this patch was tested successfully on an i.MX6 ARM platform.

Link: http://lkml.kernel.org/r/20170413142932.27287-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Signed-off-by: Andrey Vostrikov <andrey.vostrikov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: Chris Healy <cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
---

 include/linux/crc-ccitt.h |    7 ++++
 lib/crc-ccitt.c           |   58 +++++++++++++++++++++++++++++++++++-
 2 files changed, 64 insertions(+), 1 deletion(-)

diff -puN include/linux/crc-ccitt.h~lib-crc-ccitt-add-ccitt-false-crc16-variant include/linux/crc-ccitt.h
--- a/include/linux/crc-ccitt.h~lib-crc-ccitt-add-ccitt-false-crc16-variant
+++ a/include/linux/crc-ccitt.h
@@ -5,12 +5,19 @@
 #include <linux/types.h>
 
 extern u16 const crc_ccitt_table[256];
+extern u16 const crc_ccitt_false_table[256];
 
 extern u16 crc_ccitt(u16 crc, const u8 *buffer, size_t len);
+extern u16 crc_ccitt_false(u16 crc, const u8 *buffer, size_t len);
 
 static inline u16 crc_ccitt_byte(u16 crc, const u8 c)
 {
 	return (crc >> 8) ^ crc_ccitt_table[(crc ^ c) & 0xff];
 }
 
+static inline u16 crc_ccitt_false_byte(u16 crc, const u8 c)
+{
+    return (crc << 8) ^ crc_ccitt_false_table[(crc >> 8) ^ c];
+}
+
 #endif /* _LINUX_CRC_CCITT_H */
diff -puN lib/crc-ccitt.c~lib-crc-ccitt-add-ccitt-false-crc16-variant lib/crc-ccitt.c
--- a/lib/crc-ccitt.c~lib-crc-ccitt-add-ccitt-false-crc16-variant
+++ a/lib/crc-ccitt.c
@@ -51,8 +51,49 @@ u16 const crc_ccitt_table[256] = {
 };
 EXPORT_SYMBOL(crc_ccitt_table);
 
+/*
+ * Similar table to calculate CRC16 variant known as CRC-CCITT-FALSE
+ * Reflected bits order, does not augment final value.
+ */
+u16 const crc_ccitt_false_table[256] = {
+    0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50A5, 0x60C6, 0x70E7,
+    0x8108, 0x9129, 0xA14A, 0xB16B, 0xC18C, 0xD1AD, 0xE1CE, 0xF1EF,
+    0x1231, 0x0210, 0x3273, 0x2252, 0x52B5, 0x4294, 0x72F7, 0x62D6,
+    0x9339, 0x8318, 0xB37B, 0xA35A, 0xD3BD, 0xC39C, 0xF3FF, 0xE3DE,
+    0x2462, 0x3443, 0x0420, 0x1401, 0x64E6, 0x74C7, 0x44A4, 0x5485,
+    0xA56A, 0xB54B, 0x8528, 0x9509, 0xE5EE, 0xF5CF, 0xC5AC, 0xD58D,
+    0x3653, 0x2672, 0x1611, 0x0630, 0x76D7, 0x66F6, 0x5695, 0x46B4,
+    0xB75B, 0xA77A, 0x9719, 0x8738, 0xF7DF, 0xE7FE, 0xD79D, 0xC7BC,
+    0x48C4, 0x58E5, 0x6886, 0x78A7, 0x0840, 0x1861, 0x2802, 0x3823,
+    0xC9CC, 0xD9ED, 0xE98E, 0xF9AF, 0x8948, 0x9969, 0xA90A, 0xB92B,
+    0x5AF5, 0x4AD4, 0x7AB7, 0x6A96, 0x1A71, 0x0A50, 0x3A33, 0x2A12,
+    0xDBFD, 0xCBDC, 0xFBBF, 0xEB9E, 0x9B79, 0x8B58, 0xBB3B, 0xAB1A,
+    0x6CA6, 0x7C87, 0x4CE4, 0x5CC5, 0x2C22, 0x3C03, 0x0C60, 0x1C41,
+    0xEDAE, 0xFD8F, 0xCDEC, 0xDDCD, 0xAD2A, 0xBD0B, 0x8D68, 0x9D49,
+    0x7E97, 0x6EB6, 0x5ED5, 0x4EF4, 0x3E13, 0x2E32, 0x1E51, 0x0E70,
+    0xFF9F, 0xEFBE, 0xDFDD, 0xCFFC, 0xBF1B, 0xAF3A, 0x9F59, 0x8F78,
+    0x9188, 0x81A9, 0xB1CA, 0xA1EB, 0xD10C, 0xC12D, 0xF14E, 0xE16F,
+    0x1080, 0x00A1, 0x30C2, 0x20E3, 0x5004, 0x4025, 0x7046, 0x6067,
+    0x83B9, 0x9398, 0xA3FB, 0xB3DA, 0xC33D, 0xD31C, 0xE37F, 0xF35E,
+    0x02B1, 0x1290, 0x22F3, 0x32D2, 0x4235, 0x5214, 0x6277, 0x7256,
+    0xB5EA, 0xA5CB, 0x95A8, 0x8589, 0xF56E, 0xE54F, 0xD52C, 0xC50D,
+    0x34E2, 0x24C3, 0x14A0, 0x0481, 0x7466, 0x6447, 0x5424, 0x4405,
+    0xA7DB, 0xB7FA, 0x8799, 0x97B8, 0xE75F, 0xF77E, 0xC71D, 0xD73C,
+    0x26D3, 0x36F2, 0x0691, 0x16B0, 0x6657, 0x7676, 0x4615, 0x5634,
+    0xD94C, 0xC96D, 0xF90E, 0xE92F, 0x99C8, 0x89E9, 0xB98A, 0xA9AB,
+    0x5844, 0x4865, 0x7806, 0x6827, 0x18C0, 0x08E1, 0x3882, 0x28A3,
+    0xCB7D, 0xDB5C, 0xEB3F, 0xFB1E, 0x8BF9, 0x9BD8, 0xABBB, 0xBB9A,
+    0x4A75, 0x5A54, 0x6A37, 0x7A16, 0x0AF1, 0x1AD0, 0x2AB3, 0x3A92,
+    0xFD2E, 0xED0F, 0xDD6C, 0xCD4D, 0xBDAA, 0xAD8B, 0x9DE8, 0x8DC9,
+    0x7C26, 0x6C07, 0x5C64, 0x4C45, 0x3CA2, 0x2C83, 0x1CE0, 0x0CC1,
+    0xEF1F, 0xFF3E, 0xCF5D, 0xDF7C, 0xAF9B, 0xBFBA, 0x8FD9, 0x9FF8,
+    0x6E17, 0x7E36, 0x4E55, 0x5E74, 0x2E93, 0x3EB2, 0x0ED1, 0x1EF0
+};
+EXPORT_SYMBOL(crc_ccitt_false_table);
+
 /**
- *	crc_ccitt - recompute the CRC for the data buffer
+ *	crc_ccitt - recompute the CRC (CRC-CCITT variant) for the data
+ *	buffer
  *	@crc: previous CRC value
  *	@buffer: data pointer
  *	@len: number of bytes in the buffer
@@ -65,5 +106,20 @@ u16 crc_ccitt(u16 crc, u8 const *buffer,
 }
 EXPORT_SYMBOL(crc_ccitt);
 
+/**
+ *	crc_ccitt_false - recompute the CRC (CRC-CCITT-FALSE variant)
+ *	for the data buffer
+ *	@crc: previous CRC value
+ *	@buffer: data pointer
+ *	@len: number of bytes in the buffer
+ */
+u16 crc_ccitt_false(u16 crc, u8 const *buffer, size_t len)
+{
+	while (len--)
+		crc = crc_ccitt_false_byte(crc, *buffer++);
+	return crc;
+}
+EXPORT_SYMBOL(crc_ccitt_false);
+
 MODULE_DESCRIPTION("CRC-CCITT calculations");
 MODULE_LICENSE("GPL");
_

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
