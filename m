From: Chen-Yu Tsai <wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/6] nvmem: sunxi_sid: Read out data in native format
Date: Mon, 18 Mar 2019 15:33:52 +0800
Message-ID: <20190318073354.12151-5-wens@kernel.org>
References: <20190318073354.12151-1-wens@kernel.org>
Reply-To: wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB54TXXSAKGQEHNC44RY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190318073354.12151-1-wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Originally the SID e-fuses were thought to be in big-endian format.
Later sources show that they are in fact native or little-endian.
The most compelling evidence is the thermal sensor calibration data,
which is a set of one to three 16-bit values. In native-endian they
are in 16-bit cells with increasing offsets, whereas with big-endian
they are in the wrong order, and a gap with no data will show if there
are one or three cells.

Switch to a native endian representation for the nvmem device. For the
H3, the register read-out method was already returning data in native
endian. This only affects the other SoCs.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/nvmem/sunxi_sid.c | 23 +----------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
index 75c1f48cb3d0..14c114620ed6 100644
--- a/drivers/nvmem/sunxi_sid.c
+++ b/drivers/nvmem/sunxi_sid.c
@@ -46,33 +46,12 @@ struct sunxi_sid {
 	u32			value_offset;
 };
 
-/* We read the entire key, due to a 32 bit read alignment requirement. Since we
- * want to return the requested byte, this results in somewhat slower code and
- * uses 4 times more reads as needed but keeps code simpler. Since the SID is
- * only very rarely probed, this is not really an issue.
- */
-static u8 sunxi_sid_read_byte(const struct sunxi_sid *sid,
-			      const unsigned int offset)
-{
-	u32 sid_key;
-
-	sid_key = ioread32be(sid->base + round_down(offset, 4));
-	sid_key >>= (offset % 4) * 8;
-
-	return sid_key; /* Only return the last byte */
-}
-
 static int sunxi_sid_read(void *context, unsigned int offset,
 			  void *val, size_t bytes)
 {
 	struct sunxi_sid *sid = context;
-	u8 *buf = val;
-
-	/* Offset the read operation to the real position of SID */
-	offset += sid->value_offset;
 
-	while (bytes--)
-		*buf++ = sunxi_sid_read_byte(sid, offset++);
+	memcpy_fromio(val, sid->base + sid->value_offset + offset, bytes);
 
 	return 0;
 }
-- 
2.20.1
