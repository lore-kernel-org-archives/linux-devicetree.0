From: Jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 1/2] ASoC: rockchip-max98090: add documentation for rockchip-max98090 driver
Date: Fri, 12 Sep 2014 15:30:36 +0800
Message-ID: <1410507036-15442-1-git-send-email-jay.xu@rock-chips.com>
References: <1410506806-15327-1-git-send-email-jay.xu@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410506806-15327-1-git-send-email-jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-l3A5Bk7waGM@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add documentation for rockchip-max98090 driver, which is need by rockchip
board using a max98090.

Signed-off-by: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 .../sound/rockchip,rockchip-audio-max98090.txt     | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-max98090.txt

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-max98090.txt b/Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-max98090.txt
new file mode 100644
index 0000000..1aa300e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-max98090.txt
@@ -0,0 +1,23 @@
+ROCKCHIP audio complex, with MAX98090 CODEC
+
+Required properties:
+- compatible : must be "rockchip,rockchip-audio-max98090"
+- rockchip,model : the user-visible name of this sound complex
+- rockchip,i2s-controller : The phandle of the Tegra I2S controller that's
+  connected to the CODEC.
+- rockchip,audio-codec : The phandle of the MAX98090 audio codec.
+
+Optional properties:
+- rockchip,hp-det-gpios : The GPIO that detect headphones are plugged in
+- rockchip,mic-det-gpios : The GPIO that detect micphones are plugged in
+
+Example:
+
+sound {
+	compatible = "rockchip,rockchip-audio-max98090";
+	rockchip,model = "ROCKCHIP-I2S";
+	rockchip,i2s-controller = <&i2s>;
+	rockchip,audio-codec = <&max98090>;
+	rockchip,hp-det-gpios = <&gpio6 5 GPIO_ACTIVE_HIGH>;
+	rockchip,mic-det-gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
+};
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
