From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH v3 1/6] dt-bindings: media: sun6i: Add A64 CSI compatible
Date: Mon, 10 Dec 2018 17:22:41 +0530
Message-ID: <20181210115246.8188-2-jagan@amarulasolutions.com>
References: <20181210115246.8188-1-jagan@amarulasolutions.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBO5HXHQAKGQEIDDGHDI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181210115246.8188-1-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner A64 CSI has single channel time-multiplexed BT.656
CMOS sensor interface like H3 but work by lowering clock than
default mod clock.

Add a compatible string for it.

Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
---
 Documentation/devicetree/bindings/media/sun6i-csi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/sun6i-csi.txt b/Documentation/devicetree/bindings/media/sun6i-csi.txt
index cc37cf7fd051..376aade669a1 100644
--- a/Documentation/devicetree/bindings/media/sun6i-csi.txt
+++ b/Documentation/devicetree/bindings/media/sun6i-csi.txt
@@ -7,6 +7,7 @@ Required properties:
   - compatible: value must be one of:
     * "allwinner,sun6i-a31-csi"
     * "allwinner,sun8i-h3-csi"
+    * "allwinner,sun50i-a64-csi"
     * "allwinner,sun8i-v3s-csi"
   - reg: base address and size of the memory-mapped region.
   - interrupts: interrupt associated to this IP
-- 
2.18.0.321.gffc6fa0e3
