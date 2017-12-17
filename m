From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/5] media: dt: bindings: Update binding
 documentation for sunxi IR controller
Date: Sun, 17 Dec 2017 23:45:44 +0100
Message-ID: <20171217224547.21481-3-embed3d@gmail.com>
References: <20171217224547.21481-1-embed3d@gmail.com>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD257DPK24NRBIPH3PIQKGQEMT6CG5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171217224547.21481-1-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch updates documentation for Device-Tree bindings for sunxi IR
controller and adds the new optional property for the base clock
frequency.

Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/media/sunxi-ir.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/sunxi-ir.txt b/Documentation/devicetree/bindings/media/sunxi-ir.txt
index 91648c569b1e..9f45bab07d6e 100644
--- a/Documentation/devicetree/bindings/media/sunxi-ir.txt
+++ b/Documentation/devicetree/bindings/media/sunxi-ir.txt
@@ -11,6 +11,7 @@ Required properties:
 Optional properties:
 - linux,rc-map-name: see rc.txt file in the same directory.
 - resets : phandle + reset specifier pair
+- clock-frequency  : overrides the default base clock frequency (8 MHz)
 
 Example:
 
@@ -18,6 +19,7 @@ ir0: ir@1c21800 {
 	compatible = "allwinner,sun4i-a10-ir";
 	clocks = <&apb0_gates 6>, <&ir0_clk>;
 	clock-names = "apb", "ir";
+	clock-frequency = <3000000>;
 	resets = <&apb0_rst 1>;
 	interrupts = <0 5 1>;
 	reg = <0x01C21800 0x40>;
-- 
2.11.0
