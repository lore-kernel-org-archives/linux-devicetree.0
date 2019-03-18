From: Chen-Yu Tsai <wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/6] nvmem: sunxi_sid: Optimize register
 read-out method
Date: Mon, 18 Mar 2019 15:33:50 +0800
Message-ID: <20190318073354.12151-3-wens@kernel.org>
References: <20190318073354.12151-1-wens@kernel.org>
Reply-To: wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB6UTXXSAKGQEVCIRYMI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

SID cells are 32-bit aligned, and a multiple of 32 bits in length. The
only outlier is the thermal sensor calibration data, which is 16 bits
per sensor. However a whole 64 bits is allocated for this purpose, so
we could consider it conforming to the rule above.

Also, the register read-out method assumes native endian, unlike the
direct MMIO method, which assumes big endian. Thus no endian conversion
is involved.

Under these assumptions, the register read-out method can be slightly
optimized. Instead of reading one word then discarding 3 bytes, read
the whole word directly into the buffer. However, for reads under 4
bytes or trailing bytes, we still use a scratch buffer to extract the
requested bytes.

We could go one step further if .word_size was 4, but changing that
would affect the sysfs interface's behavior.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/nvmem/sunxi_sid.c | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
index 704c35edf796..15fbfab62595 100644
--- a/drivers/nvmem/sunxi_sid.c
+++ b/drivers/nvmem/sunxi_sid.c
@@ -115,36 +115,34 @@ static int sun8i_sid_register_readout(const struct sunxi_sid *sid,
  * to be not reliable at all.
  * Read by the registers instead.
  */
-static int sun8i_sid_read_byte_by_reg(const struct sunxi_sid *sid,
-				      const unsigned int offset,
-				      u8 *out)
-{
-	u32 word;
-	int ret;
-
-	ret = sun8i_sid_register_readout(sid, offset & ~0x03, &word);
-
-	if (ret)
-		return ret;
-
-	*out = (word >> ((offset & 0x3) * 8)) & 0xff;
-
-	return 0;
-}
-
 static int sun8i_sid_read_by_reg(void *context, unsigned int offset,
 				 void *val, size_t bytes)
 {
 	struct sunxi_sid *sid = context;
-	u8 *buf = val;
+	u32 word;
 	int ret;
 
-	while (bytes--) {
-		ret = sun8i_sid_read_byte_by_reg(sid, offset++, buf++);
+	/* .stride = 4 so offset is guaranteed to be aligned */
+	while (bytes >= 4) {
+		ret = sun8i_sid_register_readout(sid, offset, val);
 		if (ret)
 			return ret;
+
+		val += 4;
+		offset += 4;
+		bytes -= 4;
 	}
 
+	if (!bytes)
+		return 0;
+
+	/* Handle any trailing bytes */
+	ret = sun8i_sid_register_readout(sid, offset, &word);
+	if (ret)
+		return ret;
+
+	memcpy(val, &word, bytes);
+
 	return 0;
 }
 
-- 
2.20.1
