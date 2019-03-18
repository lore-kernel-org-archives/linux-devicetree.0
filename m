From: Chen-Yu Tsai <wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/6] nvmem: sunxi_sid: Read out SID for
 randomness without looping
Date: Mon, 18 Mar 2019 15:33:49 +0800
Message-ID: <20190318073354.12151-2-wens@kernel.org>
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

Since the reg_read callbacks already support arbitrary, but 4-byte
aligned. offsets and lengths into the SID, there is no need for another
for loop just to use it to read 1 byte at a time.

Read out the whole SID block in one go.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/nvmem/sunxi_sid.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
index 570a2e354f30..704c35edf796 100644
--- a/drivers/nvmem/sunxi_sid.c
+++ b/drivers/nvmem/sunxi_sid.c
@@ -154,7 +154,7 @@ static int sunxi_sid_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct nvmem_device *nvmem;
 	struct sunxi_sid *sid;
-	int i, size;
+	int size;
 	char *randomness;
 	const struct sunxi_sid_cfg *cfg;
 
@@ -189,8 +189,7 @@ static int sunxi_sid_probe(struct platform_device *pdev)
 	if (!randomness)
 		return -ENOMEM;
 
-	for (i = 0; i < size; i++)
-		econfig.reg_read(sid, i, &randomness[i], 1);
+	econfig.reg_read(sid, 0, randomness, size);
 
 	add_device_randomness(randomness, size);
 	kfree(randomness);
-- 
2.20.1
