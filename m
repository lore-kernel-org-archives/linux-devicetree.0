From: Chen-Yu Tsai <wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/6] nvmem: sunxi_sid: Dynamically allocate
 nvmem_config structure
Date: Mon, 18 Mar 2019 15:33:51 +0800
Message-ID: <20190318073354.12151-4-wens@kernel.org>
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

The sunxi_sid driver currently uses a statically allocated nvmem_config
structure that is updated at probe time. This is sub-optimal as it
limits the driver to one instance, and also takes up space even if the
device is not present.

Modify the driver to allocate the nvmem_config structure at probe time,
plugging in the desired parameters along the way.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/nvmem/sunxi_sid.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
index 15fbfab62595..75c1f48cb3d0 100644
--- a/drivers/nvmem/sunxi_sid.c
+++ b/drivers/nvmem/sunxi_sid.c
@@ -35,13 +35,6 @@
 #define SUN8I_SID_OP_LOCK	(0xAC << 8)
 #define SUN8I_SID_READ		BIT(1)
 
-static struct nvmem_config econfig = {
-	.name = "sunxi-sid",
-	.read_only = true,
-	.stride = 4,
-	.word_size = 1,
-};
-
 struct sunxi_sid_cfg {
 	u32	value_offset;
 	u32	size;
@@ -150,6 +143,7 @@ static int sunxi_sid_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct resource *res;
+	struct nvmem_config *nvmem_cfg;
 	struct nvmem_device *nvmem;
 	struct sunxi_sid *sid;
 	int size;
@@ -172,14 +166,23 @@ static int sunxi_sid_probe(struct platform_device *pdev)
 
 	size = cfg->size;
 
-	econfig.size = size;
-	econfig.dev = dev;
+	nvmem_cfg = devm_kzalloc(dev, sizeof(*nvmem_cfg), GFP_KERNEL);
+	if (!nvmem_cfg)
+		return -ENOMEM;
+
+	nvmem_cfg->dev = dev;
+	nvmem_cfg->name = "sunxi-sid";
+	nvmem_cfg->read_only = true;
+	nvmem_cfg->size = cfg->size;
+	nvmem_cfg->word_size = 1;
+	nvmem_cfg->stride = 4;
+	nvmem_cfg->priv = sid;
 	if (cfg->need_register_readout)
-		econfig.reg_read = sun8i_sid_read_by_reg;
+		nvmem_cfg->reg_read = sun8i_sid_read_by_reg;
 	else
-		econfig.reg_read = sunxi_sid_read;
-	econfig.priv = sid;
-	nvmem = devm_nvmem_register(dev, &econfig);
+		nvmem_cfg->reg_read = sunxi_sid_read;
+
+	nvmem = devm_nvmem_register(dev, nvmem_cfg);
 	if (IS_ERR(nvmem))
 		return PTR_ERR(nvmem);
 
@@ -187,8 +190,7 @@ static int sunxi_sid_probe(struct platform_device *pdev)
 	if (!randomness)
 		return -ENOMEM;
 
-	econfig.reg_read(sid, 0, randomness, size);
-
+	nvmem_cfg->reg_read(sid, 0, randomness, size);
 	add_device_randomness(randomness, size);
 	kfree(randomness);
 
-- 
2.20.1
